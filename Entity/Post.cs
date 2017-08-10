using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class Post
    {
        public string loweredUsername;
        public string text;
        public int postID;
        public string imageFileName;

        public Post(Post p)
        {
            loweredUsername = p.loweredUsername;
            text = p.text;
            postID = p.postID;
            imageFileName = p.imageFileName;
        }
        public Post() { }
    }
}
