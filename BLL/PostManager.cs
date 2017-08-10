using System;
using System.Collections.Generic;
using Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DAL;

namespace BLL
{
    public class PostManager
    {
        PostDao postDao = new PostDao();
        public List<Post> getAllPostsBroadCastedToUser(string username , int index , int postsPerPage)
        {
            return postDao.getAllPostsBroadCastedToUser(username.ToLower(), index,postsPerPage);
        }

        public void addPost(Post newPostToShare)
        {
            Post p = new Post(newPostToShare);
            p.loweredUsername.ToLower();
            postDao.addPost(p);
        }

        public List<Post> getAllPublishedPosts(string username, int index, int postsPerPage)
        {
            return postDao.getAllPublishedPosts(username.ToLower(), index, postsPerPage);
        }

        public List<Comment> loadComments(int postID)
        {
            return postDao.loadComments(postID);
        }

        public void addComment(Comment c)
        {
            postDao.addComment(c);
        }
    }
}
