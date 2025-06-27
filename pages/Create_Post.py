import streamlit as st
from db_utils import connect_db, create_pos

# ---------- Authentication Check ----------
if "logged_in" not in st.session_state or not st.session_state.logged_in:
    st.error("🚫 You must be logged in to view this page.")
    st.stop()


# ---------- Page Setup ----------
st.set_page_config(page_title="Create Post | SocialDB")
st.title("📝 Create a New Post")

user_email = st.session_state.get("email", "User")
st.write(f"Welcome, {user_email}!")

# ---------- Post Creation ----------
post_content = st.text_area("🗒️ What's on your mind?", height=200, max_chars=1000)

if st.button("🚀 Publish"):
    if post_content.strip():
        create_pos(st.session_state.user_id, post_content)
        st.success("✅ Post published successfully!")
        st.balloons()
    else:
        st.error("⚠️ Post content cannot be empty.")
