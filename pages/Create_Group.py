import streamlit as st
from datetime import datetime
from db_utils import connect_db

# --------- Authentication Check ----------
if "logged_in" not in st.session_state or not st.session_state.logged_in:
    st.error("🚫 You must be logged in to view this page.")
    st.stop()


# Streamlit App Interface
st.set_page_config(page_title="Create Groups | SocialDB")
st.title("🆕 Create Group")
user_email = st.session_state.get("email", "User")
st.write(f"Welcome to this page, {user_email}!")

# User Input for Group Creation
user_id = st.number_input("User ID", min_value=1, max_value=10000, step=1, help="Enter your User ID")
group_id = st.number_input("Group ID", min_value=1, max_value=10000, step=1, help="Enter a unique Group ID")
group_name = st.text_input("Group Name", max_chars=40)
group_info = st.text_area("Group Info", max_chars=200)
group_type = st.selectbox("Group Type", ["Secret", "Public", "Private"])

# Function to insert data into CreateGroup table
def create_group_entry(user_id, group_id, group_name, group_info, group_type):
    created_at = datetime.now()

    insert_query = """
    INSERT INTO CreateGroup (Group_id, User_id, Group_Name, Group_info, Group_type, Created_At)
    VALUES (:group_id, :user_id, :group_name, :group_info, :group_type, :created_at)
    """

    try:
        with connect_db() as conn:
            cursor = conn.cursor()
            cursor.execute(insert_query, {
                'group_id': group_id,
                'user_id': user_id,
                'group_name': group_name,
                'group_info': group_info,
                'group_type': group_type,
                'created_at': created_at
            })
            conn.commit()
            return True
    except Exception as e:
        st.error(f"Error occurred: {e}")
        return False

# When the user submits the form
if st.button("Create Group"):
    if group_name and group_info and group_type and user_id and group_id:
        if create_group_entry(user_id, group_id, group_name, group_info, group_type):
            st.success(f"Group '{group_name}' with ID {group_id} created successfully!")
        else:
            st.error("Failed to create the group.")
    else:
        st.error("Please fill out all fields.")
