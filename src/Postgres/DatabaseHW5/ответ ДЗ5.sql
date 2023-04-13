1. Вывести количество преподавателей кафедры “Математики”.
SELECT COUNT( lectures.teacher_id) AS "Количество преподавателей",
   departments.name AS "Кафедра"
FROM  lectures
  INNER JOIN  groups_lectures ON ( lectures.id =  groups_lectures.lectured_id)
  INNER JOIN  groups ON ( groups_lectures.group_id =  groups.id)
  INNER JOIN  departments ON ( groups.department_id =  departments.id)
WHERE  departments.name = 'Математики' GROUP BY  departments.name

SELECT COUNT( lectures.teacher_id) AS "Количество преподавателей",
   departments.name AS "Кафедра" FROM  lectures,  departments, groups_lectures,
  groups, teachers
WHERE
  teachers.id = lectures.teacher_id AND 
  lectures.id = groups_lectures.lectured_id AND 
  groups_lectures.id = groups.id AND 
  groups.department_id = departments.id AND 
  departments.name = 'Математики'
GROUP BY
   departments.name

2. Вывести количество лекций, которые читает преподаватель “Григорий Мировицкий”.
SELECT 
  COUNT(groups_lectures.id) AS "Количество лекций",
  concat(teachers.name, ' ', teachers.surname) AS "Преподаватель"
FROM
  groups_lectures,
  lectures,
  teachers
WHERE
  lectures.id = groups_lectures.lectured_id AND 
  teachers.id = lectures.teacher_id AND 
  teachers.surname = 'Мировицкий'
GROUP BY
  "Преподаватель"

3. Вывести количество занятий, проводимых в аудитории “12”.
SELECT 
  COUNT( lectures.lecture_room) AS "Количество занятий",
   lectures.lecture_room AS Аудитория
FROM
   lectures
WHERE
   lectures.lecture_room = '12'
GROUP BY
   lectures.lecture_room

4. Вывести названия аудиторий и количество лекций, проводимых в них.
SELECT 
   lectures.lecture_room As "Номер аудитории",
  COUNT( groups_lectures.lectured_id) AS "Кол лекций"
FROM
   lectures
  INNER JOIN  groups_lectures ON ( lectures.id =  groups_lectures.lectured_id)
GROUP BY
  "Номер аудитории"
  
5. Вывести количество студентов, посещающих лекции преподавателя “Мировицкий”.
SELECT 
   teachers.surname AS Преподаватель,
  SUM( groups.number_students) AS "Кол-во студентов"
FROM
   groups
  INNER JOIN  groups_lectures ON ( groups.id =  groups_lectures.group_id)
  INNER JOIN  lectures ON ( groups_lectures.lectured_id =  lectures.id)
  INNER JOIN  teachers ON ( lectures.teacher_id =  teachers.id)
WHERE
   teachers.surname = 'Мировицкий'
GROUP BY
Преподаватель

6. Вывести среднюю ставку преподавателей факультета “Исторический”.
SELECT 
   faculties.name,
  AVG( teachers.salary) AS field_1
FROM
   teachers
  INNER JOIN  lectures ON ( teachers.id =  lectures.teacher_id)
  INNER JOIN  groups_lectures ON ( lectures.id =  groups_lectures.lectured_id)
  INNER JOIN  groups ON ( groups_lectures.group_id =  groups.id)
  INNER JOIN  departments ON ( groups.department_id =  departments.id)
  INNER JOIN  faculties ON ( departments.faculty_id =  faculties.id)
WHERE
   faculties.name = 'исторический'
GROUP BY
   faculties.name

7. Вывести минимальное и максимальное количество студентов среди всех групп.
SELECT 
  MIN( groups.number_students) AS Минимальное,
  MAX( groups.number_students) AS Максимальное
FROM
   groups
  
8. Вывести средний фонд финансирования кафедр.
SELECT   
  SUM( departments.financing) / COUNT( departments.financing) AS "Средний фонд финансирования"
FROM
   departments
GROUP BY
departments.financing

9. Вывести полные имена преподавателей и количество читаемых ими дисциплин.
SELECT 
   teachers.name,
   teachers.surname,
  COUNT( subject.id) AS "Количество дисциплин"
FROM
   teachers
  INNER JOIN  lectures ON ( teachers.id =  lectures.teacher_id)
  INNER JOIN  subject ON ( lectures.subject_id =  subject.id)
GROUP BY
   teachers.name,
   teachers.surname

10. Вывести количество лекций в каждый день недели.
SELECT 
  COUNT( lecture_day.id_lecture) AS field_1,
   lecture_day.day
FROM
   lecture_day
GROUP BY
   lecture_day.day
  
11. Вывести номера аудиторий и количество кафедр, чьи лекции в них читаются.  
  /*
  SELECT DISTINCT 
   lectures.lecture_room AS field_1,
   departments.name
FROM
   lectures
  INNER JOIN  groups_lectures ON ( lectures.id =  groups_lectures.lectured_id)
  INNER JOIN  groups ON ( groups_lectures.group_id =  groups.id)
  INNER JOIN  departments ON ( groups.department_id =  departments.id)
  */
  
  SELECT lectures.lecture_room as номер_аудитории, count(lectures.lecture_room) as кол_кафедр FROM  lectures  
  WHERE lectures.lecture_room IN (SELECT DISTINCT 
   lectures.lecture_room
FROM
   lectures
  INNER JOIN  groups_lectures ON ( lectures.id =  groups_lectures.lectured_id)
  INNER JOIN  groups ON ( groups_lectures.group_id =  groups.id)
  INNER JOIN  departments ON ( groups.department_id =  departments.id))
  GROUP BY lectures.lecture_room  
  
12. Вывести названия факультетов и количество дисциплин, которые на них читаются.
ELECT DISTINCT 
   faculties.name,
  COUNT( subject.name) AS field_1
FROM
   faculties
  INNER JOIN  departments ON ( faculties.id =  departments.faculty_id)
  INNER JOIN  groups ON ( departments.id =  groups.department_id)
  INNER JOIN  groups_lectures ON ( groups.id =  groups_lectures.group_id)
  INNER JOIN  lectures ON ( groups_lectures.lectured_id =  lectures.id)
  INNER JOIN  subject ON ( lectures.subject_id =  subject.id)
GROUP BY
   faculties.name
   
   ------------------------------ THE END ------------------------------------