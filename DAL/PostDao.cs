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
    public class PostDao
    {
        private SqlConnection sqlConnection;

        public PostDao()
        {
            sqlConnection = new SqlConnection(Settings.Default.ConnectionString);
        }

        public List<Post> getAllPostsBroadCastedToUser(string username,int index , int pageSize)
        {
            
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "Post_GetAllPostsBroadCastedToUser";
            SqlParameter username_Parameter = new SqlParameter("@username", SqlDbType.NVarChar);
            SqlParameter index_Parameter = new SqlParameter("@index", SqlDbType.Int);
            SqlParameter pageSize_Parameter = new SqlParameter("@pageSize", SqlDbType.Int);
            username_Parameter.Value = username;
            index_Parameter.Value = index;
            pageSize_Parameter.Value = pageSize;
            sqlCommand.Parameters.Add(username_Parameter);
            sqlCommand.Parameters.Add(index_Parameter);
            sqlCommand.Parameters.Add(pageSize_Parameter);
            sqlConnection.Open();

            List<Post> allPosts = new List<Post>();
            SqlDataReader reader = sqlCommand.ExecuteReader();
            while (reader.Read())
            {
                Post tempPost = new Post();
                tempPost.postID = int.Parse(reader["PostID"].ToString());
                //tempPost.date = DateTime.Parse(reader["CreationDate"].ToString());
                tempPost.text = reader["Context"].ToString();
                tempPost.imageFileName = reader["ImageFilePath"].ToString();
                tempPost.loweredUsername= reader["PostOwnerUsername"].ToString();       //i was here
                allPosts.Add(tempPost);
            }
            sqlConnection.Close();
            return allPosts;
        }

        public void addComment(Comment c)
        {
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "Post_AddComment";

            SqlParameter p1 = new SqlParameter("@Username", SqlDbType.NVarChar);
            p1.Value = c.username;
            sqlCommand.Parameters.Add(p1);

            SqlParameter p2 = new SqlParameter("@Text", SqlDbType.Text);
            p2.Value = c.text;
            sqlCommand.Parameters.Add(p2);

            SqlParameter p3 = new SqlParameter("@PostID", SqlDbType.NVarChar);
            p3.Value = c.postID;
            sqlCommand.Parameters.Add(p3);

            sqlConnection.Open();
            sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();
        }

        public List<Comment> loadComments(int postID)
        {
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "Post_LoadComments";
            SqlParameter id_Parameter = new SqlParameter("@postID", SqlDbType.Int);
            id_Parameter.Value = postID;            
            sqlCommand.Parameters.Add(id_Parameter);

            sqlConnection.Open();
            List<Comment> allComments = new List<Comment>();
            SqlDataReader reader = sqlCommand.ExecuteReader();
            while (reader.Read())
            {
                Comment tempComment = new Comment();
                tempComment.postID = postID;
                tempComment.username = reader["UserName"].ToString();
                tempComment.text = reader["Context"].ToString();
                //tempComment.date = DateTime.Parse(reader["Date"].ToString());
                allComments.Add(tempComment);
            }
            sqlConnection.Close();
            return allComments;
        }

        public List<Post> getAllPublishedPosts(string username, int index, int pageSize)
        {
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "Post_GetAllPublishedPosts";
            SqlParameter username_Parameter = new SqlParameter("@username", SqlDbType.NVarChar);
            SqlParameter index_Parameter = new SqlParameter("@index", SqlDbType.Int);
            SqlParameter pageSize_Parameter = new SqlParameter("@pageSize", SqlDbType.Int);
            username_Parameter.Value = username;
            index_Parameter.Value = index;
            pageSize_Parameter.Value = pageSize;
            sqlCommand.Parameters.Add(username_Parameter);
            sqlCommand.Parameters.Add(index_Parameter);
            sqlCommand.Parameters.Add(pageSize_Parameter);
            sqlConnection.Open();

            List<Post> allPosts = new List<Post>();
            SqlDataReader reader = sqlCommand.ExecuteReader();
            while (reader.Read())
            {
                Post tempPost = new Post();
                tempPost.postID = int.Parse(reader["ID"].ToString());
                //tempPost.date = DateTime.Parse(reader["CreationDate"].ToString());
                tempPost.text = reader["Context"].ToString();
                tempPost.imageFileName= reader["ImageFilePath"].ToString();
                tempPost.loweredUsername = username;
                allPosts.Add(tempPost);
            }
            sqlConnection.Close();
            return allPosts;
        }

        public void addPost(Post newPostToShare)
        {
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "Post_Add";

            SqlParameter p1 = new SqlParameter("@username", SqlDbType.NVarChar);
            p1.Value = newPostToShare.loweredUsername;
            sqlCommand.Parameters.Add(p1);

            SqlParameter p2 = new SqlParameter("@text", SqlDbType.Text);
            p2.Value = newPostToShare.text;
            sqlCommand.Parameters.Add(p2);

            SqlParameter p3 = new SqlParameter("@picFilePath", SqlDbType.NVarChar);
            p3.Value = newPostToShare.imageFileName;
            sqlCommand.Parameters.Add(p3);

            sqlConnection.Open();
            sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();
        }
    }
}
