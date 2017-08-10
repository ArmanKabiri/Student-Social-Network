<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ASP_Authentication_Arman.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <script src="jquery.js"></script>

    <style>
        /****************Initializing*********************/
        @font-face {
            font-family: bankMeliFont;
            src: url("../fonts/bmi.ttf");
        }

        body {
            background-image: url("../images/regBack.jpg");
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

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:CreateUserWizard OnCreatedUser="CreateUserWizard1_CreatedUser" ID="CreateUserWizard1" runat="server" BackColor="white" BorderColor="#E6E2D8" BorderStyle="Solid" BorderWidth="1px" Font-Size="0.8em" Height="260px" Style="margin: 12px auto; max-width:96%; width:400px; box-shadow:2px 5px 8px #000;">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                    <ContentTemplate>
                        <table class="tb" border="0" style="font-size: 11px; width: 100%; height: 260px">
                            <tr>
                                <td colspan="2" style="font-weight: bold; font-size:20px; color: white; background-color: #009688">ایجاد کاربر جدید</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox style="direction:ltr; width:100%; border-style:none none solid; border-width:1px; border-color:black; display:block;" ID="UserName" runat="server"></asp:TextBox>
                                    <asp:Label  ID="UserNameLabel" runat="server" AssociatedControlID="UserName">نام کاربری</asp:Label>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                        ErrorMessage="نام کاربری را وارد نکرده‌اید" ToolTip="نام کاربری را وارد کنید" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox style="direction:ltr; width:100%; border-style:none none solid; border-width:1px; border-color:black; display:block;" ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">رمز عبور</asp:Label>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                        ErrorMessage="پسورد را وارد کنید" ToolTip="پسورد را وارد کنید" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:TextBox style="direction:ltr; width:100%; border-style:none none solid; border-width:1px; border-color:black; display:block;" ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">تایید پسورد</asp:Label>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                        ErrorMessage="پسورد را تایید کنید" ToolTip="پسورد را تایید کنید"
                                        ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:TextBox style="direction:ltr; width:100%; border-style:none none solid; border-width:1px; border-color:black; display:block;" ID="Email" runat="server"></asp:TextBox>
                                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">ایمیل</asp:Label>
                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                        ErrorMessage="ایمیل را وارد کنید" ToolTip="ایمیل را وارد کنید" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:TextBox style="direction:ltr; width:100%; border-style:none none solid; border-width:1px; border-color:black; display:block;" ID="Question" runat="server"></asp:TextBox>
                                    <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">سؤال امنیتی</asp:Label>
                                    <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question"
                                        ErrorMessage="سؤال امنیتی را وارد کنید" ToolTip="سوال امنیتی را وارد کنید"
                                        ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:TextBox style="direction:ltr; width:100%; border-style:none none solid; border-width:1px; border-color:black; display:block;" ID="Answer" runat="server"></asp:TextBox>
                                    <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">جواب سوال امنیتی</asp:Label>
                                    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer"
                                        ErrorMessage="جواب سوال امنیتی را وارد کنید" ToolTip="جواب سوال امنیتی را وارد کنید"
                                        ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="RoleLable" runat="server" AssociatedControlID="RoleDropDownList">نوع کاربری</asp:Label>
                                    <asp:DropDownList ID="RoleDropDownList" runat="server"></asp:DropDownList>
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
                                <td style="text-align: left">&nbsp; تبریک! حساب کاربری شما با موفقیت ساخته شد.</td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <asp:Button ID="ContinueButton" runat="server" BackColor="#FFFBFF" BorderColor="#CCCCCC"
                                        BorderStyle="Solid" BorderWidth="1px" CausesValidation="False" CommandName="Continue"
                                        ForeColor="#284775" PostBackUrl="~/profile.aspx" Text="Continue"
                                        ValidationGroup="CreateUserWizard1" Width="105px" />
                                    &nbsp; &nbsp; &nbsp;</td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CompleteWizardStep>
            </WizardSteps>
            <SideBarStyle BackColor="#5D7B9D" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top" />
            <SideBarButtonStyle BorderWidth="0px" ForeColor="White" />
            <ContinueButtonStyle BackColor="#009688" BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="0px" ForeColor="#FFFFFF" />
            <NavigationButtonStyle BackColor="#009688" BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="0px" ForeColor="#FFFFFF" />
            <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" Font-Size="0.9em"
                ForeColor="White" HorizontalAlign="Center" />
            <CreateUserButtonStyle BackColor="#009688" BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="1px" ForeColor="#FFFFFF" />
            <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <StepStyle BorderWidth="0px" />
        </asp:CreateUserWizard>
    </form>

</body>
</html>
