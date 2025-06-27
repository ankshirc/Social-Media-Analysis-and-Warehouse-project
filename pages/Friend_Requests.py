import streamlit as st
import oracledb
from db_utils import connect_db

st.set_page_config(page_title="Friend Requests | SocialDB")

# --------- Authentication Check ----------
if "logged_in" not in st.session_state or not st.session_state.logged_in:
    st.error("🚫 You must be logged in to view this page.")
    st.stop()


st.title("🎉 Friend Requests")
user_email = st.session_state.email
st.write(f"Welcome to this page, {user_email}!")

def get_user_list():
    with connect_db() as conn:
        cursor = conn.cursor()
        cursor.execute("SELECT User_id, First_Name || ' ' || Last_Name FROM User_Registration")
        return cursor.fetchall()

# --- Procedure Call: Send Friend Request ---
def send_friend_request(sender_id, receiver_id):
    with connect_db() as conn:
        cursor = conn.cursor()
        try:
            cursor.callproc("SendFriendRequest", [sender_id, receiver_id])
            conn.commit()
            return "✅ Friend request sent!"
        except Exception as e:
            return f"❌ Error sending friend request: {e}"

# --- Procedure Call: Accept Friend Request ---
def accept_friend_request(sender_id, receiver_id):
    with connect_db() as conn:
        cursor = conn.cursor()
        try:
            cursor.callproc("AcceptFriendRequest", [sender_id, receiver_id])
            conn.commit()
            return "✅ Friend request accepted!"
        except oracledb.DatabaseError as e:
            error_message = str(e)
            if "ORA-20001" in error_message:
                return "⚠️ No such request found."
            return f"❌ Error accepting friend request: {error_message}"

# --- Streamlit UI ---
st.title("👥 Friend Request Manager")

tab1, tab2 = st.tabs(["📤 Send Friend Request", "✅ Accept Friend Request"])

# --- Tab 1: Send Friend Request ---
with tab1:
    st.subheader("Send a Friend Request")
    users = get_user_list()

    if users:
        user_options = {f"{name} (ID: {uid})": uid for uid, name in users}
        sender_choice = st.selectbox("Your Profile", list(user_options.keys()))
        receiver_choice = st.selectbox(
            "Send Request To",
            [k for k in user_options.keys() if k != sender_choice]
        )

        sender_id = user_options[sender_choice]
        receiver_id = user_options[receiver_choice]

        if st.button("📨 Send Request"):
            result = send_friend_request(sender_id, receiver_id)
            st.info(result)
    else:
        st.warning("No users found in the database.")

# --- Tab 2: Accept Friend Request ---
with tab2:
    st.subheader("Accept a Friend Request")
    users = get_user_list()

    if users:
        user_options = {f"{name} (ID: {uid})": uid for uid, name in users}
        sender_choice = st.selectbox("Sender (Who Sent Request)", list(user_options.keys()), key="sender_accept")
        receiver_choice = st.selectbox("Your Profile", [k for k in user_options.keys() if k != sender_choice], key="receiver_accept")

        sender_id = user_options[sender_choice]
        receiver_id = user_options[receiver_choice]

        if st.button("✅ Accept Request"):
            result = accept_friend_request(sender_id, receiver_id)
            st.info(result)
    else:
        st.warning("No users found in the database.")