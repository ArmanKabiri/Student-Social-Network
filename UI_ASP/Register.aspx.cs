using BLL;
using Entity;
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
        ProfileMgr profileManager = new ProfileMgr();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            DropDownList gender = ((DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("genderDropDownList"));
            TextBox firstName = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("FirstName"));
            TextBox lastName = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("LastName"));
            TextBox userName = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("UserName"));
            FileUpload uploadImageProfile = ((FileUpload)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("uploadImageProfile"));
            string genderString = gender.SelectedItem.Text.ToString();
            Profile profile = new Profile();
            profile.family = lastName.Text.ToString();
            profile.name = firstName.Text.ToString();
            profile.gender = (genderString.Equals("دختر")) ? GenderEnum.Female : GenderEnum.Male;
            profile.username = userName.Text.ToString();

            Boolean fileOK = false;
            String path = Server.MapPath("~/images/profile/");
            if (uploadImageProfile.HasFile)
            {
                String fileExtension =
                    System.IO.Path.GetExtension(uploadImageProfile.FileName).ToLower();
                String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i])
                    {
                        fileOK = true;
                    }
                }
            }

            if (fileOK)
            {
                uploadImageProfile.PostedFile.SaveAs(path + uploadImageProfile.FileName);
                profile.profilePicName = uploadImageProfile.FileName;
            }

            profileManager.add(profile);
        }
    }

}