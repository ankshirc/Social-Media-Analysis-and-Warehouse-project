 INSERT ALL
    INTO User_Registration VALUES (1, 'Abhishek', 'Raval', 'Male', TO_DATE('1996-04-11', 'YYYY-MM-DD'))
    INTO User_Registration VALUES (2, 'Isha', 'Patel', 'Female', TO_DATE('1995-02-05', 'YYYY-MM-DD'))
    INTO User_Registration VALUES (3, 'Milan', 'Pandya', 'Male', TO_DATE('1996-05-26', 'YYYY-MM-DD'))
    INTO User_Registration VALUES (4, 'Priya', 'Patel', 'Female', TO_DATE('1995-08-11', 'YYYY-MM-DD'))
    INTO User_Registration VALUES (5, 'Tirth', 'Patel', 'Male', TO_DATE('1995-10-24', 'YYYY-MM-DD'))
    INTO User_Registration VALUES (6, 'Utsavi', 'Desai', 'Female', TO_DATE('1996-08-17', 'YYYY-MM-DD'))
    INTO User_Registration VALUES (7, 'Raj', 'Mistry', 'Male', TO_DATE('1995-12-20', 'YYYY-MM-DD'))
    INTO User_Registration VALUES (8, 'Vishakha', 'Trivedi', 'Female', TO_DATE('1996-01-20', 'YYYY-MM-DD'))
SELECT * FROM dual;

INSERT ALL
    INTO User_Registration VALUES (9, 'Kunal', 'Shah', 'Male', TO_DATE('1995-06-18', 'YYYY-MM-DD'))
    INTO User_Registration VALUES (10, 'Sneha', 'Mehta', 'Female', TO_DATE('1996-03-09', 'YYYY-MM-DD'))
    INTO User_Registration VALUES (11, 'Harsh', 'Bhatt', 'Male', TO_DATE('1995-12-01', 'YYYY-MM-DD'))
    INTO User_Registration VALUES (12, 'Krupa', 'Joshi', 'Female', TO_DATE('1996-07-14', 'YYYY-MM-DD'))
SELECT * FROM dual;



 select * from User_Registration;


INSERT ALL
    INTO User_Login VALUES (1, 'abhishek.raval@gmail.com', 'abhiabhi', 1, 1)
    INTO User_Login VALUES (2, 'isha.patel@gmail.com', 'ishaisha', 1, 2)
    INTO User_Login VALUES (3, 'milan@gmail.com', 'milanmilan', 0, 3)
    INTO User_Login VALUES (4, 'priya.patel@gmail.com', 'priyapriya', 1, 4)
    INTO User_Login VALUES (5, 'tirth@gmail.com', 'tptp', 0, 5)
    INTO User_Login VALUES (6, 'utsavi.desai@gmail.com', 'udud', 0, 6)
    INTO User_Login VALUES (7, 'raj@studychess.com', 'rajraj', 0, 7)
    INTO User_Login VALUES (8, 'vishakha.trivedi@gmail.com', 'vishvish', 1, 8)
SELECT * FROM dual;

INSERT ALL
    INTO User_Login VALUES (9, 'kunal.shah@gmail.com', 'kunalkunal', 1, 9)
    INTO User_Login VALUES (10, 'sneha.mehta@gmail.com', 'snehasneha', 1, 10)
    INTO User_Login VALUES (11, 'harsh.bhatt@gmail.com', 'harshharsh', 0, 11)
    INTO User_Login VALUES (12, 'krupa.joshi@gmail.com', 'krupakrupa', 1, 12)
SELECT * FROM dual;



