-- 1. Drop and recreate the database to avoid duplicates
DROP DATABASE IF EXISTS DeadlineDB;
CREATE DATABASE DeadlineDB;
USE DeadlineDB;

-- 2. Tables

CREATE TABLE Branches (
  branch_id INT PRIMARY KEY AUTO_INCREMENT,
  branch_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Semesters (
  semester_id INT PRIMARY KEY AUTO_INCREMENT,
  semester_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Students (
  student_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  branch_id INT NOT NULL,
  semester_id INT NOT NULL,
  FOREIGN KEY (branch_id) REFERENCES Branches(branch_id) ON DELETE CASCADE,
  FOREIGN KEY (semester_id) REFERENCES Semesters(semester_id) ON DELETE CASCADE
);

CREATE TABLE Subjects (
  subject_id INT PRIMARY KEY AUTO_INCREMENT,
  subject_name VARCHAR(100) NOT NULL,
  branch_id INT NOT NULL,
  semester_id INT NOT NULL,
  FOREIGN KEY (branch_id) REFERENCES Branches(branch_id) ON DELETE CASCADE,
  FOREIGN KEY (semester_id) REFERENCES Semesters(semester_id) ON DELETE CASCADE
);

CREATE TABLE StudentSubjects (
  student_id INT,
  subject_id INT,
  PRIMARY KEY (student_id, subject_id),
  FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
  FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id) ON DELETE CASCADE
);

CREATE TABLE Assignments (
  assignment_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(150) NOT NULL,
  description TEXT,
  due_date DATE NOT NULL,
  subject_id INT NOT NULL,
  FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id) ON DELETE CASCADE
);

-- 3. Data

INSERT INTO Branches (branch_name) VALUES
  ('Computer Science'),
  ('Mechanical Engineering'),
  ('Electrical Engineering'),
  ('Civil Engineering');

INSERT INTO Semesters (semester_name) VALUES
  ('Semester 1'),
  ('Semester 2'),
  ('Semester 3'),
  ('Semester 4');

INSERT INTO Students (name, email, branch_id, semester_id) VALUES
  ('Alice Sharma', 'alice@example.com', 1, 2),
  ('Bob Verma', 'bob@example.com', 2, 2),
  ('Charlie Das', 'charlie@example.com', 1, 3),
  ('Disha Kapoor', 'disha@example.com', 3, 1),
  ('Eshan Rathi', 'eshan@example.com', 4, 4);

INSERT INTO Subjects (subject_name, branch_id, semester_id) VALUES
  ('Data Structures', 1, 2),
  ('Thermodynamics', 2, 2),
  ('Circuits 101', 3, 1),
  ('Programming Fundamentals', 1, 1),
  ('Structural Engineering', 4, 4),
  ('Operating Systems', 1, 3);

INSERT INTO StudentSubjects (student_id, subject_id) VALUES
  (1, 1), (1, 4),       -- Alice
  (2, 2),               -- Bob
  (3, 1), (3, 6),       -- Charlie
  (4, 3),               -- Disha
  (5, 5);               -- Eshan

INSERT INTO Assignments (title, description, due_date, subject_id) VALUES
  ('Stacks & Queues', 'Solve all problems in Chapter 3', '2025-04-15', 1),
  ('Intro to C', 'Write 5 basic programs', '2025-04-20', 4),
  ('Heat Laws', 'Assignment on laws of thermodynamics', '2025-04-18', 2),
  ('Digital Circuits', 'Draw logic diagrams', '2025-04-17', 3),
  ('Bridge Design', 'Submit final blueprint', '2025-04-25', 5),
  ('Memory Management', 'Case study on paging and segmentation', '2025-04-22', 6);
  
select* from Branches;
  
 select* from Assignments;
  
