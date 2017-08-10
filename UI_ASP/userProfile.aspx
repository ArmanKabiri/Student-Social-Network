<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userProfile.aspx.cs" Inherits="ASP_Authentication_Arman.userProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Profile</title>

    <link href="styles/ui_2.css" rel="stylesheet" />
    <link href="styles/theme-blue-grey.css" rel="stylesheet" />
    <link href="styles/ui.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css" />
    <%@ Register TagPrefix="post" TagName="userpostcontrol" Src="~/usercontrol/ucontrol_post.ascx" %>

</head>

<body>
    <form runat="server" method="post">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div id="mainContent">
            <!-- Navbar -->
            <div class="w3-top">
                <ul class="w3-navbar w3-theme-d2 w3-left-align w3-large">
                    <li class="w3-hide-medium w3-hide-large w3-opennav w3-right">
                        <a class="w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
                    </li>
                    <li><a href="javascript:void(0);" class="w3-padding-large w3-theme-d4"><i class="fa fa-home"></i></a></li>


                    <li class="w3-hide-small"><a href="#" class="w3-padding-large w3-hover-white" title="خبرهای جدید"><i class="fa fa-globe"></i></a></li>
                    <li class="w3-hide-small"><a onclick="openModalFriend();" href="#" class="w3-padding-large w3-hover-white" title="دوستان"><i class="fa fa-users"></i></a></li>
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
                        <a href="#" class="w3-hover-white" title="حساب من" onclick="openSideNav();">
                            <asp:Image runat="server" ID="img_profileImageSmall" class="w3-circle" Style="height: 29px; width: 29px;" alt="Avatar" />
                        </a>
                    </li>
                </ul>
            </div>


            <%-- Modal List_Friend Box --%>
            <div class="modal" id="modalFriend">
                <span onclick="this.parentElement.style.display = 'none'; " class="closeIt">x</span>
                <div class="friendContainer">
                    <div class="w3-theme-dark" style="padding: 10px; color: #fff; width: 110%; margin-right: -15px; margin-bottom: 10px;">
                        <h4><i class="fa fa-users w3-margin-left"></i>دوستان</h4>
                    </div>

                    <asp:PlaceHolder runat="server" ID="friendPlaceHolder"></asp:PlaceHolder>
                    <asp:HiddenField runat="server" ClientIDMode="Static" ID="HField_unFriend" />

                    <asp:Button ID="btn_applyUnFriend" ClientIDMode="Static"
                        runat="server" Style="padding: 12px;" class="w3-btn-block w3-margin-bottom w3-theme-d5" Text="تایید!" />

                    <hr class="w3-clear" />
                    <div style="float: right; width: 85%; padding-left: 10px;">
                        <asp:TextBox runat="server" ID="txt_findPersonNameFamily" type="text" placeholder="جست و جو برای دوست جدید..." Style="background-color: #b4b4b4; border: none; width: 100%; padding: 10px;" onfocus="this.style.backgroundColor = '#fff'; this.style.border = '3px solid #6668db';" onblur="this.style.backgroundColor = '#b4b4b4'; this.style.border = 'none';"></asp:TextBox>
                    </div>
                    <div style="float: right; width: 15%;">
                        <asp:UpdatePanel ID="UPanel_FindPerson" runat="server">
                            <ContentTemplate>
                                <fieldset>
                                    <asp:Button runat="server" ID="btn_findPerson" OnClick="btn_findPerson_Click" OnClientClick="findPerson();" Style="padding: 12px;" class="w3-btn-block w3-margin-bottom w3-theme-d5" Text="بگرد!" />
                                </fieldset>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </div>
                </div>
            </div>
            <%-- ------------------------------- --%>

            <%-- Modal List of Friend Request --------------------- --%>
            <div class="modal" id="modalFriendRequest">
                <span onclick="this.parentElement.style.display = 'none'; " class="closeIt">x</span>
                <div class="friendContainer">
                    <div class="w3-theme-dark" style="padding: 10px; color: #fff; width: 110%; margin-right: -15px; margin-bottom: 10px;">
                        <h4><i class="fa fa-users w3-margin-left"></i>درخواست‌های دوستی</h4>
                    </div>

                    <asp:PlaceHolder runat="server" ID="friendRequestPlaceHolder"></asp:PlaceHolder>
                    <asp:HiddenField runat="server" ClientIDMode="Static" ID="HField_FriendRequest" />

                    <hr class="w3-clear" />
                    <asp:Button ID="btn_applyFrienRequest" ClientIDMode="Static" OnClick="btn_applyFrienRequest_Click"
                        runat="server" Style="padding: 12px;" class="w3-btn-block w3-margin-bottom w3-theme-d5" Text="تایید!" />
                </div>
            </div>

            <%-- Modal List of Persons Found --------------------- --%>
            <div class="modal" id="modalFoundPerson">
                <span onclick="this.parentElement.style.display = 'none'; " class="closeIt">x</span>
                <div class="friendContainer">
                    <div class="w3-theme-dark" style="padding: 10px; color: #fff; width: 110%; margin-right: -15px; margin-bottom: 10px;">
                        <h4><i class="fa fa-users w3-margin-left"></i>افراد یافته شده</h4>
                    </div>

                    <asp:PlaceHolder runat="server" ID="personPlaceHolder"></asp:PlaceHolder>
                    <div class="w3-padding-16 w3-hover-light-grey w3-border-bottom" style="overflow: auto;">

                        <div class="chip">
                            <asp:Image ImageUrl="~/images/profile/std_arman.jpg" ID="img_profilePic" runat="server" alt="avatar" />
                            <asp:Label ID="lbl_firstName" runat="server">آرمان</asp:Label>
                            <asp:Label ID="lbl_lastName" runat="server">کبیری</asp:Label>
                        </div>
                        <button onclick="sendFriendRequest(this);" class="btnChip sendReqFriend">درخواست دوستی</button>

                    </div>
                    <asp:HiddenField runat="server" ClientIDMode="Static" ID="HField_SendFriendRequest" />

                    <hr class="w3-clear" />
                    <asp:Button ID="btn_applySendFrienRequest" ClientIDMode="Static"
                        runat="server" Style="padding: 12px;" class="w3-btn-block w3-margin-bottom w3-theme-d5" Text="تایید!" />
                </div>
            </div>


            <%-- Side NavBar Push --%>
            <div id="myOverlayNav" onclick="closeSideNav()"></div>
            <div id="mySideNav">
                <a onclick="closeSideNav()" href="javascript:void(0)" style="font-size: 35px; position: absolute; top: 0; left: 25px;">×</a>
                <br />
                <br />
                <a href="javascript:void(0)"><i class="fa fa-info-circle w3-margin-left"></i>درباره ما</a>
                <a href="javascript:void(0)"><i class="fa fa-download w3-margin-left"></i>خدمات</a>
                <a href="javascript:void(0)"><i class="fa fa-cogs w3-margin-left"></i>تنظیمات حساب</a>
                <a href="javascript:void(0)"><i class="fa fa-fax w3-margin-left"></i>تماس با ما</a>
                <asp:LinkButton runat="server" ID="btn_exit" OnClick="btn_exit_Click" Style="cursor: pointer"><i class="fa fa-power-off w3-margin-left"></i>خروج از حساب</asp:LinkButton>
            </div>

            <!-- Navbar on small screens -->
            <div id="navDemo" class="w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top: 47px">
                <ul class="w3-navbar w3-right-align w3-large w3-theme" style="box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.9)">
                    <li><a onclick="openModalFriend();" class="w3-padding-large" href="#"><i class="fa fa-users w3-margin-left"></i>دوستان</a></li>
                    <li><a class="w3-padding-large" href="#"><i class="fa fa-envelope w3-margin-left"></i>پیام‌ها</a></li>
                    <li><a class="w3-padding-large" href="#"><i class="fa fa-bell w3-margin-left"></i>هشدارها</a></li>
                    <li><a class="w3-padding-large" href="#" onclick="openSideNav();"><i class="fa fa-user-secret w3-margin-left"></i>حساب من</a></li>
                </ul>
            </div>

            <!-- Page Container -->
            <div class="w3-container w3-content" style="max-width: 1400px; margin-top: 80px">
                <!-- The Grid -->
                <div class="w3-row">
                    <!-- Right Column -->

                    <div class="w3-col m3">
                        <!-- Profile -->
                        <div class="w3-card-2 w3-round w3-white">
                            <div class="w3-container">
                                <asp:Label Style="display: block; margin: 12px 0;" runat="server" ID="lbl_userFullName" class="w3-center" Text="ممد صنیع" />
                                <asp:Image runat="server" ID="img_profileImageBig" ClientIDMode="Static" class="w3-circle userProfile" Style="height: 116px; width: 116px;" alt="عکس پروفایل" onclick="openModal(this);" />
                                <div class="modal" id="modalProf">
                                    <span onclick="this.parentElement.style.display = 'none'" class="closeIt">x</span>
                                    <img id="img01" src="#" alt="Avatar" />
                                    <div id="cap01"></div>
                                </div>

                                <hr>
                                <p><i class="fa fa-pencil fa-fw w3-margin-left w3-text-theme"></i>طراح، گرافیست</p>
                                <p><i class="fa fa-home fa-fw w3-margin-left w3-text-theme"></i>شهرکرد</p>
                                <p><i class="fa fa-birthday-cake fa-fw w3-margin-left w3-text-theme"></i>بهمن ۷۳</p>
                            </div>
                        </div>
                        <br>

                        <!-- Accordion -->
                        <div class="w3-card-2 w3-round">
                            <div class="w3-accordion w3-white">
                                <div onclick="myFunction('Demo1')" class="w3-btn-block w3-theme-l1 w3-right-align w3-padding-16 w3-border-bottom"><i class="fa fa-circle-o-notch fa-fw w3-margin-left"></i>گروه‌ها</div>
                                <div id="Demo1" class="w3-accordion-content w3-container">
                                    <p>شما در حال حاضر در هیچ گروهی عضو نمی‌باشید!!!</p>
                                </div>
                                <div onclick="myFunction('Demo2')" class="w3-btn-block w3-theme-l1 w3-right-align w3-padding-16 w3-border-bottom"><i class="fa fa-calendar-check-o fa-fw w3-margin-left"></i>رویدادهای جدید</div>
                                <div id="Demo2" class="w3-accordion-content w3-container">
                                    <br />
                                    <div class="w3-card-2 w3-round w3-white w3-center">
                                        <div class="w3-container">
                                            <img src="images/event.jpg" alt="shahrekord" style="width: 100%;" class="images w3-card" onclick="openModal(this);">
                                            <p><strong>تور شهرکرد گردی</strong></p>
                                            <p>پنجشنبه ۸ صبح</p>
                                            <p>
                                                <div class="w3-btn w3-btn-block w3-theme-l4">اطلاعات بیشتر</div>
                                            </p>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="w3-card-2 w3-round w3-white w3-center">
                                        <div class="w3-container">
                                            <img src="images/event2.png" alt="startup weekend" style="width: 100%;" class="images w3-card" onclick="openModal(this);">
                                            <p><strong>استارتاپ ویکند تهران</strong></p>
                                            <p>۱۸ تا ۲۰ اسفند</p>
                                            <p>
                                                <div class="w3-btn w3-btn-block w3-theme-l4">اطلاعات بیشتر</div>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div onclick="myFunction('Demo3')" class="w3-btn-block w3-theme-l1 w3-right-align w3-padding-16 w3-border-bottom"><i class="fa fa-users fa-fw w3-margin-left"></i>آلبوم عکس‌ها</div>
                                <div id="Demo3" class="w3-accordion-content w3-container">
                                    <div class="w3-row-padding">
                                        <br>
                                        <div class="w3-half" style="width: 33%;">
                                            <img src="images/img1.jpg" style="width: 100%;" class="w3-margin-bottom images w3-card-2" onclick="openModal(this)" alt="مرد آهنی">
                                        </div>
                                        <div class="w3-half" style="width: 33%;">
                                            <img src="images/img2.jpg" style="width: 100%;" class="w3-margin-bottom images w3-card-2" onclick="openModal(this)" alt="Gears of Wars">
                                        </div>
                                        <div class="w3-half" style="width: 33%;">
                                            <img src="images/img3.jpg" style="width: 100%;" class="w3-margin-bottom images w3-card-2" onclick="openModal(this)" alt="Mass Effect 2">
                                        </div>
                                        <div class="w3-half" style="width: 33%;">
                                            <img src="images/img4.jpg" style="width: 100%;" class="w3-margin-bottom images w3-card-2" onclick="openModal(this)" alt="خدای جنگ">
                                        </div>
                                        <div class="w3-half" style="width: 33%;">
                                            <img src="images/img5.jpg" style="width: 100%;" class="w3-margin-bottom images w3-card-2" onclick="openModal(this)" alt="کشیش قاتل">
                                        </div>
                                        <div class="w3-half" style="width: 33%;">
                                            <img src="images/img6.jpg" style="width: 100%;" class="w3-margin-bottom images w3-card-2" onclick="openModal(this)" alt="Call of Duty: Modern Warfare 3">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>

                        <!-- Interests -->
                        <div class="w3-card-2 w3-round w3-white w3-hide-small">
                            <div class="w3-container">
                                <p>علاقه‌مندی‌های من</p>
                                <p>
                                    <span class="w3-tag w3-small w3-theme-d5">سیاست</span>
                                    <span class="w3-tag w3-small w3-theme-d4">دانشگاه شهرکرد</span>
                                    <span class="w3-tag w3-small w3-theme-d2">بازی</span>
                                    <span class="w3-tag w3-small w3-theme-d1">دورهمی</span>
                                    <span class="w3-tag w3-small w3-theme">فیلم</span>
                                    <span class="w3-tag w3-small w3-theme-l2">مد و لباس</span>
                                    <span class="w3-tag w3-small w3-theme-l3">فوتبال</span>
                                    <span class="w3-tag w3-small w3-theme-l4">عکاسی</span>
                                    <span class="w3-tag w3-small w3-theme-l5">موسیقی</span>
                                </p>
                            </div>
                        </div>
                        <br>

                        <!-- Alert Box -->
                        <div class="w3-container w3-round w3-theme-l4 w3-border w3-theme-border w3-margin-bottom w3-hide-small" style="overflow: hidden; height: auto;">
                            <span onclick="this.parentElement.style.display='none'" class="w3-hover-text-grey w3-closebtn" style="float: left;">
                                <i class="fa fa-remove"></i>
                            </span>
                            <p><strong>سلام!!!</strong></p>
                            <p>هم اکنون می‌توانید نسخه اندروید و iOS اپلیکیشن ما رو دانلود کنید!</p>
                            <img src="images/appStore.png" alt="اپل" style="width: 50%; cursor: pointer; float: left;" />
                            <img src="images/googlePlay.png" alt="اندروید" style="width: 50%; cursor: pointer; float: left; margin-bottom: 5px;" />
                        </div>

                        <!-- End Right Column -->
                    </div>

                    <!-- Middle Column -->
                    <div class="w3-col m7">

                        <div class="w3-row-padding">
                            <div class="w3-col m12">
                                <div class="w3-card-2 w3-round w3-white">
                                    <div class="w3-container w3-padding">

                                        <asp:TextBox placeholder="متن خود را وارد کنید..." runat="server" ID="txt_postContentToSend" Style="border: 1px grey solid; width: 100%; height: 80px; padding: 10px; margin-top: 20px;" onfocus="this.style.backgroundColor = '#fff'; this.style.border = '3px solid #6668db';" onblur="this.style.backgroundColor = '#b4b4b4'; this.style.border = 'none';" />
                                        <br />
                                        <asp:Button ID="btn_post" OnClick="btn_post_Click" runat="server" Style="float: left; margin-top: 10px;" type="button" class="w3-btn w3-theme-d5" Text="پست" />

                                        <div class="w3-btn w3-theme-d5" style="position: relative; overflow: hidden; padding: 10px; margin-top: 10px; float: right;">
                                            <span><i class="fa fa-upload w3-margin-left"></i>آپلود عکس</span>
                                            <asp:FileUpload Style="position: absolute; top: 0; right: 0; margin: 0; padding: 0; font-size: 20px; cursor: pointer; opacity: 0; filter: alpha(opacity=0);" runat="server" ID="uploadFile" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%-- Dynamic Post Holder --%>
                        <asp:PlaceHolder runat="server" ID="postPlaceHolder"></asp:PlaceHolder>



                        <div id="loader"></div>
                        <div class="modal" id="modalPost" style="padding-top: 5px;">
                            <span onclick="this.parentElement.style.display = 'none'; " class="closeIt">x</span>
                            <div class="postContainer" id="post01">
                            </div>
                        </div>


                        <!-- End Middle Column -->
                    </div>

                    <!-- Left Column -->
                    <div class="w3-col m2">
                        <div class="w3-card-2 w3-round w3-white w3-center">
                            <div class="w3-container">
                                <p>رویداد نزدیک شما</p>
                                <img src="images/event.jpg" alt="شهرکرد" style="width: 100%;" class="images" onclick="openModal(this);">
                                <p><strong>تور شهرکرد گردی</strong></p>
                                <p>پنجشنبه ۸ صبح</p>
                                <p>
                                    <div class="w3-btn w3-btn-block w3-theme-l4">اطلاعات بیشتر</div>
                                </p>
                            </div>
                        </div>
                        <br>

                        <div class="w3-card-2 w3-round w3-white w3-center">
                            <div onclick="openModalFriendRequest();" class="w3-btn-block w3-theme-l1 w3-right-align" style="padding: 20px;"><i class="fa fa-hand-grab-o w3-margin-left"></i>درخواست های دوستی</div>
                            <asp:Panel runat="server" ID="Panel_LastFriendRequest" class="w3-container">
                                <p>آخرین درخواست</p>
                                <asp:Image runat="server" ID="img_lastFriendRequestProfileImage" alt="Avatar" Style="width: 50%;" class="images w3-card-2" onclick="openModal(this);" /><br />
                                <asp:Label runat="server" ID="lbl_lastFriendRequestFullName" />
                                <div class="w3-row">
                                    <div class="w3-half">
                                        <div class="w3-btn w3-green w3-btn-block w3-section" title="قبول کردن"><i class="fa fa-check"></i></div>
                                    </div>
                                    <div class="w3-half">
                                        <div onclick="this.parentElement.parentElement.parentElement.style.display = 'none'" class="w3-btn w3-red w3-btn-block w3-section" title="رد کردن"><i class="fa fa-remove"></i></div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                        <br>

                        <div class="w3-card-2 w3-round w3-white w3-padding-16 w3-center">
                            <img src="images/ad.jpg" alt="ADS" style="width: 100%;" class="images" onclick="openModal(this)" />
                            <p>تبلیغات</p>
                        </div>
                        <br>

                        <!-- End Left Column -->
                    </div>

                    <!-- End Grid -->
                </div>

                <!-- End Page Container -->
            </div>
            <br>

            <!-- Footer -->
            <footer class="w3-container w3-theme-d3 w3-padding-16">
                <h5>شبکه اجتماعی</h5>
            </footer>
        </div>

    </form>





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

        // Setting the Like
        function setLike(element) {
            if (element.className.indexOf("like") == -1) {
                element.className = element.className.replace("fa-heart-o", " fa-heart like");
            }
            else {
                element.className = element.className.replace("fa-heart like", "fa-heart-o")
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

        // Open Modal Box for Images of user
        function openModal(element) {
            document.getElementById("modalProf").style.display = "block";
            document.getElementById("img01").src = element.src;
            document.getElementById("cap01").innerHTML = element.alt;
        }

        // Open Modal Box for Posts

        function openModalPost(element) {
            document.getElementById("loader").style.display = "block";
            setTimeout(function () {
                document.getElementById("loader").style.display = "none";
                document.getElementById("modalPost").style.display = "block";
                document.getElementById("post01").innerHTML = element.parentElement.parentElement.innerHTML;
                document.getElementById("post01").children[0].children[10].style.display = "block";
                document.getElementById("post01").children[0].children[7].style.visibility = "hidden";
            }, 3000);

        }

        // Open Modal Box for Friends
        function openModalFriend() {
            document.getElementById("modalFriend").style.display = "block";
        }
        // Open Modal Box for Friend Requests
        function openModalFriendRequest() {
            document.getElementById("modalFriendRequest").style.display = "block";
        }

        hidden1 = document.getElementById("HField_FriendRequest");
        hidden1.value = "";
        hidden2 = document.getElementById("HField_unFriend");
        hidden2.value = "";
        hidden3 = document.getElementById("HField_sendFriendRequest");
        hidden3.value = "";
        // Accept or Decline Friend Request
        function checkRequest(element, val) {
            //document.getElementById("btn_applyFrienRequest").removeAttribute("disabled");
            fuser = element.parentElement.parentElement.children[0].children[1].innerHTML;
            luser = element.parentElement.parentElement.children[0].children[2].innerHTML;
            hidden1.value += fuser + "?" + luser + ":" + val + ",";
            element.parentElement.parentElement.style.display = "none";
        }
        //
        function cancelFriend(element) {
            //document.getElementById("btn_applyUnFriend").removeAttribute("disabled");
            fuser = element.parentElement.parentElement.children[0].children[1].innerHTML;
            luser = element.parentElement.parentElement.children[0].children[2].innerHTML;
            hidden2.value += fuser + "?" + luser + ",";
            element.parentElement.style.display = "none";
        }
        // 
        function sendFriendRequest(element) {
            //document.getElementById("btn_applySendFrienRequest").removeAttribute("disabled");
            fuser = element.parentElement.parentElement.children[0].children[1].innerHTML;
            luser = element.parentElement.parentElement.children[0].children[2].innerHTML;
            hidden3.value += fuser + "?" + luser + ",";
            element.parentElement.style.display = "none";
        }

        // Show Found Persons Modal Box
        function findPerson() {
            document.getElementById("modalFoundPerson").style.display = "block";
            document.getElementById("modalFriend").style.display = "none";
        }


        // Open Side Navbar with Push Technology
        function openSideNav() {
            document.getElementById("mySideNav").style.width = "250px";
            document.getElementById("myOverlayNav").style.width = "100%";
            document.getElementById("myOverlayNav").style.opacity = "0.7";
            document.getElementById("mainContent").style.marginRight = "250px";
        }
        function closeSideNav() {
            document.getElementById("mySideNav").style.width = "0%";
            document.getElementById("myOverlayNav").style.width = "0%";
            document.getElementById("myOverlayNav").style.opacity = "0";
            document.getElementById("mainContent").style.marginRight = "0";
        }
    </script>


</body>
</html>
