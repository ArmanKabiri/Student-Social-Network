using BLL;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Profile;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI_ASP.UserControl
{
    public partial class UControl_Comment : System.Web.UI.UserControl
    {
        private Comment comment;
        private ProfileMgr profileManager = new ProfileMgr();
        public void setComment(Comment comment)
        {
            this.comment = comment;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Profile user = profileManager.load(comment.username.ToLower());
            img_profileImage.ImageUrl = "../images/profile/" + user.profilePicName;
            lbl_content.Text = comment.text;
            lbl_content.Text = comment.username;
        }
    }
}