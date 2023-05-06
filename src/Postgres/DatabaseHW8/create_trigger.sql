/*
Создать триггер, который позволяет только увеличивать размер фонда финансирования факультета.

  нужно выполнять функцию check_account_update() каждый раз до обновления таблицы faculties:
  устанавливаете дополнительное условие. Функция должна выполняться только в том случае, если обновляется столбец financing
  в таблице faculties
*/
-- 1
CREATE OR REPLACE FUNCTION check_financing_update() returns TRIGGER AS
$$
 begin

	if new.financing > old.financing then return new;
 end if;
      return null;

 end;
$$
language 'plpgsql';

--2
https://postgrespro.ru/docs/postgresql/14/plpgsql-trigger

create trigger check_update_faculties before
update
    of financing on
    public.faculties for each row execute procedure check_financing_update();
--3
DROP TRIGGER IF EXISTS check_update_faculties ON faculties

--***************************************************************************************************
--  Создать триггер, который фиксирует в журнале сведений о преподавателях все операции манипулирования, производимые над таблицей преподавателей
--************************************************************************************************************************************
create OR REPLACE FUNCTION process_teacher_audit() RETURNS TRIGGER as
$$
   DECLARE
   	v_id integer;
  	tch_id integer;
    BEGIN
        IF (TG_OP = 'DELETE') then
            tch_id = old.id; -- получить id удаленной записи
            INSERT into teacher_manipulations (id, emplayment_date, action_id, teacher_id) values(default, now(),
                   (SELECT id from actions where name = 'Delete'), tch_id) --выбрать id операции
                   RETURNING id into v_id; --получить id добавленной записи

           INSERT into teacher_deleteinfos (id, emplayment_date, name, salary, surname, manipulation_id )
						values(default, old.emplayment_date,
										old.name,
										old.salary,
										old.surname,
										v_id);

            RETURN OLD;
        ELSIF (TG_OP = 'UPDATE') THEN
            INSERT INTO teacher_manipulations (id, emplayment_date, action_id, teacher_id) values(default, now(), (SELECT id from actions where name = 'Edit'), old.id);
            RETURN NEW;
        ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO teacher_manipulations (id, emplayment_date, action_id, teacher_id) values(default, now(), (SELECT id from actions where name = 'Insert'), new.id);
            RETURN NEW;
        END IF;
        RETURN NULL; -- result is ignored since this is an AFTER trigger
    END;
$$
LANGUAGE 'plpgsql';


CREATE TRIGGER teachers_audit
AFTER INSERT OR UPDATE OR DELETE ON teachers
    FOR EACH ROW EXECUTE PROCEDURE process_teacher_audit();