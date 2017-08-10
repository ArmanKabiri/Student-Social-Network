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
    public class UserDao
    {
        private SqlConnection sqlConnection;
        public UserDao()
        {
            sqlConnection = new SqlConnection(Settings.Default.ConnectionString);
        }
        public void activeAccount(string username)
        {
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "Users_ActiveAccount";
            SqlParameter username_Parameter = new SqlParameter("@username", SqlDbType.NVarChar);
            username_Parameter.Value = username;
            sqlCommand.Parameters.Add(username_Parameter);
            sqlConnection.Open();

            sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();
        }

        public void add(User user)
        {
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "User_Add";

            SqlParameter param1 = new SqlParameter("@username", SqlDbType.NVarChar);
            SqlParameter param2 = new SqlParameter("@isActive", SqlDbType.Bit);

            param1.Value = user.loweredUsername;
            param2.Value = user.isActive;

            sqlCommand.Parameters.Add(param1);
            sqlCommand.Parameters.Add(param2);
            sqlConnection.Open();

            sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();
        }

        public User load(string username)
        {
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "User_Load";
            SqlParameter username_Parameter = new SqlParameter("@username", SqlDbType.NVarChar);
            username_Parameter.Value = username;
            sqlCommand.Parameters.Add(username_Parameter);
            sqlConnection.Open();

            User user = new User();
            SqlDataReader reader = sqlCommand.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                user.friendsCount = int.Parse(reader["FriendCount"].ToString());
                user.postCount = int.Parse(reader["PostCount"].ToString());
                user.unReadMessagesCount = int.Parse(reader["UnReadMessageCount"].ToString());
                user.waitingFriendRequests = int.Parse(reader["WaitingFriendShipRequestCount"].ToString());
                user.loweredUsername = username;
                user.isActive = (reader["IsActivated"].ToString()=="False") ? false : true;
            }
            else user = null;
            sqlConnection.Close();
            return user;
        }
    }
}
