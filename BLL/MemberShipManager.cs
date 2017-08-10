using DAL;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class MemberShipManager
    {
        private MemberShipDao membershipDao = new MemberShipDao();

        public AuthenticationEnum checkAuthentication(string username , string password)
        {
            AuthenticationEnum authEnum = 0;
            username = username.ToLower();
            Authentication auth = membershipDao.getAuthentication(username);
            if (auth == null)
                authEnum = AuthenticationEnum.InValid;
            else if (auth.password == password)
            {
                if(auth.isActive)
                    authEnum = AuthenticationEnum.Approved;
                else
                    authEnum = AuthenticationEnum.InActive;
            }
            else
                authEnum = AuthenticationEnum.InValid;

            return authEnum;
        }

        public void update(MemberShip membership)
        {
            membershipDao.updateMembership(membership);            
        }

        public bool checkUserNameExistance(string username)
        {
            return membershipDao.checkUserNameExistance(username);
        }

        public void add(MemberShip membership)
        {
            membershipDao.add(membership);
        }
    }
}
