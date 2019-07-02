# 1.查询同时存在1课程和2课程的情况
select * from student_course where courseId = 1 UNION select * from student_course where courseId = 2

# 2.查询同时存在1课程和2课程的情况
select * from student_course where courseId = 1 UNION select * from student_course where courseId = 2

# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
select s.id, s.name, avg(sc.score) 平均成绩 from student s, course c, student_course sc where s.id = sc.studentId and c.id = sc.courseId group by s.id
having avg(sc.score) >= 60;
	
# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
select * from student where id not in (select studentId from student_course);

# 5.查询所有有成绩的SQL
select s.name, c.name, sc1.score from student s, course c, student_course sc1 where s.id = sc1.studentId and c.id = sc1.courseId;

# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
select * from student s where s.id in (select studentId from student_course sc where sc.courseId = '1')
and s.id in (select studentId from student_course sc where sc.courseId = '2')

# 7.检索1课程分数小于60，按分数降序排列的学生信息
select s.id, s.name, s.age, s.sex from student s inner join student_course sc on s.id=sc.studentId where sc.courseId ='1' and sc.score <60;

# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
select c.name 课程, avg(sc.score) 平均分 from course c, student_course sc where c.id = sc.courseId group by sc.courseId order by avg(sc.score) desc, sc.courseId;

# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
select s.name, sc.score from student s, course c, student_course sc where s.id = sc.studentId and c.id = sc.courseId and c.name='数学' and sc.score < 60;