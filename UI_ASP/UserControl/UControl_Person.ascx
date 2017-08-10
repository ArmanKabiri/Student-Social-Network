<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UControl_Person.ascx.cs" Inherits="UI_ASP.UserControl.UControl_Person" %>

<div class="w3-padding-16 w3-hover-light-grey w3-border-bottom" style="overflow: auto;">

    <div class="chip">
        <asp:Image ID="img_profilePic" runat="server" alt="avatar" />
        <asp:Label ID="lbl_firstName" runat="server">پویا</asp:Label>
        <asp:Label ID="lbl_lastName" runat="server">قاسمی</asp:Label>
    </div>
    <button onclick="sendFriendRequest(this);" class="btnChip sendReqFriend">درخواست دوستی</button>

</div>
