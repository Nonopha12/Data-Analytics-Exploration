DROP TABLE IF EXISTS Address;

CREATE TABLE Address (
address_id INT PRIMARY KEY,
street VARCHAR(30) NOT NULL,
city VARCHAR(30) NOT NULL,
province VARCHAR(30) NOT NULL,
postal_code CHAR(4) NOT NULL,
country VARCHAR(30) NOT NULL);

INSERT INTO Address 
VALUES
(1, 'Happy Street', 'Durban', 'KZN', '1020', 'South Africa'),
(2, 'Donald Murray Ave', 'Cape Town', 'WC', '1030', 'South Africa'),
(3, 'Cnr Lois & Dely Road', 'Cape Town', 'WC', '1030', 'South Africa'),
(4, 'Van Der Merwe Ave', 'Johannesberg', 'GP', '1040', 'South Africa'),
(5, 'Rivonia Blvd', 'Cape Town', 'WC', '1030', 'South Africa'),
(6, '5th St', 'Durban', 'KZN', '1020', 'South Africa'),
(7, '3 Church Square', 'Durban', 'KZN', '1020', 'South Africa'),
(8, '25 True North Rd', 'Johannesberg', 'GP', '1040', 'South Africa'),
(9, '205 Oos St', 'Cape Town', 'KZN', '1020', 'South Africa'),
(10, '39 Gwigwi Mrwebi St', 'Johannesberg', 'GP', '1040', 'South Africa'),
(11, '16 Clough St', 'Cape Town', 'WC', '1030', 'South Africa'),
(12, '50 Kloof St', 'Durban', 'KZN', '1020', 'South Africa'),
(13, '15 President St', 'Johannesberg', 'GP', '1040', 'South Africa'),
(14, 'Oude Molen Rd', 'Cape Town', 'WC', '1030', 'South Africa'),
(15, '427 Lilian Ngoyi Rd', 'Cape Town', 'WC', '1030', 'South Africa'),
(16, 'Maxwell Dr', 'Johannesberg', 'GP', '1040', 'South Africa'),
(17, 'V & A Waterfront', 'Johannesberg', 'GP', '1040', 'South Africa'),
(18, 'Cavendish St', 'Cape Town', 'WC', '1030', 'South Africa'),
(19, 'Maple St', 'Durban', 'KZN', '1020', 'South Africa'),
(20, '13 Kalk Ave', 'Durban', 'KZN', '1020', 'South Africa'),
(21, 'Point Road', 'Durban', 'KZN', '1020', 'South Africa'),
(22, '210 Loop St', 'Cape Town', 'WC', '1030', 'South Africa'),
(23, '121 High St', 'Johannesberg', 'GP', '1040', 'South Africa'),
(24, '210 Long St', 'Durban', 'KZN', '1020', 'South Africa'),
(25, 'Valley Rd', 'Cape Town', 'WC', '1030', 'South Africa'),
(26, 'Fifth St', 'Johannesberg', 'GP', '1040', 'South Africa'),
(27, 'Martin Hammerschlag Way', 'Johannesberg', 'GP', '1040', 'South Africa'),
(28, '2nd Ave', 'Durban', 'KZN', '1020', 'South Africa'),
(29, 'Garden Route', 'Cape Town', 'WC', '1030', 'South Africa'),
(30, '68 Kloof St', 'Johannesberg', 'GP', '1040', 'South Africa'),
(31, 'Northern Park Way', 'Johannesberg', 'GP', '1040', 'South Africa'),
(32, 'Scott St', 'Cape Town', 'WC', '1030', 'South Africa'),
(33, 'Church Square', 'Johannesberg', 'GP', '1040', 'South Africa');



DROP TABLE IF EXISTS Student;

CREATE TABLE Student (
student_id CHAR(13) PRIMARY KEY,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
email varchar(30) NOT NULL,
address_id INTEGER NOT NULL,

FOREIGN KEY(address_id) REFERENCES Address(address_id));

