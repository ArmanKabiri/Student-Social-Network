<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ASP_Authentication_Arman.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <script src="jquery.js"></script>
    <style>
        /****************Initializing*********************/
        @font-face {
            font-family: bankMeliFont;
            src: url("../fonts/bmi.ttf");
        }

        body {
            background-image: url("../images/back2.jpg");
            background-size: 100%;
            direction: rtl;
            font-family: bankMeliFont;
            margin: 0;
        }


        a {
            text-decoration: none;
        }

        table.tb tr td {
            padding: 5px 20px;
            width: 100%;
        }

        .btn {
            transition: 0.4s;
            border: none;
            cursor: pointer;
            color: white;
            width: 100%;
            font-family: bankMeliFont;
            font-size: 16px;
            background-color: #04b147;
        }

            .btn:hover {
                background-color: white;
                font-size: 120%;
                color: #04b147;
                box-shadow: 2px 10px 15px grey;
            }
    </style>

</head>
<body>

    <form id="form1" runat="server">
        <asp:Login Style="margin: 12px auto; max-width: 96%; width: 500px; background-color: #FFF; box-shadow: 2px 5px 8px #000; border-radius: 30px;" ID="Login1" runat="server"
            CreateUserUrl="~/Register.aspx" OnLoggedIn="Login1_LoggedIn">
            <LayoutTemplate>
                <table cellpadding="1" cellspacing="0" style="border-collapse: collapse; width: 100%">
                    <tr>
                        <td>
                            <table style="width: 100%;" class="tb" cellpadding="0">
                                <tr>
                                    <td style="font-weight: bold; border-top-left-radius: 30px; border-top-right-radius: 30px; padding: 30px; font-size: 16px; color: white; background-color: #4c5cbe" colspan="2">ورود اعضا</td>
                                </tr>
                                <tr>
                                    <td style="padding-top: 20px;">
                                        <asp:TextBox onfocus="this.style.borderBottom = '1px #6668db solid';" onblur="this.style.borderBottom = '1px black solid';" Style="direction: ltr; width: 100%; border-style: none none solid; border-width: 1px; border-color: black; display: block;" ID="UserName" runat="server"></asp:TextBox>
                                        <asp:Label Style="display: block;" ID="UserNameLabel" runat="server" AssociatedControlID="UserName">نام کاربری</asp:Label>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="نام کاربری را وارد کنید" ToolTip="نام کاربری را وارد کنید" ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:TextBox onfocus="this.style.borderBottom = '1px #6668db solid';" onblur="this.style.borderBottom = '1px black solid';" Style="direction: ltr; width: 100%; border-style: none none solid; border-width: 1px; border-color: black; display: block;" ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:Label Style="display: block;" ID="PasswordLabel" runat="server" AssociatedControlID="Password">رمز عبور</asp:Label>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="رمز عبور را وارد کنید" ToolTip="رمز عبور را وارد کنید" ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:CheckBox ID="RememberMe" runat="server" Text="مرا لاگین نگه دار" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color: Red;">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="2">
                                        <asp:Button CssClass="btn" ID="LoginButton" runat="server" CommandName="Login" Text="ورود" ValidationGroup="Login1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:HyperLink ID="CreateUserLink" runat="server" NavigateUrl="~/Register.aspx">ثبت نام</asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:Login>
    </form>

</body>
</html>
