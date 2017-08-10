using DAL;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class FrindShipManager
    {
        private FrindShipDao friendshipDao = new FrindShipDao();

        public List<Profile> getAllFrindsProfile(string username)
        {
            return friendshipDao.getAllFrindsProfile(username);
        }

        public bool checkFriendShip(string username1, string username2)
        {
            return friendshipDao.checkFriendShip(username1, username2);
        }

        public void updateFriendShip(string username1, string username2, bool v)
        {
            friendshipDao.updateFriendShip(username1, username2, v);
        }

        public List<String> getAllRequestsToUser(string username)
        {
            return friendshipDao.getAllRequestsToUser(username);
        }

        public void add_friendShipRequest(string fromUsername,string toUserName)
        {
            friendshipDao.add_friendShipRequest(fromUsername,toUserName);
        }

        public void delete_friendShipRequest(string fromUsername, string toUserName)
        {
            friendshipDao.delete_friendShipRequest(fromUsername, toUserName);
        }
    }
}