INSERT ALL
  INTO Post VALUES (1, 'rid1 - first: Hello, I am Abhishek Raval (rid1), this is my first ever post.', 1)
  INTO Post VALUES (2, 'rid1 - second: Hello, I am Abhishek Raval (rid1), this is my second post.', 1)
  INTO Post VALUES (3, 'rid2 - first: Hello, I am Ishan H (rid2), this is my first ever post.', 2)
  INTO Post VALUES (4, 'rid3 - first: Hello, I am Milan Pandya (rid3), this is my first ever post.', 3)
  INTO Post VALUES (5, 'rid4 - first: Hello, I am Ishan L (rid4), this is my first ever post.', 4)
  INTO Post VALUES (6, 'rid5 - first: Hello, I am Tirth Patel (rid5), this is my first ever post.', 5)
  INTO Post VALUES (7, 'rid6 - first: Hello, I am Utsav Desai (rid6), this is my first ever post.', 6)
  INTO Post VALUES (8, 'rid7 - first: Hello, I am Raj Mistry (rid7), this is my first ever post.', 7)
  INTO Post VALUES (9, 'rid8 - first: Hello, I am Vish Trivedi (rid8), this is my first ever post.', 8)
  INTO Post VALUES (10, 'rid8 - second: Hello, I am Vish Trivedi (rid8), this is my second post.', 8)
  INTO Post VALUES (11, 'rid8 - third: Hello, I am Vish Trivedi (rid8), this is my third post.', 8)
  INTO Post VALUES (12, 'Welcome to university selection group - Abhishek Raval', 1)
  INTO Post VALUES (13, 'Welcome to Pokemon Go group - Vish Trivedi', 8)
  INTO Post VALUES (14, 'Welcome to Blogging Talks group - Ishan H Patel', 2)
  INTO Post VALUES (15, 'Welcome to GATE Civil Engineering group - Milan Pandya', 3)
  INTO Post VALUES (16, 'Quant Preparation group welcomes you! Prepare well and happy learning - Abhishek Raval', 1)
  INTO Post VALUES (17, 'Welcome to Game Designing group - Ishan L Patel', 4)
  INTO Post VALUES (18, 'I am alone in this Harvard group :D - TP', 5)
  INTO Post VALUES (19, 'Welcome to CAD/CAM group', 6)
  INTO Post VALUES (20, 'Thanks for adding me to the university group - Ishan H Patel', 2)
  INTO Post VALUES (21, 'Thanks for adding me to the university group - Ishan L Patel', 4)
  INTO Post VALUES (22, 'Thanks for adding me to the Quant Prep group - Ishan H', 2)
  INTO Post VALUES (23, 'Thanks for adding me to the Quant Prep group - Milan', 3)
  INTO Post VALUES (24, 'Thanks for adding me to the Quant Prep group - Ishan L', 4)
  INTO Post VALUES (25, 'Thanks for adding me to the Quant Prep group - Raj', 7)
  INTO Post VALUES (26, 'Thanks for adding me to the Quant Prep group - Vish', 8)
SELECT * FROM dual;

INSERT ALL
    INTO Post VALUES (27, 'rid9 - first: Hello, I am Kunal Shah (rid9), first post!', 9)
    INTO Post VALUES (28, 'rid10 - first: Hello, I am Sneha Mehta (rid10), first post!', 10)
    INTO Post VALUES (29, 'rid11 - first: Hello, I am Harsh Bhatt (rid11), first post!', 11)
    INTO Post VALUES (30, 'rid12 - first: Hello, I am Krupa Joshi (rid12), first post!', 12)
SELECT * FROM dual;




 
INSERT ALL
  INTO CreateGroup VALUES (1, 1, 'University Selection Talks', 'All about selecting appropriate universities for doing M.S.', 'Secret', TO_DATE('2016-08-02 01:37:33', 'YYYY-MM-DD HH24:MI:SS'))
  INTO CreateGroup VALUES (2, 8, 'Pokemon GO FANS', 'This group is about tricks and tips for all the Pokemon GO players.', 'Public', TO_DATE('2016-08-02 01:37:33', 'YYYY-MM-DD HH24:MI:SS'))
  INTO CreateGroup VALUES (3, 2, 'Blogging Talks', 'Here you can discuss about how to blog and tips to improve blog rankings.', 'Secret', TO_DATE('2016-08-02 01:58:19', 'YYYY-MM-DD HH24:MI:SS'))
  INTO CreateGroup VALUES (4, 3, 'GATE Civil Engineering', 'Here people share information about civil engineering, especially helpful for those preparing for GATE.', 'Closed', TO_DATE('2016-08-02 01:58:19', 'YYYY-MM-DD HH24:MI:SS'))
  INTO CreateGroup VALUES (5, 1, 'Quant Preparation', 'Helpful to all who are preparing for quantitative aptitude.', 'Public', TO_DATE('2016-08-02 02:02:13', 'YYYY-MM-DD HH24:MI:SS'))
  INTO CreateGroup VALUES (6, 4, 'Game Designing', 'You can post about game designing tutorials and knowledge sharing.', 'Closed', TO_DATE('2016-08-02 02:02:13', 'YYYY-MM-DD HH24:MI:SS'))
  INTO CreateGroup VALUES (7, 5, 'Harvard Students', 'All about life at Harvard and your experiences.', 'Secret', TO_DATE('2016-08-02 02:04:16', 'YYYY-MM-DD HH24:MI:SS'))
  INTO CreateGroup VALUES (8, 6, 'CAD/CAM', 'All about CAD/CAM.', 'Public', TO_DATE('2016-08-02 02:04:16', 'YYYY-MM-DD HH24:MI:SS'))
