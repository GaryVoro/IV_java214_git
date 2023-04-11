1. Вывести все возможные пары строк преподавателей и групп.
SELECT  teachers.name,  teachers.surname,  groups.name FROM    lectures
  INNER JOIN  teachers ON ( lectures.teacher_id =  teachers.id)
  INNER JOIN  groups_lectures ON ( lectures.id =  groups_lectures.lectured_id)
  INNER JOIN  groups ON ( groups_lectures.group_id =  groups.id)
  
2. Вывести названия факультетов, фонд финансирования кафедр которых превышает фонд финансирования
факультета.
SELECT  faculties.name,  departments.financing FROM  departments
  INNER JOIN  faculties ON ( departments.faculty_id =  faculties.id)
WHERE departments.financing > faculties.financing

3. Вывести фамилии кураторов групп и названия групп, которые они курируют.
SELECT  curators.name,  curators.surname,  groups.name FROM
 groups_curators INNER JOIN  curators ON ( groups_curators.curator_id =  curators.id)
INNER JOIN  groups ON ( groups_curators.group_id =  groups.id)

4. Вывести имена и фамилии преподавателей, которые читают лекции у группы “150А”.
SELECT teachers.name, teachers.surname, groups.name FROM lectures
  INNER JOIN teachers ON (lectures.teacher_id = teachers.id)
  INNER JOIN groups_lectures ON (lectures.id = groups_lectures.lectured_id)
  INNER JOIN groups ON (groups_lectures.group_id = groups.id)
WHERE groups.name = '150А'

5. Вывести фамилии преподавателей и названия факультетов на которых они читают лекции.
SELECT teachers.name, teachers.surname, faculties.name FROM lectures
  INNER JOIN  teachers ON ( lectures.teacher_id =  teachers.id)
  INNER JOIN  groups_lectures ON ( lectures.id =  groups_lectures.lectured_id)
  INNER JOIN  groups ON ( groups_lectures.group_id =  groups.id)
  INNER JOIN  departments ON ( groups.department_id =  departments.id)
  INNER JOIN  faculties ON ( departments.faculty_id =  faculties.id)

6. Вывести названия кафедр и названия групп, которые к ним относятся.
SELECT  departments.name,  groups.name FROM  groups
  INNER JOIN  departments ON ( groups.department_id =  departments.id)

7. Вывести названия дисциплин, которые читает преподаватель “Samantha Adams”.
SELECT  subject.name FROM  lectures
  INNER JOIN  subject ON ( lectures.subject_id =  subject.id)
  INNER JOIN  teachers ON ( lectures.teacher_id =  teachers.id)
WHERE  teachers.name = 'Samantha' AND  teachers.surname = 'Adams'

8. Вывести названия кафедр, на которых читается дисциплина “Теория БД”.
SELECT  departments.name,  subject.name FROM  groups
  INNER JOIN  departments ON ( groups.department_id =  departments.id)
  INNER JOIN  groups_lectures ON ( groups.id =  groups_lectures.group_id)
  INNER JOIN  lectures ON ( groups_lectures.lectured_id =  lectures.id)
  INNER JOIN  subject ON ( lectures.subject_id =  subject.id)
WHERE
   subject.name = 'Теория БД'

9. Вывести названия групп, которые относятся к факультету “исторический”.
SELECT  groups.name FROM  faculties 
  INNER JOIN  departments ON ( faculties.id =  departments.faculty_id)
  INNER JOIN  groups ON ( departments.id =  groups.department_id)
WHERE  faculties.name = 'исторический'

10. Вывести названия групп 5-го курса, а также название факультетов, к которым они относятся.
SELECT  groups.name,  groups.course,  faculties.name FROM  groups
  INNER JOIN  departments ON ( groups.department_id =  departments.id)
  INNER JOIN  faculties ON ( departments.faculty_id =  faculties.id)
WHERE  groups.course = 5

11. Вывести полные имена преподавателей и лекции, которые они читают (названия дисциплин и групп), причем отобрать
только те лекции, которые читаются в аудитории “12”.
SELECT  teachers.name,  teachers.surname,  subject.name FROM  teachers
  INNER JOIN  lectures ON ( teachers.id =  lectures.teacher_id)
  INNER JOIN  subject ON ( lectures.subject_id =  subject.id)
WHERE  lectures.lecture_room = '12'
