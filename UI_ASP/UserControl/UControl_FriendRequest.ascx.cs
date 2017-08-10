using BLL;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI_ASP.UserControl
{
    public partial class UControl_FriendRequest : System.Web.UI.UserControl
    {
        private Profile profile;
        private FrindShipManager friendShipManager = new FrindShipManager();

        public void setInitialize(Profile profile)
        {
            this.profile = profile;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Label s = lbl_firstName;
            string ss = lbl_firstName.Text.ToString();
            lbl_firstName.Text = profile.name;
            lbl_lastName.Text = profile.family;
            img_profilePic.ImageUrl = "../images/profile/" + profile.profilePicName;
            int a = 0;
        }
    }
}