SELECT * FROM dual;

INSERT ALL
    INTO CreateGroup VALUES (9, 9, 'AI Research Group', 'Discuss AI and ML topics.', 'Closed', CURRENT_TIMESTAMP)
    INTO CreateGroup VALUES (10, 10, 'Fitness and Wellness', 'Sharing tips for mental and physical wellness.', 'Public', CURRENT_TIMESTAMP)
SELECT * FROM dual;

 select * from CreateGroup;
                                                                                


INSERT ALL
    INTO Send_Request VALUES (6, 2, 1, 0)      -- Follow
    INTO Send_Request VALUES (8, 3, 0, 1)      -- Unfollow
    INTO Send_Request VALUES (2, 4, 1, 0)      -- Follow
    INTO Send_Request VALUES (2, 5, 0, 1)      -- Unfollow
    INTO Send_Request VALUES (3, 6, 1, 0)      -- Follow
    INTO Send_Request VALUES (5, 7, 1, 0)      -- Follow
    INTO Send_Request VALUES (2, 8, 0, 1)      -- Unfollow
    INTO Send_Request VALUES (2, 3, 1, 0)      -- Follow
    INTO Send_Request VALUES (2, 4, 0, 1)      -- Unfollow
    INTO Send_Request VALUES (4, 5, 1, 0)      -- Follow
    INTO Send_Request VALUES (6, 6, 0, 1)      -- Unfollow
    INTO Send_Request VALUES (2, 7, 1, 0)      -- Follow
    INTO Send_Request VALUES (2, 8, 1, 0)      -- Follow
    INTO Send_Request VALUES (3, 4, 0, 1)      -- Unfollow
    INTO Send_Request VALUES (4, 5, 1, 0)      -- Follow
    INTO Send_Request VALUES (1, 6, 1, 0)      -- Follow
    INTO Send_Request VALUES (1, 7, 0, 1)      -- Unfollow
    INTO Send_Request VALUES (7, 8, 1, 0)      -- Follow
    INTO Send_Request VALUES (7, 5, 0, 1)      -- Unfollow
    INTO Send_Request VALUES (3, 6, 1, 0)      -- Follow
    INTO Send_Request VALUES (2, 7, 0, 1)      -- Unfollow
    INTO Send_Request VALUES (1, 8, 1, 0)      -- Follow
    INTO Send_Request VALUES (1, 6, 0, 1)      -- Unfollow
    INTO Send_Request VALUES (7, 7, 1, 0)      -- Follow
    INTO Send_Request VALUES (5, 8, 1, 0)      -- Follow
    INTO Send_Request VALUES (5, 7, 0, 1)      -- Unfollow
    INTO Send_Request VALUES (4, 8, 1, 0)      -- Follow
SELECT * FROM dual;
INSERT ALL
    INTO Send_Request VALUES (9, 2, 1, 0)
    INTO Send_Request VALUES (10, 1, 1, 0)
    INTO Send_Request VALUES (11, 3, 1, 0)
    INTO Send_Request VALUES (12, 4, 1, 0)
SELECT * FROM dual;



 INSERT ALL
    INTO Friends  VALUES (1, 1, 2)
    INTO Friends  VALUES (2, 1, 3)
    INTO Friends  VALUES (3, 1, 4)
    INTO Friends  VALUES (4, 1, 5)
    INTO Friends  VALUES (5, 1, 6)
    INTO Friends  VALUES (6, 1, 7)
    INTO Friends  VALUES (7, 1, 8)
    INTO Friends  VALUES (8, 2, 3)
    INTO Friends  VALUES (9, 2, 4)
    INTO Friends  VALUES (10, 2, 5)
    INTO Friends  VALUES (11, 2, 7)
    INTO Friends  VALUES (12, 3, 4)
    INTO Friends  VALUES (13, 3, 6)
    INTO Friends  VALUES (14, 4, 5)
    INTO Friends  VALUES (15, 4, 6)
    INTO Friends  VALUES (16, 4, 7)
    INTO Friends  VALUES (17, 4, 8)
    INTO Friends  VALUES (18, 6, 7)
    INTO Friends  VALUES (19, 6, 8)
    INTO Friends  VALUES (20, 5, 7)
    INTO Friends  VALUES (21, 2, 1)
    INTO Friends  VALUES (22, 3, 1)
    INTO Friends  VALUES (23, 4, 1)
    INTO Friends  VALUES (24, 5, 1)
    INTO Friends  VALUES (25, 6, 1)
    INTO Friends  VALUES (26, 7, 1)
    INTO Friends  VALUES (27, 8, 1)
    INTO Friends  VALUES (28, 3, 2)
    INTO Friends  VALUES (29, 4, 2)
    INTO Friends  VALUES (30, 5, 2)
    INTO Friends  VALUES (31, 7, 2)
    INTO Friends  VALUES (32, 4, 3)
    INTO Friends  VALUES (33, 6, 3)
    INTO Friends  VALUES (34, 5, 4)
    INTO Friends  VALUES (35, 6, 4)
    INTO Friends  VALUES (36, 7, 4)
    INTO Friends  VALUES (37, 8, 4)
    INTO Friends  VALUES (38, 7, 6)
    INTO Friends  VALUES (39, 8, 6)
    INTO Friends  VALUES (40, 7, 5)
  SELECT * FROM dual;
