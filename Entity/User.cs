using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class User
    {
        public string loweredUsername;
        public bool isActive;
        public int unReadMessagesCount;
        public int waitingFriendRequests;
        public int friendsCount;
        public int postCount;
    }
}
