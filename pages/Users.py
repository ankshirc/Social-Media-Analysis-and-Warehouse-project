# pages/Users.py
import streamlit as st
from db_utils import connect_db

# --------- Authentication Check ----------
if "logged_in" not in st.session_state or not st.session_state.logged_in:
    st.error("🚫 You must be logged in to view this page.")
    st.stop()


st.set_page_config(page_title="Users | SocialDB")
st.title("👤 Registered Users")
user_email = st.session_state.get("email", "User")
st.write(f"Welcome to this page, {user_email}!")


with connect_db() as conn:
    cursor = conn.cursor()
    cursor.execute("""
        SELECT User_id, First_name, Last_name, Gender, TO_CHAR(Date_Of_Birth, 'YYYY-MM-DD')
        FROM User_Registration
    """)
    users = cursor.fetchall()

    if users:
        for user in users:
            st.write(f"🔹 **{user[1]} {user[2]}** | Gender: {user[3]} | DOB: {user[4]} (ID: {user[0]})")
    else:
        st.warning("No users found.")