INSERT ALL
    INTO Friends VALUES (41, 9, 1)
    INTO Friends VALUES (42, 10, 2)
    INTO Friends VALUES (43, 11, 3)
    INTO Friends VALUES (44, 12, 4)
    INTO Friends VALUES (45, 9, 10)
    INTO Friends VALUES (46, 10, 9)
    INTO Friends VALUES (47, 11, 12)
    INTO Friends VALUES (48, 12, 11)
SELECT * FROM dual;



 INSERT ALL
    INTO Post_Like_stats  VALUES (1, 1, 1, 1)
    INTO Post_Like_stats  VALUES (2, 1, 2, 1)
    INTO Post_Like_stats  VALUES (3, 1, 3, 1)
    INTO Post_Like_stats  VALUES (4, 1, 4, 1)
    INTO Post_Like_stats  VALUES (5, 1, 5, 1)
    INTO Post_Like_stats  VALUES (6, 1, 6, 1)
    INTO Post_Like_stats  VALUES (7, 1, 7, 1)
    INTO Post_Like_stats  VALUES (8, 1, 8, 1)
    INTO Post_Like_stats  VALUES (9, 2, 1, 0)
    INTO Post_Like_stats  VALUES (10, 2, 2, 1)
    INTO Post_Like_stats  VALUES (11, 2, 3, 0)
    INTO Post_Like_stats  VALUES (12, 2, 4, 1)
    INTO Post_Like_stats  VALUES (13, 2, 5, 0)
    INTO Post_Like_stats  VALUES (14, 2, 6, 1)
    INTO Post_Like_stats  VALUES (15, 2, 7, 0)
    INTO Post_Like_stats  VALUES (16, 2, 8, 1)
    INTO Post_Like_stats  VALUES (17, 3, 1, 1)
    INTO Post_Like_stats  VALUES (18, 4, 1, 1)
    INTO Post_Like_stats  VALUES (19, 5, 1, 1)
    INTO Post_Like_stats  VALUES (20, 6, 1, 1)
    INTO Post_Like_stats  VALUES (21, 12, 1, 1)
    INTO Post_Like_stats  VALUES (22, 13, 1, 1)
    INTO Post_Like_stats  VALUES (23, 14, 1, 1)
    INTO Post_Like_stats  VALUES (24, 15, 3, 1)
    INTO Post_Like_stats  VALUES (25, 16, 1, 1)
    INTO Post_Like_stats  VALUES (26, 17, 4, 1)
    INTO Post_Like_stats  VALUES (27, 18, 5, 1)
    INTO Post_Like_stats  VALUES (28, 19, 6, 1)
    INTO Post_Like_stats VALUES (29, 26, 4, 1)
    INTO Post_Like_stats  VALUES (30, 20, 4, 0)
    INTO Post_Like_stats  VALUES (31, 20, 7, 0)
    INTO Post_Like_stats  VALUES (32, 16, 5, 0)
    INTO Post_Like_stats  VALUES (33, 23, 3, 0)
    INTO Post_Like_stats  VALUES (34, 23, 5, 0)
  SELECT * FROM dual;
INSERT ALL
    INTO Post_Like_stats VALUES (49, 27, 2, 1)
    INTO Post_Like_stats VALUES (50, 28, 3, 1)
    INTO Post_Like_stats VALUES (51, 29, 4, 1)
    INTO Post_Like_stats VALUES (52, 30, 5, 1)
