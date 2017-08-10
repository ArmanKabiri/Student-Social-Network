using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Authentication_Arman
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_LoggedIn(object sender, EventArgs e)
        {
            if (Roles.IsUserInRole(Login1.UserName, "Student"))
                Response.Redirect("~/StudentProfile.aspx");
            else if (Roles.IsUserInRole(Login1.UserName, "Professor"))
                Response.Redirect("~/professorProfile.aspx");
        }
    }
}