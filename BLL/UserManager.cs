using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;

namespace BLL
{
    public class UserManager
    {
        private UserDao userDao = new UserDao();
        public void activeAccount(string username)
        {
            userDao.activeAccount(username.ToLower());
        }

        public User load(string username)
        {
            User user = userDao.load(username.ToLower());
            return user; 
        }

        public void add(User user)
        {
            userDao.add(user);
        }
    }
}
