using DAL.Properties;
using Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class FrindShipDao
    {
        private SqlConnection sqlConnection;
        public FrindShipDao()
        {
            sqlConnection = new SqlConnection(Settings.Default.ConnectionString);
        }

        public void updateFriendShip(string username1, string username2, bool v)
        {
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "FriendShip_Update";

            SqlParameter username1_Parameter = new SqlParameter("@username1", SqlDbType.NVarChar);
            username1_Parameter.Value = username1;
            sqlCommand.Parameters.Add(username1_Parameter);

            SqlParameter username2_Parameter = new SqlParameter("@username2", SqlDbType.NVarChar);
            username2_Parameter.Value = username2;
            sqlCommand.Parameters.Add(username2_Parameter);

            SqlParameter status_Parameter = new SqlParameter("@status", SqlDbType.Bit);
            status_Parameter.Value = v;
            sqlCommand.Parameters.Add(status_Parameter);

            sqlConnection.Open();

            sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();
        }

        public void add_friendShipRequest(string fromUsername, string toUserName)
        {
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "FriendShipRequest_Add";

            SqlParameter param1 = new SqlParameter("@fromUserName", SqlDbType.NVarChar);
            SqlParameter param2 = new SqlParameter("@toUserName", SqlDbType.NVarChar);

            param1.Value = fromUsername;
            param2.Value = toUserName;

            sqlCommand.Parameters.Add(param1);
            sqlCommand.Parameters.Add(param2);

            sqlConnection.Open();
            sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();
        }

        public void delete_friendShipRequest(string fromUsername, string toUserName)
        {
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "FriendShipRequest_Delete";

            SqlParameter param1 = new SqlParameter("@fromUserName", SqlDbType.NVarChar);
            SqlParameter param2 = new SqlParameter("@toUserName", SqlDbType.NVarChar);

            param1.Value = fromUsername;
            param2.Value = toUserName;

            sqlCommand.Parameters.Add(param1);
            sqlCommand.Parameters.Add(param2);

            sqlConnection.Open();
            sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();
        }

        public List<String> getAllRequestsToUser(string username)
        {
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "FriendShipRequest_GetAllRequestsToUser";
            SqlParameter parameter = new SqlParameter("@toUserName", SqlDbType.NVarChar);
            parameter.Value = username;
            sqlCommand.Parameters.Add(parameter);
            sqlConnection.Open();

            List<String> allUsers = new List<String>();
            SqlDataReader reader = sqlCommand.ExecuteReader();
            while (reader.Read())
            {
                string u = reader["LoweredUserName"].ToString();
                allUsers.Add(u);
            }

            sqlConnection.Close();
            return allUsers;
        }

        public bool checkFriendShip(string username1, string username2)
        {
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "FriendShip_CheckFriendShip";

            SqlParameter username1_Parameter = new SqlParameter("@username1", SqlDbType.NVarChar);
            username1_Parameter.Value = username1;
            sqlCommand.Parameters.Add(username1_Parameter);

            SqlParameter username2_Parameter = new SqlParameter("@username2", SqlDbType.NVarChar);
            username2_Parameter.Value = username2;
            sqlCommand.Parameters.Add(username2_Parameter);
            sqlConnection.Open();

            bool isFriend;
            SqlDataReader reader = sqlCommand.ExecuteReader();
            if (reader.HasRows)
            {
                isFriend = true;
            }
            else isFriend = false;
            sqlConnection.Close();
            return isFriend;
        }

        public List<Profile> getAllFrindsProfile(string username)
        {
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "User_GetAllFrindsProfile";
            SqlParameter username_Parameter = new SqlParameter("@Username", SqlDbType.NVarChar);
            username_Parameter.Value = username;
            sqlCommand.Parameters.Add(username_Parameter);

            sqlConnection.Open();
            List<Profile> allStudents = new List<Profile>();
            SqlDataReader reader = sqlCommand.ExecuteReader();
            while (reader.Read())
            {
                Profile profile = new Profile();
                Enum.TryParse<GenderEnum>(reader["Gender"].ToString(), out profile.gender);
                profile.name = reader["FirstName"].ToString();
                profile.family = reader["LastName"].ToString();
                profile.profilePicName = reader["ProfilePicPath"].ToString();
                profile.username = reader["Username"].ToString();
                allStudents.Add(profile);
            }
            sqlConnection.Close();
            return allStudents;
        }
    }
}
