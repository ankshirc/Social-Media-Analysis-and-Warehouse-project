# pages/Posts.py
import streamlit as st
from db_utils import connect_db

# --------- Authentication Check ----------
if "logged_in" not in st.session_state or not st.session_state.logged_in:
    st.error("🚫 You must be logged in to view this page.")
    st.stop()


st.set_page_config(page_title="Posts | SocialDB")
st.title("📝 All Posts")
user_email = st.session_state.get("email", "User")
st.write(f"Welcome to this page, {user_email}!")

with connect_db() as conn:
    cursor = conn.cursor()
    cursor.execute("""
        SELECT p.Post_id, p.Text_content, u.First_name || ' ' || u.Last_name
        FROM Post p JOIN User_Registration u ON p.User_id = u.User_id
        ORDER BY p.Post_id DESC
    """)
    posts = cursor.fetchall()

    if posts:
        for post in posts:
            st.subheader(f"✍️ Post #{post[0]} by {post[2]}")
            st.markdown(f"> {post[1]}")
            st.markdown("---")
    else:
        st.warning("No posts available.")