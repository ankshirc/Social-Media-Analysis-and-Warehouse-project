import oracledb

# Update with your credentials
username = "system"
password = "ankshi"
dsn = "localhost/XE"

def connect_db():
    return oracledb.connect(user=username, password=password, dsn=dsn)

def get_recent_posts(limit=5):
    with connect_db() as conn:
        cursor = conn.cursor()
        cursor.execute(f"""
            SELECT 
                p.Post_id, 
                p.Text_content, 
                (u.First_name || ' ' || u.Last_name) AS full_name
            FROM Post p
            JOIN User_Registration u ON p.User_id = u.User_id
            ORDER BY p.Post_id DESC
            FETCH FIRST {limit} ROWS ONLY
        """)  # 🔁 limit is hardcoded here, NOT a bind variable

        posts = []
        for row in cursor.fetchall():
            post_id, clob_content, user = row
            text = clob_content.read() if clob_content else ""
            posts.append((post_id, text, user))
        
        return posts



def get_user_count():
    with connect_db() as conn:
        cursor = conn.cursor()
        cursor.execute("SELECT COUNT(*) FROM User_Registration")
        return cursor.fetchone()[0]

def get_post_count():
    with connect_db() as conn:
        cursor = conn.cursor()
        cursor.execute("SELECT COUNT(*) FROM Post")
        return cursor.fetchone()[0]

def get_group_count():
    with connect_db() as conn:
        cursor = conn.cursor()
        cursor.execute("SELECT COUNT(*) FROM CreateGroup")
        return cursor.fetchone()[0]
    
def create_pos(user_id, text_content):
    with connect_db() as conn:
        cursor = conn.cursor()
        cursor.execute("""
            INSERT INTO Post (Post_id, Text_content, User_id)
            VALUES (Post_seq.NEXTVAL, :1, :2)
        """, [text_content, user_id])
        conn.commit()

