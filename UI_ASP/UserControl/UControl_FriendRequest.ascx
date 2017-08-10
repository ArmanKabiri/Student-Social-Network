<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UControl_FriendRequest.ascx.cs" Inherits="UI_ASP.UserControl.UControl_FriendRequest" %>

<div class="w3-padding-16 w3-hover-light-grey w3-border-bottom" style="overflow: auto;">
    <div class="chip">
        <asp:Image ID="img_profilePic" runat="server" alt="avatar" />
        <asp:Label ID="lbl_firstName" runat="server"/>
        <asp:Label ID="lbl_lastName" runat="server" />
    </div>
    <div class="reqChip">
        <div onclick="checkRequest(this,0);" class="w3-btn" style="width: 50%; background-color: #f44336; float: left; border-bottom-left-radius: 20px; border-top-left-radius: 20px;"><i class="fa fa-remove"></i></div>
        <div onclick="checkRequest(this,1);" class="w3-btn" style="width: 50%; background-color: #4caf50; float: left; border-bottom-right-radius: 20px; border-top-right-radius: 20px;"><i class="fa fa-check"></i></div>
    </div>
</div>
