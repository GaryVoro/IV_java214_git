1. Вывести таблицу кафедр, но расположить ее поля в об-
ратном порядке.

SELECT * FROM public.departments ORDER BY id ASC

2. Вывести названия групп и их рейтинги с уточнением имен
полей именем таблицы.

SELECT name as "groups.name", raiting as "groups.raiting" FROM public.groups;

3. Вывести для преподавателей их фамилию, процент ставки
по отношению к надбавке и процент ставки по отношению
к зарплате (сумма ставки и надбавки).
SELECT name, surname, premium, salary, premium::numeric/salary::numeric*100, (premium::numeric + salary::numeric)/salary::numeric*100
 FROM public.teachers;

 4. Вывести таблицу факультетов в виде одного поля в сле-
дующем формате: “The dean of faculty [faculty] is [dean].”
Select concat(dean, name) As "The dean of faculty" From faculties

5. Вывести фамилии преподавателей, которые являются про-
фессорами и ставка которых превышает 200.
SELECT surname FROM public.teachers WHERE is_professor = 1 AND salary > 200

6. Вывести названия кафедр, фонд финансирования которых
меньше 11000 или больше 25000.
SELECT name FROM public.departments WHERE financing::NUMERIC < 21000 AND financing::NUMERIC > 12000

7. Вывести названия факультетов кроме факультета “математический”.
Select dean, name From faculties WHERE name != 'математический'

8. Вывести фамилии и должности преподавателей, которые
не являются профессорами.
SELECT surname FROM public.teachers WHERE is_professor = 0;

9. Вывести фамилии, должности, ставки и надбавки асси-
стентов, у которых надбавка в диапазоне от 100 до 200.
SELECT surname, position_d, salary, premium FROM public.teachers WHERE is_assistant = 1 AND (premium::numeric > 100 AND premium::numeric < 200);

10. Вывести фамилии и ставки ассистентов.
SELECT surname, salary FROM public.teachers WHERE is_assistant = 1;

11. Вывести фамилии и должности преподавателей, которые
были приняты на работу до 01.01.2013.
SELECT surname, position_d FROM public.teachers WHERE emplayment_date < '2013-01-01'::date;

12. Вывести названия кафедр, которые в алфавитном порядке располагаются до кафедры
“истории”. Выводимое поле должно иметь название “Name of Department”.
SELECT name As "Name of Department" FROM public.departments ORDER BY name ASC LIMIT (SELECT id FROM public.departments WHERE departments.name = 'Истории') - 1;

13. Вывести фамилии ассистентов, имеющих зарплату (сумма ставки и надбавки) не более 245.
SELECT surname as family FROM public.teachers WHERE is_assistant = 1 AND (premium::numeric + salary::numeric  < 350);

14. Вывести названия групп 5-го курса, имеющих рейтинг в диапазоне от 2 до 4.
SELECT name FROM public.groups WHERE course = 5 AND (raiting >= 2 AND raiting <= 4);

15. Вывести фамилии ассистентов со ставкой меньше 550 или надбавкой меньше 200.
SELECT surname FROM public.teachers WHERE is_assistant = 1 AND (salary::numeric < 550 AND premium::numeric < 200);