INSERT INTO Student 
VALUES
('JV00100200304', 'Johnny', 'Valker', 'jv@email.com', 10),
('JS00100200305', 'Jack', 'Sparrow', 'js@blackpearl.com', 11),
('LM00100200306', 'Luffy', 'Monkey', 'pking@linegrand.com', 12),
('PA00100200307', 'Paul', 'Atreides', 'paul@melange.com', 13),
('LA00100200308', 'Leto', 'Atreides', 'leto@melange.com', 14),
('AT00100200309', 'Alan', 'Turing', 'whereis@myemail.com', 15),
('AL00100200310', 'Ada', 'Lovelace', 'motherof@computing.com', 16),
('PP00100200311', 'Peter', 'Parker', 'pp@marvel.com', 17),
('AS00100200312', 'Anthony', 'Stark', 'ironman@marvel.com', 18),
('KK00100200313', 'Kamala', 'Khan', 'ms@marvel.com', 19),
('CD00100200314', 'Carol', 'Danvers', 'captain@marvel.com', 20),
('DV00100200315', 'Darth', 'Vader', 'dv@deathstar.com', 21),
('AS00100200316', 'Anakin', 'Skywalker', 'ihatesand@deathstar.com', 22),
('LS00100200317', 'Leia', 'Skywalker', 'leader@rebels.com', 23),
('OK00100200318', 'Obi-Wan', 'Kenobi', 'hellothere@jedicouncil.com', 24),
('GG00100200319', 'Gandalf', 'Grey', 'youshall@notpass.com', 25),
('JB00100200320', 'Johnny', 'Bravo', 'jb@cn.com', 26),
('PB00100200321', 'Pinky', 'Brain', 'pinky@brain.com', 27),
('JS00100200322', 'John', 'Smith', 'doctor@who.com', 28),
('JS00100200323', 'Jane', 'Smith', 'professor@who.com', 29),
('EP00100200324', 'Elvis', 'Presley', 'elvis@elvis.com', 30),
('FM00100200325', 'Frederick', 'Mercury', 'rhapsody@queen.com', 31),
('BC00100200326', 'Benedict', 'Cumberbatch', 'benny@strange.com', 32),
('WT00100200327', 'Wimbledon', 'Tennismatch', 'wimbeldon@strange.com', 33);

DROP TABLE IF EXISTS Teacher;

CREATE TABLE Teacher (
teacher_id CHAR(6) PRIMARY KEY,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
email VARCHAR(30) NOT NULL,
address_id INTEGER NOT NULL,

FOREIGN KEY(address_id) REFERENCES Address(address_id));

INSERT INTO Teacher 
VALUES
('MP001', 'Monty', 'Python', 'montypython@tim.com', 1),
('FG002', 'Frank', 'Google', 'frank@google.com', 2),
('AN003', 'Andrew', 'Ng', 'dont@worry.com', 3),
('MZ004', 'Mark', 'Zuckerberg', 'zucc@facebook.com', 4),
('ZM005', 'Zucc', 'Markerberg', 'montypython@tim.com', 5),
('WG006', 'William', 'Gates', 'billy@ms.com', 6),
('SD007', 'Sata', 'Drivehard', 'western@digital.com', 7),
('JP008', 'Julia', 'Python', 'julia@python.com', 8),
('RJ009', 'Ruby', 'Java', 'ruby@java.com', 9);


DROP TABLE IF EXISTS Course;

CREATE TABLE Course (
course_code CHAR(5) PRIMARY KEY,
course_name VARCHAR(30) NOT NULL,
course_description text NOT NULL,
teacher_id CHAR(6) NOT NULL,
course_level INTEGER CHECK(course_level in (1, 2, 3)) NOT NULL,

FOREIGN KEY(teacher_id) REFERENCES Teacher(teacher_id));

INSERT INTO Course 
VALUES
('DS01', 'Python for Data Science', 'This course provides an introductory basis to learning Python.', 'MP001', 1),
('DS02', 'Data Analytics and Exploration', 'Techniques for exploring and manipulating data are covered here. This covers reading, converting, visualising, analysing and preprocessing data.', 'FG002', 2),
('DS03', 'Machine Learning', 'Introduces students to important machine learning concepts, enabling them to handle big data in a useful manner.', 'AN003', 3),
('WD01', 'Web Dev Fundamentals', 'Provides a basis to Javascript and all fundamental tools.', 'MZ004', 1),
('WD02', 'Web Dev Frameworks', 'This course aims to provie an understanding of all important frameworks in developing web apps.', 'ZM005', 2),
('WD03', 'Client-Server Programming', 'This course challenges students to use what they have learned to build complex web apps.', 'WG006', 3),
('DB01', 'Files', 'Provides a basis of file inputs and outputs as well as data storage.', 'SD007', 1),
('DB02', 'SQL', 'This is the sequel to DB01 - Files.', 'SD007', 2),
('DB03', 'Database Management', 'A course on how to be a database admin.', 'SD007', 3),
('SE01', 'Introduction to Programming', 'Provides the students with a simple programming language to get the basics.', 'JP008', 1),
('SE02', 'Advanced Programming', 'Touches on more advanced algorithms and data structures.', 'RJ009', 2),
('SE03', 'Software Engineering', 'An exploration of various development patterns and best practices.', 'JP008', 3);


