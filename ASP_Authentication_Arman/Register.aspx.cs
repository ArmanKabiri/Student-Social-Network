using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Authentication_Arman
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ((DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("RoleDropDownList")).DataSource = Roles.GetAllRoles();
                ((DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("RoleDropDownList")).DataBind();
                int rolecounter = ((DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("RoleDropDownList")).Items.Count;
                ((DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("RoleDropDownList")).Items[rolecounter - rolecounter].Selected = true;
            }
        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            DropDownList roleDropDownList = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("RoleDropDownList");
            Roles.AddUserToRole(CreateUserWizard1.UserName, roleDropDownList.SelectedValue);
        }
    }

}