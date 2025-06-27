# pages/View_Friends.py
import streamlit as st
from db_utils import connect_db

# --------- Authentication Check ----------
if "logged_in" not in st.session_state or not st.session_state.logged_in:
    st.error("🚫 You must be logged in to view this page.")
    st.stop()


st.set_page_config(page_title="View Friends | SocialDB")
st.title("👥 View Friends by Profile ID")
user_email = st.session_state.get("email", "User")
st.write(f"Welcome to this page, {user_email}!")


profile_id = st.number_input("Enter your Profile ID:", min_value=1, step=1)

if st.button("Show Friends"):
    try:
        with connect_db() as conn:
            cursor = conn.cursor()
            # Fetch user's name using safe bind variable name
            cursor.execute("""
                SELECT First_name || ' ' || Last_name 
                FROM User_Registration 
                WHERE User_id = :profile_id
            """, {"profile_id": profile_id})
            user_row = cursor.fetchone()

            if not user_row:
                st.error(f"No user found with Profile ID {profile_id}.")
            else:
                username = user_row[0]
                st.markdown(f"### 👤 Friends of **{username}** (ID: {profile_id})")

            # Fetch friends
            query = """
                SELECT distinct
                    ur.User_id,
                    ur.First_name || ' ' || ur.Last_name AS Friend_Name
                FROM 
                    Friends f
                JOIN 
                    User_Registration ur
                    ON ur.User_id = CASE 
                        WHEN f.Profile_id = :profile_id THEN f.friendsid
                        WHEN f.friendsid = :profile_id THEN f.Profile_id
                    END
                WHERE 
                    f.Profile_id = :profile_id OR f.friendsid = :profile_id
            """
            cursor.execute(query, {"profile_id": profile_id})
            friends = cursor.fetchall()

        if friends:
            st.success(f"{username} has {len(friends)} friend(s):")
            for fid, name in friends:
                st.write(f"🔸 **{name}** (ID: {fid})")
        else:
            st.warning("No friends found for this profile.")

    except Exception as e:
        st.error(f"Error: {e}")