DROP TABLE IF EXISTS StudentCourse;

CREATE TABLE StudentCourse (
student_id CHAR(13),
course_code CHAR(5),
mark INT,
is_complete BOOLEAN CHECK(is_complete IN (0, 1)), -- 0 for False, 1 for True

FOREIGN KEY(student_id) REFERENCES Student(student_id),
FOREIGN KEY(course_code) REFERENCES Course(course_code),
PRIMARY KEY(student_id, course_code));

INSERT INTO StudentCourse 
VALUES

('JV00100200304','DS02', 72, 1),
('JS00100200305','WD01', 21, 1),
('LM00100200306','WD03', 63, 1),
('PA00100200307','DS01', NULL, 0),
('LA00100200308','DS03', 81, 1),
('AT00100200309','SE01', 100, 1),
('AL00100200310','SE03', NULL, 0),
('PP00100200311','WD03', 77, 1),
('AS00100200312','SE02', 52, 1),
('KK00100200313','DS01', 88, 1),
('CD00100200314','WD02', 66, 1),
('DV00100200315','SE03', 40, 1),
('AS00100200316','SE02', 55, 1),
('LS00100200317','DS03', NULL, 0),
('OK00100200318','DS01', 92, 1),
('GG00100200319','WD02', 45, 1),
('JB00100200320','DB02', NULL, 0),
('PB00100200321','DS01', NULL, 0),
('JS00100200322','DB03', 72, 1),
('JS00100200323','DB03', NULL, 0),
('EP00100200324','SE01', 70, 1),
('FM00100200325','WD03', 69, 1),
('BC00100200326','DB01', 24, 1),
('WT00100200327','DB02', NULL, 0),
('JS00100200305','WD02', 26, 1),
('LM00100200306','WD02', 98, 1),
('AT00100200309','SE02', 50, 1),
('AL00100200310','DS01', 98, 1),
('PP00100200311','DB02', 77, 1),
('AS00100200312','WD01', NULL, 0),
('KK00100200313','DS02', 54, 1),
('CD00100200314','DS01', 98, 1),
('DV00100200315','DB02', 75, 1),
('LS00100200317','DB03', 70, 1),
('OK00100200318','SE02', NULL, 0),
('GG00100200319','DB01', 78, 1),
('JB00100200320','DS02', 78, 1),
('PB00100200321','DB02', 44, 1),
('JS00100200322','DS01', 62, 1),
('EP00100200324','WD03', 68, 1),
('FM00100200325','SE02', 69, 0),
('BC00100200326','WD02', 56, 1),
('WT00100200327','DS01', NULL, 0);


DROP TABLE IF EXISTS Review;

CREATE TABLE Review (
review_id INT PRIMARY KEY,
review_text TEXT NOT NULL,
completeness INT CHECK(completeness IN (1, 2, 3, 4)),
efficiency INT CHECK(efficiency IN (1, 2, 3, 4)),
style INT CHECK(style IN (1, 2, 3, 4)),
documentation INT CHECK(documentation IN (1, 2, 3, 4)),
student_id CHAR(13),
course_code CHAR(5),

FOREIGN KEY(student_id) REFERENCES StudentCourse(student_id),
FOREIGN KEY(course_code) REFERENCES StudentCourse(course_code)
);

INSERT INTO Review 
VALUES

