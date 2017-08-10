using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using DAL;

namespace BLL
{
    public class ProfileMgr
    {
        private ProfileDao userDao;
        public ProfileMgr()
        {
            userDao = new ProfileDao();
        }

        public Profile load(string username)
        {
            Profile profile= userDao.load(username.ToLower());
            return profile;
        }

        public List<Profile> loadByNameFamily(string name, string family,string myUserName)
        {
            List<Profile> list = userDao.loadByNameFamily(name, family);
            
            int myIndex = -1;
            foreach(Profile s in list)
            {
                if(s.username.ToLower().Equals(name))
                {
                    myIndex = list.IndexOf(s);
                }
            }
            if (myIndex!=(-1))
                list.RemoveAt(myIndex);
            return list;
        }

        public void updateProfilePicture(string username, string profilePic)
        {
            userDao.updateProfilePicture(username, profilePic);
        }

        public void add(Profile newProfileToAdd)
        {
            userDao.add(newProfileToAdd);
        }
    }
}
