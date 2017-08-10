using BLL;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI_ASP.UserControl
{
    public partial class UControl_Post : System.Web.UI.UserControl
    {
        private ProfileMgr profileMgr = new ProfileMgr();
        private PostManager postManager = new PostManager();
        private Post post;
        private string username;

        public void setPost(Post post)
        {
            this.post = post;
        }



        protected void Page_Load(object sender, EventArgs e)
        {
            username = post.loweredUsername;
            Profile user = profileMgr.load(post.loweredUsername);
            lbl_content.Text = post.text;
            lbl_userName.Text = user.name + " " + user.family;

            if (post.imageFileName != "" && post.imageFileName != null)
                img_postImage.ImageUrl = "../images/post/" + post.imageFileName;

            if (user.profilePicName != "" && user.profilePicName != null)
                img_userImage.ImageUrl = "../images/profile/" + user.profilePicName;

            List<Comment> comments =  postManager.loadComments(post.postID);
            for(int i = 0; i < comments.Count; i++)
            {
                UControl_Comment uc_comment = (UControl_Comment)LoadControl("~/UControl_Comment.ascx");
                uc_comment.setComment(comments[i]);
                CommentHolder.Controls.Add(uc_comment);
            }
        }

        protected void btn_sendComment_Click(object sender, EventArgs e)
        {
            Comment comment = new Comment();
            comment.postID = post.postID;
            comment.text = txt_comment.Text.ToString();
            System.Web.Security.MembershipUser user = Membership.GetUser();
            comment.username = user.UserName;
            postManager.addComment(comment);
        }

        protected void btn_sendComment_Click1(object sender, EventArgs e)
        {
            Comment comment = new Comment();
            comment.postID = post.postID;
            comment.text = txt_comment.Text.ToString();
            System.Web.Security.MembershipUser user = Membership.GetUser();
            comment.username = user.UserName;
            postManager.addComment(comment);
        }
    }
}