(1, 'Needs work!', 1, 1, 1, 1, 'JV00100200304','DS02'),
(2, 'Documentation needed. Solution inefficient.', 3, 2, 4, 1, 'JS00100200305','WD01'),
(3, 'Well-documented, lots of comments and very efficient solution.', 4, 4, 4, 4, 'LM00100200306','WD03'),
(4, 'I can count to four!', 1, 2, 3, 4, 'PA00100200307','DS01'),
(5, 'Great code, but it is an unreadable mess!', 4, 4, 1, 1, 'LA00100200308','DS03'),
(6, 'Fantastically neat code, but it seems to miss the point', 1, 1, 4, 4, 'AT00100200309','SE01'),
(7, 'Perfect, well-styled code. Not a single comment', 4, 4, 4, 1, 'AL00100200310','SE03'),
(8, 'Excellent code, well-commented and well-styled. However, the task needs a Fizzbuzz solution, why have you created a Fibonacci method?', 1, 4, 4, 4, 'PP00100200311','WD03'),
(9, 'Absolutely terrible!', 1, 1, 1, 1, 'AS00100200312','SE02'),
(10, 'Your solution misses the point! That being said, it is great to see some well-structured code. Try adding in some comments.', 1, 1, 4, 1, 'KK00100200313','DS01'),
(11, 'Code is messy. You are very efficiently going the wrong way!', 1, 4, 1, 1, 'CD00100200314','WD02'),
(12, 'This code is nothing but comments!', 1, 1, 1, 4, 'DV00100200315','SE03'),
(13, 'I need coffee. . .', 1, 1, 1, 1, 'AS00100200316','SE02'),
(14, 'Great to see that you have an idea of best practices! You unfortunately did the wrong task, though. Try commenting your code as well.', 1, 4, 4, 1, 'LS00100200317','DS03'),
(15, 'Thank you for commenting your code! It is correct, but you could have done it in two lines, rather than 200.', 4, 1, 1, 4, 'OK00100200318','DS01'),
(16, 'You did not do the bonus task! Also, please comment your code.', 3, 2, 4, 1, 'GG00100200319','WD02'),
(17, 'You are on the right track, but just need to fix one or two issues. Also, your code is well-commented, but you need spaces to make it more readable.', 2, 4, 1, 4, 'JB00100200320','DB02'),
(18, 'Bill Gates material!', 4, 4, 4, 4, 'PB00100200321','DS01'),
(19, 'Certified database admin!', 4, 4, 4, 4, 'JS00100200322','DB03'),
(20, 'Have you considered going into cryptography? Your code is very cryptic.', 4, 1, 1, 1, 'JS00100200323','DB03'),
(21, ':)', 4, 4, 4, 4, 'EP00100200324','SE01'),
(22, 'Is this a 404 error? Because this is not in my domain.', 1, 1, 1, 1, 'FM00100200325','WD03'),
(23, 'You got the right answer, but did not store your data in a RAID 0 configuration with spatial redundancy and SQL injection protection.', 2, 1, 4, 4, 'BC00100200326','DB01'),
(24, '2b or !2b', 2, 2, 2, 2, 'WT00100200327','DB02'),
(25, 'Do you even know the difference between Java and Javascript? It is the same difference as car and carpet!', 1, 1, 1, 1, 'JS00100200305','WD02'),
(26, 'Eh, so-so.', 3, 2, 3, 2, 'LM00100200306','WD02'),
(27, 'Thank you for inventing computers!', 4, 4, 4, 4, 'AT00100200309','SE02'),
(28, 'Do not worry about it!', 2, 3,4, 4, 'AL00100200310','DS01'),
(29, 'Perfect!', 4, 4, 4, 4, 'PP00100200311','DB02'),
(30, 'Javascript is not for everybody', 1, 1, 1, 1, 'AS00100200312','WD01'),
(31, 'Great stuff!', 3, 4, 4, 4, 'KK00100200313','DS02'),
(32, 'On the right track. Needs commenting.', 2, 4, 4, 1, 'CD00100200314','DS01'),
(33, 'Great comments! You can just optimize in a few areas.', 4, 1, 4, 4, 'DV00100200315','DB02'),
(34, 'You did not pass!', 1, 1, 1, 1, 'GG00100200319','DB01'),
(35, ':(', 1, 1, 1, 1, 'EP00100200324','SE01'),
(36, 'I am something of a web developer myself.', 4, 4, 4, 4, 'PP00100200311','WD03');