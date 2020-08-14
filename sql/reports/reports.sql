-- SQL Statement that selects all students that are in the class with id 3
SELECT *
FROM students
WHERE student_id IN (SELECT fk_student_id
                     from enrollments
                     WHERE fk_class_id = 3);

-- SQL Statement that selects all students that are in the class with the name "2a"
SELECT *
FROM students
WHERE student_id IN (SELECT fk_student_id
                     from enrollments
                     WHERE fk_class_name = "2a");