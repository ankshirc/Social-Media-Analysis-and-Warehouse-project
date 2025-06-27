import streamlit as st
import oracledb  # Required for handling OracleDB exceptions
from db_utils import connect_db

# --------- Authentication Check ----------
if "logged_in" not in st.session_state or not st.session_state.logged_in:
    st.error("🚫 You must be logged in to view this page.")
    st.stop()



st.set_page_config(page_title="📊 Analytics | SocialDB", layout="wide")
st.title("📈 Social Media Analytics Dashboard")
user_email = st.session_state.get("email", "User")
st.write(f"Welcome to this page, {user_email}!")

# Load users for dropdown
def get_users():
    try:
        with connect_db() as conn:
            cursor = conn.cursor()
            cursor.execute("SELECT User_id, First_name || ' ' || Last_name FROM User_Registration")
            return cursor.fetchall()
    except oracledb.Error as e:
        st.error(f"❌ Failed to load users: {e}")
        return []

# Procedure 1: ViewUserPostsWithStats
def get_user_posts_with_stats(user_id):
    try:
        with connect_db() as conn:
            cursor = conn.cursor()
            out_cursor = conn.cursor()
            cursor.callproc("ViewUserPostsWithStats", [user_id, out_cursor])

            result = []
            for row in out_cursor:
                pid = row[0]
                content = row[1].read() if hasattr(row[1], 'read') else row[1]  # Read CLOBs safely
                likes = row[2]
                comments = row[3]
                result.append((pid, content, likes, comments))

            return result
    except oracledb.Error as e:
        st.error(f"❌ Database error while fetching user posts: {e}")
        return []

# Procedure 2: PostsWithNoLikes
def get_posts_with_no_likes():
    try:
        with connect_db() as conn:
            cursor = conn.cursor()
            out_cursor = conn.cursor()
            cursor.callproc("PostsWithNoLikes", [out_cursor])

            results = []
            for row in out_cursor:
                pid = row[0]
                content = row[1].read() if hasattr(row[1], "read") else row[1]
                results.append((pid, content))

            return results
    except oracledb.Error as e:
        st.error(f"❌ Failed to fetch posts with no likes: {e}")
        return []


# Procedure 3: PostsWithNoComments
def get_posts_with_no_comments():
    with connect_db() as conn:
        cursor = conn.cursor()
        out_cursor = conn.cursor()
        cursor.callproc("PostsWithNoComments", [out_cursor])
        
        results = []
        for row in out_cursor:
            post_id = row[0]
            content = row[1].read() if hasattr(row[1], 'read') else row[1]
            author_name = row[2]
            results.append((post_id, content, author_name))
        return results

# Procedure 4: PostsLikedByUser
def get_posts_liked_by_user(user_id):
    with connect_db() as conn:
        cursor = conn.cursor()
        out_cursor = conn.cursor()
        cursor.callproc("PostsLikedByUser", [user_id, out_cursor])
        
        results = []
        for row in out_cursor:
            if len(row) < 3:
                print("Unexpected row format:", row)  # Debug line
                continue
            post_id = row[0]
            content = row[1].read() if hasattr(row[1], 'read') else row[1]
            author_name = row[2]
            results.append((post_id, content, author_name))
        return results



# Procedure 5: FriendLikedUserPosts
def get_friend_liked_user_posts(user_id):
    with connect_db() as conn:
        cursor = conn.cursor()
        out_cursor = conn.cursor()
        cursor.callproc("FriendLikedUserPosts", [user_id, out_cursor])
        results = []
        for row in out_cursor:
            pid = row[0]
            content = row[1]
            friend_name = row[2] if len(row) > 2 else "Unknown"
            results.append((pid, content, friend_name))
        return results


# UI - User Selector
users = get_users()
user_dict = {f"{name} (ID: {uid})": uid for uid, name in users}

with st.container():
    st.markdown("<div class='section-title'>🔍 Select a User to Analyze</div>", unsafe_allow_html=True)
    selected_user = st.selectbox("", list(user_dict.keys()))

if selected_user:
    user_id = user_dict[selected_user]

    st.subheader("📝 User's Posts with Stats")
    user_posts = get_user_posts_with_stats(user_id)
    if user_posts:
        for pid, content, likes, comments in user_posts:
            st.markdown(f"**Post ID:** {pid}  \n🗒️ {content}  \n❤️ Likes: {likes}, 💬 Comments: {comments}")
    else:
        st.info("This user hasn't posted anything yet.")

    st.divider()

    st.subheader("📭 User's Posts Liked by Friends")
    posts_by_friends = get_friend_liked_user_posts(user_id)
    if posts_by_friends:
        for pid, content, friend_name in posts_by_friends:
            st.markdown(f"✅ **Post ID:** {pid}  \n🗒️ {content}  \n👍 Liked by: {friend_name}")

    else:
        st.info("No posts by this user were liked by their friends.")

    st.divider()

    st.subheader("👀 Posts Liked by User")
    posts_liked_by_user = get_posts_liked_by_user(user_id)

    if posts_liked_by_user:
        for pid, content, author_name in posts_liked_by_user:
            st.markdown(f"✅ **Post ID:** {pid}  \n🗒️ {content}  \n✍️ Author: {author_name}")
    else:
        st.info("This user hasn't liked any posts.")


    st.divider()
    st.subheader("🚫 Posts with No Likes")
    no_likes = get_posts_with_no_likes()
    if no_likes:
        for pid, content in no_likes:
            st.markdown(f"📌 **Post ID:** {pid} - {content}")
    else:
        st.success("All posts have at least one like!")

    st.divider()
    st.subheader("🗯️ Posts with No Comments")
    no_comments = get_posts_with_no_comments()
    if no_comments:
        for pid, content, author in no_comments:
            st.markdown(f"📌 **Post ID:** {pid}  \n🗒️ {content}  \n✍️ Author: {author}")
    else:
        st.info("All posts have at least one comment.")