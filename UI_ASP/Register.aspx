<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ASP_Authentication_Arman.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link href="styles/ui_2.css" rel="stylesheet" />
    <link href="styles/theme-blue-grey.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css" />

    <style>
        /****************Initializing*********************/
        @font-face {
            font-family: bankMeliFont;
            src: url("../fonts/bmi.ttf");
        }


        body {
            background-image: url("../images/back1.jpg");
            background-size: 100%;
            direction: rtl;
            font-family: bankMeliFont;
            margin: 0;
        }

        a {
            text-decoration: none;
        }


        table.tb tr td {
padding:7px 15px;
        }

        .create{
            padding: 10px;
            width: 100%;
            margin-top: -10px;
            cursor: pointer;
            transition: 0.4s;
            background-color: #04b147;
            color: white;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
        }
        .create:hover{
            background-color: white;
            font-size: 120%;
            color: #04b147;
            box-shadow: 2px 10px 15px grey;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:CreateUserWizard CreateUserButtonStyle-Font-Names="bankMeliFont" CreateUserButtonText="ثبت نام" OnCreatedUser="CreateUserWizard1_CreatedUser" ID="CreateUserWizard1" runat="server" BackColor="white" Font-Size="0.8em" Height="260px" Style="margin: 12px auto; max-width: 96%; width: 400px; box-shadow: 2px 5px 8px #000; border-radius: 30px;">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                    <ContentTemplate>
                        <table class="tb" border="0" style="font-size: 11px; width: 100%; height: 260px;">
                            <tr>
                                <td colspan="2" style="font-weight: bold; border-top-left-radius: 30px; border-top-right-radius: 30px; padding: 20px; font-size: 16px; color: white; background-color: #4c5cbe">ایجاد حساب جدید</td>
                            </tr>
                            <tr>
                                <td style="padding-top: 20px;">
                                    <asp:TextBox onfocus="this.style.borderBottom = '1px #6668db solid';" onblur="this.style.borderBottom = '1px black solid';" Style="direction: ltr; width: 100%; border-style: none none solid; border-width: 1px; border-color: black; display: block;" ID="UserName" runat="server"></asp:TextBox>
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">نام کاربری</asp:Label>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                        ErrorMessage="نام کاربری را وارد نکرده‌اید" ToolTip="نام کاربری را وارد کنید" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox onfocus="this.style.borderBottom = '1px #6668db solid';" onblur="this.style.borderBottom = '1px black solid';" Style="direction: rtl; width: 100%; border-style: none none solid; border-width: 1px; border-color: black; display: block;" ID="FirstName" runat="server"></asp:TextBox>
                                    <asp:Label runat="server">نام</asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName"
                                        ErrorMessage="نام را وارد نکرده‌اید" ToolTip="نام را وارد کنید" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox onfocus="this.style.borderBottom = '1px #6668db solid';" onblur="this.style.borderBottom = '1px black solid';" Style="direction: rtl; width: 100%; border-style: none none solid; border-width: 1px; border-color: black; display: block;" ID="LastName" runat="server"></asp:TextBox>
                                    <asp:Label runat="server">نام خانوادگی</asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="UserName"
                                        ErrorMessage="نام خانوادگی را وارد نکرده‌اید" ToolTip="نام خانوادگی را وارد کنید" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox onfocus="this.style.borderBottom = '1px #6668db solid';" onblur="this.style.borderBottom = '1px black solid';" Style="direction: ltr; width: 100%; border-style: none none solid; border-width: 1px; border-color: black; display: block;" ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">رمز عبور</asp:Label>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                        ErrorMessage="پسورد را وارد کنید" ToolTip="پسورد را وارد کنید" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:TextBox onfocus="this.style.borderBottom = '1px #6668db solid';" onblur="this.style.borderBottom = '1px black solid';" Style="direction: ltr; width: 100%; border-style: none none solid; border-width: 1px; border-color: black; display: block;" ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">تایید پسورد</asp:Label>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                        ErrorMessage="پسورد را تایید کنید" ToolTip="پسورد را تایید کنید"
                                        ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:TextBox onfocus="this.style.borderBottom = '1px #6668db solid';" onblur="this.style.borderBottom = '1px black solid';" Style="direction: ltr; width: 100%; border-style: none none solid; border-width: 1px; border-color: black; display: block;" ID="Email" runat="server"></asp:TextBox>
                                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">ایمیل</asp:Label>
                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                        ErrorMessage="ایمیل را وارد کنید" ToolTip="ایمیل را وارد کنید" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <asp:Label runat="server">جنسیت</asp:Label>
                                    <asp:DropDownList ID="genderDropDownList" runat="server">
                                        <asp:ListItem Selected="True">-</asp:ListItem>
                                        <asp:ListItem>دختر</asp:ListItem>
                                        <asp:ListItem>پسر</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <div class="w3-btn w3-theme-d5" style="position: relative; overflow: hidden; padding: 10px; margin-top: 10px; float: right;">
                                        <span><i class="fa fa-upload w3-margin-left"></i>آپلود فایل</span>
                                        <asp:FileUpload ID="uploadImageProfile" Style="position: absolute; top: 0; right: 0; margin: 0; padding: 0; font-size: 20px; cursor: pointer; opacity: 0; filter: alpha(opacity=0);" runat="server" />
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td align="center" colspan="2">
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                        ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="رمز عبور با تایید آن منطبق نیست!"
                                        ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color: red">
                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                    <ContentTemplate>
                        <table border="0" style="font-size: 100%; width: 568px; height: 260px">
                            <tr>
                                <td align="center" colspan="2" style="font-weight: bold; color: white; background-color: #5d7b9d">انجام شد...</td>
                            </tr>
                            <tr>
                                <td style="text-align: center">&nbsp; تبریک! حساب کاربری شما با موفقیت ساخته شد.</td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <asp:Button ID="ContinueButton" CssClass="create" runat="server" CausesValidation="False" CommandName="Continue"
                                        PostBackUrl="~/userProfile.aspx" Text="ادامه"
                                        ValidationGroup="CreateUserWizard1" />
                                    &nbsp; &nbsp; &nbsp;</td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CompleteWizardStep>
            </WizardSteps>
            <SideBarStyle BackColor="#5D7B9D" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top" />
            <SideBarButtonStyle BorderWidth="0px" />
            <ContinueButtonStyle BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="0px" />
            <NavigationButtonStyle BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="0px" />
            <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" Font-Size="0.9em"
                HorizontalAlign="Center" />
            <CreateUserButtonStyle
                BorderWidth="1px" CssClass="create" />
            <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <StepStyle BorderWidth="0px" />
        </asp:CreateUserWizard>
    </form>

</body>
</html>
