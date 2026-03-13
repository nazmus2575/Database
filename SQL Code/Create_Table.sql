---Create Table for the database

---Student
CREATE TABLE Student {
    NYU_Email VARCHAR(15),
    First_Name VARCHAR(15) NOT NULL,
    Second_Name VARCHAR(15),
    Hashed_Password VARCHAR(255) NOT NULL,
    Account_Role VARCHAR(15) NOT NULL,
    PRIMARY KEY (NYU_Email)
}

--Student_Available_Time
CREATE TABLE Student_Available_Time {
    Time_ID INT,
    Week_Day INT NOT NULL,
    NYU_Email VARCHAR(15),
    Start_Time DATE,
    End_Time DATE,
    PRIMARY KEY (Time_ID),
    Foreign KEY (NYU_Email) REFERENCES Student(NYU_Email)
}

--Course
CREATE TABLE Course {
    Course_ID INT,
    Course_Name VARCHAR(15),
    PRIMARY KEY (Course_ID)
}

--Student_Course
CREATE TABLE Student_Course {
    NYU_Email VARCHAR(15),
    Course_ID INT,
    PRIMARY KEY (NYU_Email, Course_ID),
    Foreign KEY (NYU_Email) REFERENCES Student(NYU_Email),
    Foreign KEY (Course_ID) REFERENCES Course(Course_ID)
}

---Meeting
CREATE TABLE Meeting {
    Meeting_ID INT,
    Start_Time DATE NOT NULL,
    End_Time DATE,
    Meeting_Note TEXT,
    Num_Of_Students INT,
    Course_ID INT,
    Location_ID int,
    PRIMARY KEY (Meeting_ID)
    Foreign KEY (Course_ID) REFERENCES Course(Course_ID),
    Foreign KEY (Location_ID) REFERENCES Location(Location_ID)
}

--Invitation
CREATE TABLE Invitation {
    Invitation_ID INT,
    Sent_Date DATE,
    Meeting_ID INT,
    NYU_Email VARCHAR(15),
    PRIMARY KEY (Invitation_ID),
    Foreign KEY (NYU_Email) REFERENCES Student(NYU_Email),
    Foreign KEY (Meeting_ID) REFERENCES Meeting(Meeting_ID)
}

--Feedback
CREATE TABLE Feedback {
    NYU_Email VARCHAR(15),
    Meeting_ID INT,
    Rating INT,
    Comment TEXT,
    PRIMARY KEY (NYU_Email, Meeting_ID),
    Foreign KEY (NYU_Email) REFERENCES Student(NYU_Email),
    Foreign KEY (Meeting_ID) REFERENCES Meeting(Meeting_ID)
}

--Meeting_Request
CREATE TABLE Meeting_Request {
    Meeting_ID INT,
    NYU_Email VARCHAR(15),
    PRIMARY KEY (Meeting_ID, NYU_Email),
    Foreign KEY (NYU_Email) REFERENCES Student(NYU_Email),
    Foreign KEY (Meeting_ID) REFERENCES Meeting(Meeting_ID)
}

--Study_Material
CREATE TABLE Study_Material {
    Study_Material_ID INT,
    File_Name VARCHAR(15) NOT NULL,
    File_Path TEXT,
    Meeting_ID INT,
    PRIMARY KEY (Study_Material_ID),
    Foreign KEY (Meeting_ID) REFERENCES Meeting(Meeting_ID)
}

--Location
CREATE TABLE Location {
    Location_ID INT,
    Building VARCHAR(15) NOT NULL,
    Room VARCHAR(15) NOT NULL,
    Capacity INT,
    PRIMARY KEY (Location_ID)
}



