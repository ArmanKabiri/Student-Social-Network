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
    public class ProfileDao
    {
        private SqlConnection sqlConnection;
        public ProfileDao()
        {
            sqlConnection = new SqlConnection(Settings.Default.ConnectionString);
        }
        public String getProfilePicPath(string username)
        {
            string profilePicPath = null;
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "UserPicProfile_getPicPath";
            SqlParameter username_Parameter = new SqlParameter("@UserName", SqlDbType.NVarChar);
            username_Parameter.Value = username;
            sqlCommand.Parameters.Add(username_Parameter);
            sqlConnection.Open();

            SqlDataReader reader = sqlCommand.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                profilePicPath = reader["picPath"].ToString();
            }
            else profilePicPath = null;
            sqlConnection.Close();
            return profilePicPath;
        }

        public Profile load(string username)
        {
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "Profile_Load";
            SqlParameter username_Parameter = new SqlParameter("@username", SqlDbType.NVarChar);
            username_Parameter.Value = username;
            sqlCommand.Parameters.Add(username_Parameter);
            sqlConnection.Open();

            Profile profile = new Profile();
            SqlDataReader reader = sqlCommand.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                Enum.TryParse<GenderEnum>(reader["Gender"].ToString(), out profile.gender);
                profile.name = reader["FirstName"].ToString();
                profile.family = reader["LastName"].ToString();
                profile.username = username;
                profile.profilePicName = reader["ProfilePicPath"].ToString();
            }
            else profile = null;
            sqlConnection.Close();
            return profile;
        }

        public void add(Profile user)
        {
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "Profile_Add";

            SqlParameter param3 = new SqlParameter("@family", SqlDbType.NVarChar);
            SqlParameter param4 = new SqlParameter("@name", SqlDbType.NVarChar);
            SqlParameter param5 = new SqlParameter("@profilePicPath", SqlDbType.NVarChar);
            SqlParameter param6 = new SqlParameter("@username", SqlDbType.NVarChar);
            SqlParameter param8 = new SqlParameter("@gender", SqlDbType.NVarChar);

            param3.Value = user.family;
            param4.Value = user.name;
            param5.Value = user.profilePicName;
            param6.Value = user.username;
            param8.Value = user.gender;

            sqlCommand.Parameters.Add(param3);
            sqlCommand.Parameters.Add(param4);
            sqlCommand.Parameters.Add(param5);
            sqlCommand.Parameters.Add(param6);
            sqlCommand.Parameters.Add(param8);

            sqlConnection.Open();
            sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();
        }


        public List<Profile> loadByNameFamily(string name, string family)
        {
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "User_LoadByNameFamily";
            SqlParameter name_Parameter = new SqlParameter("@name", SqlDbType.NVarChar);
            SqlParameter family_Parameter = new SqlParameter("@family", SqlDbType.NVarChar);
            name_Parameter.Value = name;
            family_Parameter.Value = family;
            sqlCommand.Parameters.Add(name_Parameter);
            sqlCommand.Parameters.Add(family_Parameter);
            sqlConnection.Open();

            List<Profile> allUsers = new List<Profile>();
            SqlDataReader reader = sqlCommand.ExecuteReader();
            while (reader.Read())
            {
                Profile user = new Profile();
                user.name = reader["FirstName"].ToString();
                user.family = reader["LastName"].ToString();
                user.username = reader["Username"].ToString();
                user.profilePicName = reader["ProfilePicPath"].ToString();
                Enum.TryParse<GenderEnum>(reader["Gender"].ToString(), out user.gender);
                allUsers.Add(user);
            }

            sqlConnection.Close();
            return allUsers;
        }

        public void updateProfilePicture(string username, string profilePic)
        {
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "Profile_UpdateProfilePic";

            SqlParameter username_Parameter = new SqlParameter("@username", SqlDbType.NVarChar);
            username_Parameter.Value = username;
            sqlCommand.Parameters.Add(username_Parameter);

            SqlParameter pic_Parameter = new SqlParameter("@profilePic", SqlDbType.NVarChar);
            pic_Parameter.Value = profilePic;
            sqlCommand.Parameters.Add(pic_Parameter);

            sqlConnection.Open();
            sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();
        }
    }
}
