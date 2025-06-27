# pages/Groups.py
import streamlit as st
from db_utils import connect_db

# --------- Authentication Check ----------
if "logged_in" not in st.session_state or not st.session_state.logged_in:
    st.error("🚫 You must be logged in to view this page.")
    st.stop()

st.set_page_config(page_title="Groups | SocialDB")
st.title("🤝 Group Management")
user_email = st.session_state.get("email", "User")
st.write(f"Welcome to this page, {user_email}!")

def get_group_members(group_id):
    with connect_db() as conn:
        cursor = conn.cursor()
        out_cursor = conn.cursor()
        cursor.callproc("GetGroupMembers", [group_id, out_cursor])
        return out_cursor.fetchall()
    
def call_add_user_to_group(group_id, user_id):
    with connect_db() as conn:
        cursor = conn.cursor()
        cursor.callproc("AddUserToGroup", [group_id, user_id])
        conn.commit()

def call_remove_user_from_group(group_id, user_id):
    with connect_db() as conn:
        cursor = conn.cursor()
        cursor.callproc("RemoveUserFromGroup", [group_id, user_id])
        conn.commit()

with connect_db() as conn:
    cursor = conn.cursor()
    cursor.execute("""
        SELECT g.Group_id, g.Group_Name, g.Group_info, g.Group_type, u.First_name || ' ' || u.Last_name
        FROM CreateGroup g JOIN User_Registration u ON g.User_id = u.User_id
        ORDER BY g.Group_id DESC
    """)
    groups = cursor.fetchall()

    if groups:
        for group in groups:
            group_id, name, info, gtype, creator = group
        
            with st.expander(f"📛 {name} (ID: {group_id})"):  # <-- moved inside the loop!
                st.markdown(f"**Info:** {info}  \n**Type:** {gtype}  \n**Created by:** {creator}")

            # View current members
                st.markdown("### 👥 Members:")
                members = get_group_members(group_id)
                if members:
                    for idx, (mid, mname) in enumerate(members):  # fixed key conflict
                        col1, col2 = st.columns([4, 1])
                        col1.write(f"🔹 {mname} (ID: {mid})")
                        if col2.button("Remove", key=f"remove_{group_id}_{mid}_{idx}"):
                            call_remove_user_from_group(group_id, mid)
                            st.rerun()
                else:
                    st.info("No members in this group yet.")

                # Add new member
                st.markdown("### ➕ Add User to Group:")
                new_user_id = st.number_input(f"Enter User ID to add to Group {group_id}", 
                min_value=1, step=1, key=f"add_user_{group_id}"
                )
                if st.button("Add User", key=f"add_btn_{group_id}"):
                    try:
                        call_add_user_to_group(group_id, new_user_id)
                        st.success(f"User {new_user_id} added to group {group_id}.")
                        st.rerun()
                    except Exception as e:
                        st.error(f"Failed to add user: {e}")
