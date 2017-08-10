using BLL;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using UI_ASP.UserControl;

namespace ASP_Authentication_Arman
{
    public partial class userProfile : System.Web.UI.Page
    {
        PostManager postManager = new PostManager();
        ProfileMgr profileManager = new ProfileMgr();
        FrindShipManager friendShipMgr = new FrindShipManager();
        String userName = "";
        MembershipUser user;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    user = Membership.GetUser();
                    userName = user.UserName;
                    List<Post> allPosts = postManager.getAllPostsBroadCastedToUser(userName, 0, 100);
                    for (int i = 0; i < allPosts.Count; i++)
                    {
                        UControl_Post uc_post = (UControl_Post)LoadControl("~/UserControl/UControl_Post.ascx");
                        uc_post.setPost(allPosts[i]);
                        postPlaceHolder.Controls.Add(uc_post);
                    }
                    Profile userProfile = profileManager.load(userName);
                    img_profileImageSmall.ImageUrl = "~/images/profile/" + userProfile.profilePicName;
                    img_profileImageBig.ImageUrl = "~/images/profile/" + userProfile.profilePicName;
                    lbl_userFullName.Text = userProfile.name + " " + userProfile.family;

                    List<String> allRequestUserNames = friendShipMgr.getAllRequestsToUser(userName);
                    Profile lastRequestUserProfile = null;
                    for (int i = 0; i < allRequestUserNames.Count; i++)
                    {
                        Profile p = profileManager.load(allRequestUserNames[i]);
                        if (i == 0)
                            lastRequestUserProfile = p;

                        UControl_FriendRequest uc_friendRequest = (UControl_FriendRequest)LoadControl("~/UserControl/UControl_FriendRequest.ascx");

                        uc_friendRequest.setInitialize(p);
                        friendRequestPlaceHolder.Controls.Add(uc_friendRequest);

                    }

                    if (lastRequestUserProfile != null)
                    {
                        lbl_lastFriendRequestFullName.Text = lastRequestUserProfile.name + " " + lastRequestUserProfile.family;
                        img_lastFriendRequestProfileImage.ImageUrl = "~/images/profile/" + lastRequestUserProfile.profilePicName;
                    }
                    else
                    {
                        Panel_LastFriendRequest.Visible = false;
                    }

                    ////friends
                    List<Profile> allFriends = friendShipMgr.getAllFrindsProfile(userName);
                    for (int i = 0; i < allFriends.Count; i++)
                    {
                        UControl_Friend uc_friend = (UControl_Friend)LoadControl("~/UserControl/UControl_Friend.ascx");

                        uc_friend.setInitialize(allFriends[i]);
                        friendPlaceHolder.Controls.Add(uc_friend);
                    }

                }
                catch (Exception x)
                {
                    FormsAuthentication.RedirectToLoginPage();
                }
            }
        }

        protected void btn_post_Click(object sender, EventArgs e)
        {
            user = Membership.GetUser();
            userName = user.UserName;

            Boolean fileOK = false;
            String path = Server.MapPath("~/images/post/");
            if (uploadFile.HasFile)
            {
                String fileExtension =
                    System.IO.Path.GetExtension(uploadFile.FileName).ToLower();
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
                uploadFile.PostedFile.SaveAs(path + uploadFile.FileName);
                
                Post newPost = new Post();
                newPost.imageFileName = uploadFile.FileName;
                newPost.loweredUsername = userName.ToLower();
                newPost.text = txt_postContentToSend.Text.ToString();
                postManager.addPost(newPost);
            }

        }

        protected void btn_exit_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }

        protected void btn_applyFrienRequest_Click(object sender, EventArgs e)
        {
            user = Membership.GetUser();
            userName = user.UserName;

            string hField = HField_FriendRequest.Value.ToString();
            string[] userRequests = hField.Split(',');
            for (int i = 0; i < userRequests.Length-1; i++)
            {
                string name, family;
                int status;
                string[] person_status = userRequests[i].Split(':');
                status = int.Parse(person_status[1]);
                string[] name_family = person_status[0].Split('?');
                name = name_family[0];
                family = name_family[1];
                List<Profile> users = profileManager.loadByNameFamily(name, family,userName);
                if (status == 1)
                {
                    friendShipMgr.updateFriendShip(users[0].username, userName, true);
                    friendShipMgr.delete_friendShipRequest(users[0].username, userName);
                }
                else
                {
                    friendShipMgr.delete_friendShipRequest(users[0].username, userName);
                }

            }
            HField_FriendRequest.Value = "";
        }

        protected void btn_findPerson_Click(object sender, EventArgs e)
        {
            user = Membership.GetUser();
            userName = user.UserName;

            string nameFamily = txt_findPersonNameFamily.Text.ToString();
            string[] nameFamiltArray = nameFamily.Split(' ');
            string name = nameFamiltArray[0];
            string family = nameFamiltArray[1];
            List<Profile> allProbablyUsers = profileManager.loadByNameFamily(name, family,userName);
            for(int i =0; i < allProbablyUsers.Count; i++)
            {
                bool isFriend = friendShipMgr.checkFriendShip(allProbablyUsers[i].username, userName);
                if (isFriend)
                {
                    UControl_Friend uc_friend = (UControl_Friend)LoadControl("~/UserControl/UControl_Friend.ascx");
                    uc_friend.setInitialize(allProbablyUsers[i]);
                    personPlaceHolder.Controls.Add(uc_friend);
                }
                else
                {
                    UControl_Person ucPerson = (UControl_Person)LoadControl("~/UserControl/UControl_Person.ascx");
                    ucPerson.setInitialize(allProbablyUsers[i]);
                    personPlaceHolder.Controls.Add(ucPerson);
                }
            }
        }
    }
}