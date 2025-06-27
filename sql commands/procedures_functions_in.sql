CREATE OR REPLACE PROCEDURE ViewUserPostsWithStats (
    p_userId IN NUMBER,
    p_cursor OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN p_cursor FOR
    SELECT
        P.Post_id,
        P.Text_content,
        (SELECT COUNT(*) FROM Post_Like_Stats WHERE Post_id = P.Post_id) AS like_count,
        (SELECT COUNT(*) FROM Post_Comments WHERE Post_id = P.Post_id) AS comment_count
    FROM Post P
    WHERE P.User_id = p_userId;
END;
/



 CREATE OR REPLACE TYPE CommentRow AS OBJECT (
    Comment_id NUMBER,
    Comments   CLOB
  );
  /



 CREATE OR REPLACE TYPE CommentTable AS TABLE OF CommentRow;
  /



 CREATE OR REPLACE FUNCTION GetUserComments(uId IN NUMBER)
  RETURN CommentTable PIPELINED
  IS
  BEGIN
    FOR rec IN (
      SELECT Comment_id, Comments
      FROM Post_Comments
      WHERE User_id = uId
    ) LOOP
      PIPE ROW (CommentRow(rec.Comment_id, rec.Comments));
    END LOOP;
   RETURN;
  END;
  /



 commit;



 CREATE OR REPLACE PROCEDURE ShowOnlineFriends(p_userId IN NUMBER) IS
  BEGIN
    FOR rec IN (
      SELECT UR.User_id, UR.First_name, UR.Last_name
      FROM Friends F
      JOIN User_Registration UR ON UR.User_id = F.vfid
      JOIN User_Login UL ON UR.User_id = UL.User_id
      WHERE F.Profile_id = p_userId AND UL.Status = 1
    ) LOOP
      NULL; -- Replace this with logic to handle/display data if needed
    END LOOP;
  END;
  /



 CREATE OR REPLACE PROCEDURE GroupDetails IS
  BEGIN
    FOR rec IN (
      SELECT
        CG.Group_Name,
        CG.User_id AS Admin_id,
        COUNT(GM.User_id) AS MemberCount
      FROM CreateGroup CG
      LEFT JOIN Group_Members GM ON CG.Group_id = GM.Group_id
      GROUP BY CG.Group_Name, CG.User_id
    ) LOOP
      NULL; -- Placeholder: Add logic to process or display each row
    END LOOP;
  END;
  /




 CREATE OR REPLACE PROCEDURE PostsWithNoLikes(p_result OUT SYS_REFCURSOR) IS
BEGIN
    OPEN p_result FOR
    SELECT P.Post_id, P.Text_content
    FROM Post P
    LEFT JOIN Post_Like_Stats L ON P.Post_id = L.Post_id
    WHERE L.Post_id IS NULL;
END;
/




CREATE OR REPLACE PROCEDURE PostsWithNoComments (
    p_result OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_result FOR
        SELECT 
            p.Post_id, 
            p.Text_content,
            u.First_name || ' ' || u.Last_name AS author_name
        FROM Post p
        JOIN User_Registration u ON p.User_id = u.User_id
        WHERE NOT EXISTS (
            SELECT 1 
            FROM Post_Comments pc 
            WHERE pc.Post_id = p.Post_id
        );
END;
/

CREATE OR REPLACE PROCEDURE FriendLikedUserPosts (
    p_user_id IN NUMBER,
    p_result OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN p_result FOR
        SELECT DISTINCT 
            p.Post_id,
            DBMS_LOB.SUBSTR(p.Text_content, 4000, 1) AS Text_content,
            ur.First_name || ' ' || ur.Last_name AS Friend_Name
        FROM Post p
        JOIN Post_Like_stats pls ON p.Post_id = pls.Post_id
        JOIN User_Registration ur ON pls.User_id = ur.User_id
        WHERE p.User_id = p_user_id
          AND pls.User_id IN (
              SELECT friendsid
              FROM Friends
              WHERE Profile_id = p_user_id
          )
          AND pls.Like_Status = 1;
END;
/



                  
CREATE OR REPLACE PROCEDURE PostsLikedByUser (
    p_user_id IN NUMBER,
    p_result OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_result FOR
        SELECT 
            p.Post_id,
            p.Text_content,
            ur.First_name || ' ' || ur.Last_name AS author_name
        FROM Post_Like_stats pls
        JOIN Post p ON pls.Post_id = p.Post_id
        JOIN User_Registration ur ON p.User_id = ur.User_id
        WHERE pls.User_id = p_user_id
          AND pls.Like_Status = 1;
END;
/






 CREATE OR REPLACE PROCEDURE UserLogin (
      p_email IN VARCHAR2,
      p_password IN VARCHAR2
  ) AS
      v_count NUMBER;
  BEGIN
      SELECT COUNT(*) INTO v_count
      FROM User_Login
      WHERE Email = p_email AND Password = p_password;
  
      IF v_count = 1 THEN
          UPDATE User_Login
          SET Status = 'Active'
          WHERE Email = p_email;
  
          DBMS_OUTPUT.PUT_LINE('Login successful.');
      ELSE
          DBMS_OUTPUT.PUT_LINE('Invalid email or password.');
      END IF;
  END;
  /



 CREATE OR REPLACE PROCEDURE RegisterUser (
      p_first_name IN VARCHAR2,
      p_last_name IN VARCHAR2,
      p_gender IN VARCHAR2,
      p_dob IN DATE,
      p_email IN VARCHAR2,
      p_password IN VARCHAR2
  ) AS
      v_user_id NUMBER;
  BEGIN
      -- Generate next user ID
      SELECT NVL(MAX(User_id), 0) + 1 INTO v_user_id FROM User_Registration;
  
      -- Insert into User_Registration table
      INSERT INTO User_Registration (User_id, First_Name, Last_Name, Gender, Date_Of_Birth)
      VALUES (v_user_id, p_first_name, p_last_name, p_gender, p_dob);
  
      -- Insert into User_Login table
      INSERT INTO User_Login (Login_id, Email, Password, Status)
      VALUES (v_user_id, p_email, p_password, 'Active');
  
      DBMS_OUTPUT.PUT_LINE('User Registered Successfully');
  END;
  /



 CREATE OR REPLACE PROCEDURE SendFriendRequest (
    p_sender_id IN NUMBER,
    p_receiver_id IN NUMBER
) AS
BEGIN
    INSERT INTO Send_Request (user_id, target_user_id, follow, unfollow)
    VALUES (p_sender_id, p_receiver_id, 1, 0);

    DBMS_OUTPUT.PUT_LINE('Friend request sent.');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Friend request already exists.');
END;
/



 CREATE OR REPLACE PROCEDURE AcceptFriendRequest (
    p_sender_id IN NUMBER,
    p_receiver_id IN NUMBER
) AS
    v_max_id NUMBER;
    v_exists NUMBER;
BEGIN
    -- Check if request exists
    SELECT COUNT(*) INTO v_exists 
    FROM Send_Request 
    WHERE user_id = p_sender_id AND target_user_id = p_receiver_id;

    IF v_exists = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'No such friend request found.');
    END IF;

    -- Get max vfid
    SELECT NVL(MAX(vfid), 0) INTO v_max_id FROM Friends;

    -- Insert both directions into Friends table
    INSERT INTO Friends (vfid, Profile_id, friendsid)
    VALUES (v_max_id + 1, p_sender_id, p_receiver_id);

    INSERT INTO Friends (vfid, Profile_id, friendsid)
    VALUES (v_max_id + 2, p_receiver_id, p_sender_id);

    -- Remove the original request
    DELETE FROM Send_Request 
    WHERE user_id = p_sender_id AND target_user_id = p_receiver_id;

    DBMS_OUTPUT.PUT_LINE('Friend request accepted.');
END;
/



 CREATE OR REPLACE PROCEDURE AddUserToGroup (
      p_group_id IN NUMBER,
      p_user_id IN NUMBER
  ) AS
      v_gmid NUMBER;
  BEGIN
      -- Get the next available Gmid
      SELECT NVL(MAX(Gmid), 0) + 1 INTO v_gmid FROM Group_Members;
  
      -- Insert the user into the group
      INSERT INTO Group_Members (Gmid, Group_id, User_id)
      VALUES (v_gmid, p_group_id, p_user_id);
  
      DBMS_OUTPUT.PUT_LINE('User added to group successfully.');
  END;
  /



 CREATE OR REPLACE PROCEDURE RemoveUserFromGroup (
      p_group_id IN NUMBER,
      p_user_id IN NUMBER
  ) AS
  BEGIN
      DELETE FROM Group_Members
      WHERE Group_id = p_group_id AND User_id = p_user_id;
  
      DBMS_OUTPUT.PUT_LINE('User removed from group.');
  END;
  /



CREATE OR REPLACE PROCEDURE GetGroupMembers (
    p_group_id IN NUMBER,
    p_cursor OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN p_cursor FOR
        SELECT ur.User_id, ur.First_name || ' ' || ur.Last_name AS FullName
        FROM Group_Members gm
        JOIN User_Registration ur ON gm.User_id = ur.User_id
        WHERE gm.Group_id = p_group_id;
END;
/