SELECT * FROM dual;



 INSERT ALL
    INTO Post_Comments  VALUES (1, 1, 'welcome to fb, i am ishan h', 2)
    INTO Post_Comments  VALUES (2, 1, 'Thanks', 1)
    INTO Post_Comments  VALUES (3, 1, 'Milan here, good to see you.', 3)
    INTO Post_Comments  VALUES (4, 3, 'welcom ishan h, ishan l here', 4)
    INTO Post_Comments  VALUES (5, 3, 'Thanks.', 2 )
    INTO Post_Comments  VALUES (6, 4, 'Hello milan, utsav here', 6)
    INTO Post_Comments  VALUES (7, 4, 'utsav, study, you have exams.', 3)
    INTO Post_Comments  VALUES (8, 5, 'Nobody gives a damn', 1)
    INTO Post_Comments  VALUES (9, 3, 'Commenting on my own post.', 2)
    INTO Post_Comments  VALUES (10, 4, 'Commenting on my own post.', 3)
    INTO Post_Comments  VALUES (11, 1, 'comment on pid 1 abhishek raval.', 1)
    INTO Post_Comments  VALUES (12, 2, 'comment on pid 2 abhishek raval.', 1)
    INTO Post_Comments  VALUES (13, 3, 'comment on pid 3 abhishek raval.', 1)
    INTO Post_Comments  VALUES (14, 4, 'comment on pid 4 by abhishek raval.', 1)
    INTO Post_Comments  VALUES (15, 5, 'comment on pid 5 by abhishek raval.', 1)
    INTO Post_Comments  VALUES (16, 6, 'comment on pid 6 by abhishek raval.', 1)
    INTO Post_Comments  VALUES (17, 7, 'comment on pid 7 by abhishek raval.', 1)
    INTO Post_Comments  VALUES (18, 8, 'comment on pid 8 by abhishek raval.', 1)
    INTO Post_Comments  VALUES (19, 9, 'comment on pid 9 by abhishek raval.', 1)
    INTO Post_Comments  VALUES (20, 10, 'comment on pid 10 by abhishek raval.', 1)
    INTO Post_Comments  VALUES (21, 20, 'welcome -abhi(univ grp)', 1)
    INTO Post_Comments  VALUES (22, 21, 'welcome -abhi(univ grp)', 1)
    INTO Post_Comments  VALUES (23, 22, 'Welcome -abhi(quant prep grp)', 1)
    INTO Post_Comments  VALUES (24, 23, 'Welcome -abhi(quant prep grp)', 1)
    INTO Post_Comments  VALUES (25, 24, 'Welcome -abhi(quant prep grp)', 1)
    INTO Post_Comments  VALUES (26, 25, 'Welcome -abhi(quant prep grp)', 1)
  SELECT * FROM DUAL;

INSERT ALL
    INTO Post_Comments VALUES (27, 20, 'Great post, Kunal!', 2) 
    INTO Post_Comments VALUES (28, 21, 'Welcome, Sneha!', 3) 
    INTO Post_Comments VALUES (29, 27, 'Nice to see you here, Harsh!', 4) 
    INTO Post_Comments VALUES (30, 25, 'Hey Krupa, welcome!', 5) 
SELECT * FROM dual;

 commit;



 INSERT ALL
    INTO Group_Members  VALUES (1, 1, 1)
    INTO Group_Members  VALUES (2, 2, 1)
    INTO Group_Members  VALUES (3, 2, 2)
    INTO Group_Members  VALUES (4, 2, 4)
    INTO Group_Members  VALUES (5, 2, 8)
    INTO Group_Members  VALUES (6, 1, 2)
    INTO Group_Members  VALUES (7, 3, 1)
    INTO Group_Members  VALUES (8, 3, 2)
    INTO Group_Members  VALUES (9, 3, 4)
    INTO Group_Members  VALUES (10, 4, 3)
    INTO Group_Members  VALUES (11, 5, 1)
    INTO Group_Members  VALUES (12, 5, 2)
    INTO Group_Members  VALUES (13, 5, 3)
    INTO Group_Members  VALUES (14, 5, 4)
    INTO Group_Members  VALUES (15, 5, 7)
    INTO Group_Members  VALUES (16, 5, 8)
    INTO Group_Members  VALUES (17, 6, 4)
    INTO Group_Members  VALUES (18, 6, 6)
    INTO Group_Members  VALUES (19, 7, 5)
    INTO Group_Members  VALUES (20, 8, 6)
    INTO Group_Members  VALUES (21, 8, 7)
    INTO Group_Members  VALUES (22, 1, 4)
  SELECT * FROM dual;
INSERT ALL
    INTO Group_Members VALUES (41, 9, 9)
    INTO Group_Members VALUES (42, 9, 10)
    INTO Group_Members VALUES (43, 9, 11)
    INTO Group_Members VALUES (44, 10, 10)
    INTO Group_Members VALUES (45, 10, 12)
SELECT * FROM dual;



 
 commit;




