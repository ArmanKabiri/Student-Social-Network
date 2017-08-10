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
    public partial class UControl_Friend : System.Web.UI.UserControl
    {
        private Profile profile;
        private FrindShipManager friendShipManager = new FrindShipManager();

        public void setInitialize(Profile profile)
        {
            this.profile = profile;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_firstName.Text = profile.family;
            lbl_lastName.Text = profile.family;
            img_profilePic.ImageUrl = "~/images/profile/" + profile.profilePicName;
        }
    }
}