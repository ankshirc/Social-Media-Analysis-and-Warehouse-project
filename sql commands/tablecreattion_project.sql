 CREATE TABLE User_Registration (
    User_id INT CONSTRAINT uid_pk PRIMARY KEY,
    First_name VARCHAR2(20) NOT NULL,
    Last_name VARCHAR2(20) NOT NULL,
    Gender VARCHAR2(8) NOT NULL,
    Date_Of_Birth DATE NOT NULL
  );

--table created.

 describe User_Registration;



 CREATE TABLE User_Login (
    Login_id NUMBER CONSTRAINT loid_pk PRIMARY KEY,
    Email VARCHAR2(40) NOT NULL,
    Password VARCHAR2(20) NOT NULL,
    Status NUMBER(1) NOT NULL,
    User_id NUMBER REFERENCES User_Registration(User_id)
  );



 commit;





 CREATE TABLE Post (
    Post_id NUMBER CONSTRAINT post_pk PRIMARY KEY,
    Text_content CLOB NOT NULL,
    User_id NUMBER REFERENCES User_Registration(User_id)
  );



 CREATE TABLE CreateGroup (
    Group_id NUMBER CONSTRAINT group_pk PRIMARY KEY,
    User_id NUMBER REFERENCES User_Registration(User_id),
    Group_Name VARCHAR2(40) NOT NULL,
    Group_info VARCHAR2(200) NOT NULL,
    Group_type VARCHAR2(20) NOT NULL,
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
  );


DROP TABLE Send_Request CASCADE CONSTRAINTS;

CREATE TABLE Send_Request (
    User_id NUMBER REFERENCES User_Registration(User_id),
    Target_User_id NUMBER REFERENCES User_Registration(User_id),
    Follow NUMBER(1) DEFAULT 0,
    Unfollow NUMBER(1) DEFAULT 0
);



 CREATE TABLE Friends (
    vfid NUMBER CONSTRAINT VFI_PK PRIMARY KEY,
    Profile_id NUMBER NOT NULL,
    friendsid NUMBER REFERENCES User_Registration(User_id)
  );



 CREATE TABLE Post_Like_stats (
    Plike_id NUMBER CONSTRAINT PLIKE_PK PRIMARY KEY,
    Post_id NUMBER REFERENCES Post(Post_id),
    User_id NUMBER REFERENCES User_Registration(User_id),
    Like_Status NUMBER(1) NOT NULL
  );



 CREATE TABLE Post_Comments (
    Comment_id NUMBER CONSTRAINT COMM_PK PRIMARY KEY,
    Post_id NUMBER REFERENCES Post(Post_id),
    Comments CLOB NOT NULL,
    User_id NUMBER REFERENCES User_Registration(User_id)
  );



 CREATE TABLE Group_Members (
    Gmid NUMBER CONSTRAINT GM_PK PRIMARY KEY,
    Group_id NUMBER REFERENCES CreateGroup(Group_id),
    User_id NUMBER REFERENCES User_Registration(User_id)
  );



 COMMIT;



