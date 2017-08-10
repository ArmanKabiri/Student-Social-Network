using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using System.Data.SqlClient;
using System.Data;
using DAL.Properties;

namespace DAL
{
    public class MemberShipDao
    {
        private SqlConnection sqlConnection;
        public MemberShipDao()
        {
            sqlConnection = new SqlConnection(Settings.Default.ConnectionString);   
        }
        public Authentication getAuthentication(string username)
        {
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "Membership_GetAuthentication";
            SqlParameter username_Parameter = new SqlParameter("@username", SqlDbType.NVarChar);
            username_Parameter.Value = username;
            sqlCommand.Parameters.Add(username_Parameter);
            sqlConnection.Open();

            Authentication authentication = new Authentication();
            SqlDataReader reader = sqlCommand.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();   
                authentication.isActive = (reader["IsActivated"].ToString() == "False") ? false : true;
                authentication.lowerdUsername = reader["LoweredUserName"].ToString();
                authentication.password = reader["Password"].ToString();
            }
            else authentication = null;            
            sqlConnection.Close();
            return authentication;
        }

        public bool checkUserNameExistance(string username)
        {
            bool res;
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "Membership_CheckUserExistance";
            SqlParameter username_Parameter = new SqlParameter("@username", SqlDbType.NVarChar);
            username_Parameter.Value = username;
            sqlCommand.Parameters.Add(username_Parameter);
            sqlConnection.Open();

            SqlDataReader reader = sqlCommand.ExecuteReader();
            if (reader.HasRows)
            {
                res = true;
            }
            else res = false;
            sqlConnection.Close();
            return res;
        }

        public void add(MemberShip membership)
        {
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "Membership_Add";

            SqlParameter username_Parameter = new SqlParameter("@username", SqlDbType.NVarChar);
            username_Parameter.Value = membership.lowered_Username;
            sqlCommand.Parameters.Add(username_Parameter);

            SqlParameter email_Parameter = new SqlParameter("@email", SqlDbType.NVarChar);
            email_Parameter.Value = membership.lowered_Email;
            sqlCommand.Parameters.Add(email_Parameter);

            SqlParameter password_Parameter = new SqlParameter("@password", SqlDbType.NVarChar);
            password_Parameter.Value = membership.password;
            sqlCommand.Parameters.Add(password_Parameter);

            SqlParameter passQuestion_Parameter = new SqlParameter("@passQuestion", SqlDbType.NVarChar);
            passQuestion_Parameter.Value = membership.passQuestion;
            sqlCommand.Parameters.Add(passQuestion_Parameter);

            SqlParameter passAnswer_Parameter = new SqlParameter("@passAnswer", SqlDbType.NVarChar);
            passAnswer_Parameter.Value = membership.passAnswer;
            sqlCommand.Parameters.Add(passAnswer_Parameter);

            sqlConnection.Open();
            sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();
        }

        public void updateMembership(MemberShip membership)
        {
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "Membership_Update";

            SqlParameter username_Parameter = new SqlParameter("@username", SqlDbType.NVarChar);
            username_Parameter.Value = membership.lowered_Username;
            sqlCommand.Parameters.Add(username_Parameter);

            SqlParameter email_Parameter = new SqlParameter("@email", SqlDbType.NVarChar);
            email_Parameter.Value = membership.lowered_Email;
            sqlCommand.Parameters.Add(email_Parameter);

            SqlParameter password_Parameter = new SqlParameter("@password", SqlDbType.NVarChar);
            password_Parameter.Value = membership.password;
            sqlCommand.Parameters.Add(password_Parameter);

            SqlParameter passQuestion_Parameter = new SqlParameter("@passQuestion", SqlDbType.NVarChar);
            passQuestion_Parameter.Value = membership.passQuestion;
            sqlCommand.Parameters.Add(passQuestion_Parameter);

            SqlParameter passAnswer_Parameter = new SqlParameter("@passAnswer", SqlDbType.NVarChar);
            passAnswer_Parameter.Value = membership.passAnswer;
            sqlCommand.Parameters.Add(passAnswer_Parameter);

            sqlConnection.Open();
            sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();
        }
    }
}
