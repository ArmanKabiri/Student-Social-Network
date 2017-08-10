<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userProfile.aspx.cs" Inherits="ASP_Authentication_Arman.userProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Profile</title>

    <link href="styles/ui.css" rel="stylesheet" />
    <link href="styles/w3.css" rel="stylesheet" />
    <link href="styles/w3-theme-blue-grey.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
</head>

<body>

    <!-- Navbar -->
    <div class="w3-top">
        <ul class="w3-navbar w3-theme-d2 w3-left-align w3-large">
            <li class="w3-hide-medium w3-hide-large w3-opennav w3-right">
                <a class="w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
            </li>
            <li><a href="#" class="w3-padding-large w3-theme-d4"><i class="fa fa-home"></i></a></li>
            <li class="w3-hide-small"><a href="#" class="w3-padding-large w3-hover-white" title="خبرهای جدید"><i class="fa fa-globe"></i></a></li>
            <li class="w3-hide-small"><a href="#" class="w3-padding-large w3-hover-white" title="دوستان"><i class="fa fa-users"></i></a></li>
            <li class="w3-hide-small"><a href="#" class="w3-padding-large w3-hover-white" title="پیام‌ها"><i class="fa fa-envelope"></i></a></li>
            <li class="w3-hide-small w3-dropdown-hover">
                <a href="#" class="w3-padding-large w3-hover-white" title="هشدارها"><i class="fa fa-bell"></i><span style="font-size: 80%;" class="w3-badge w3-right w3-small w3-green">۳</span></a>
                <div class="w3-dropdown-content w3-white w3-card-4" style="font-size: 90%;">
                    <a href="#"><i class="fa fa-caret-square-o-left"></i>درخواست دوستی از یاسر ادیم</a>
                    <a href="#"><i class="fa fa-caret-square-o-left"></i>پویا قاسمی برای پست شما نظر داده است</a>
                    <a href="#"><i class="fa fa-caret-square-o-left"></i>پویا قاسمی پست شما را لایک کرده است</a>
                </div>
            </li>
            <li class="w3-hide-small w3-right tooltip">
                <span class="tooltipText">حساب من</span>
                <a href="#" class="w3-hover-white" title="حساب من">
                    <img src="images/std_sani.jpg" class="w3-circle" style="height: 29px; width: 29px;" alt="Avatar"></a></li>
        </ul>
    </div>

    <!-- Navbar on small screens -->
    <div id="navDemo" class="w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top: 47px">
        <ul class="w3-navbar w3-left-align w3-large w3-theme">
            <li><a class="w3-padding-large" href="#"><i class="fa fa-users"></i>دوستان</a></li>
            <li><a class="w3-padding-large" href="#"><i class="fa fa-envelope"></i>پیام‌ها</a></li>
            <li><a class="w3-padding-large" href="#"><i class="fa fa-bell"></i>هشدارها</a></li>
            <li><a class="w3-padding-large" href="#"><i class="fa fa-user-secret"></i>حساب من</a></li>
        </ul>
    </div>


    <script>
        // Accordion
        function myFunction(id) {
            var x = document.getElementById(id);
            if (x.className.indexOf("w3-show") == -1) {
                x.className += " w3-show";
                x.previousElementSibling.className += " w3-theme-d1";
            } else {
                x.className = x.className.replace("w3-show", "");
                x.previousElementSibling.className =
                x.previousElementSibling.className.replace("w3-theme-d1", "");
            }
        }

        // Used to toggle the menu on smaller screens when clicking on the menu button
        function openNav() {
            var x = document.getElementById("navDemo");
            if (x.className.indexOf("w3-show") == -1) {
                x.className += " w3-show";
            } else {
                x.className = x.className.replace(" w3-show", "");
            }
        }

        function openModal(element) {
            document.getElementById("modalProf").style.display = "block";
            document.getElementById("img01").src = element.src;
            document.getElementById("cap01").innerHTML = element.alt;
        }
    </script>


</body>
</html>
