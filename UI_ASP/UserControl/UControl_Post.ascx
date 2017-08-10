<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UControl_Post.ascx.cs" Inherits="UI_ASP.UserControl.UControl_Post" %>

<div>
    <div class="w3-container w3-card-2 w3-white w3-round w3-margin" style="overflow: hidden;">
        <br />
        <asp:Image ID="img_userImage" runat="server" Style="width: 60px" class="w3-right w3-circle w3-margin-left" alt="Avatar" />
        <asp:Label ID="lbl_userName" runat="server" Style="display: block; margin: 16px 0;">محمد صنیع</asp:Label>
        <br />
        <hr class="w3-clear" />
        <asp:Image ID="img_postImage" runat="server" class="w3-margin-bottom" Style="width: 100%" alt="Post Image" />
        <asp:Label ID="lbl_content" runat="server" Style="display: block; margin: 16px 0;">متن الکی....................</asp:Label>
        <button class="w3-btn w3-theme-d2 w3-margin-bottom" type="button" onclick="openModalPost(this);"><i class="fa fa-comment"></i>&nbsp;کامنت‌ها</button>
        <p style="float: left; margin-top: -5px; color: red;"><i class="fa fa-heart-o fa-3x" style="cursor: pointer;" onclick="setLike(this);"></i></p>
        <hr class="w3-clear" />

        <div id="comment" style="display: none">
            <%-- here is where comment shown later.. hahaha --%>
            <asp:PlaceHolder runat="server" ID="CommentHolder"></asp:PlaceHolder>
            <div style="overflow: hidden;" class="w3-card-4 w3-theme-l3 w3-margin-bottom w3-padding">
                <asp:Image ImageUrl="~/images/profile/std_reza.jpg" ID="img_profileImage" runat="server" Style="width: 50px" class="w3-right w3-circle w3-margin-left" alt="Avatar" />
                <asp:Label ID="Label1" runat="server" Style="display: block; margin: 16px 0;">رضا عامری‌زاده</asp:Label>
                <asp:Label ID="Label2" runat="server" Style="display: block; margin: 16px 0;">سلام چطوری؟ حالت خوبه داداش؟</asp:Label>
            </div>
            <div style="overflow: hidden;" class="w3-card-4 w3-theme-l3 w3-margin-bottom w3-padding">
                <asp:Image ImageUrl="~/images/profile/std_sani.jpg" ID="Image1" runat="server" Style="width: 50px" class="w3-right w3-circle w3-margin-left" alt="Avatar" />
                <asp:Label ID="Label3" runat="server" Style="display: block; margin: 16px 0;">محمد صنیع</asp:Label>
                <asp:Label ID="Label4" runat="server" Style="display: block; margin: 16px 0;">مرسی قربانت! مچکرم!</asp:Label>
            </div>
            <%-- -------------------------------------------------------- --%>

            
                <div style="float: right; width: 85%; padding-left: 10px;">
                    <%--<input type="text" placeholder="نظر را وارد کنید..." style="border: 1px grey solid; width: 100%; padding: 10px;" onfocus="this.style.backgroundColor = '#d6cbdb'; this.style.border = '1px solid #8e2460';" onblur="this.style.backgroundColor = '#fff'; this.style.border = '1px solid grey';" />--%>
                <asp:TextBox ID="txt_comment" runat="server" placeholder="نظر را وارد کنید..." Style="border: 1px grey solid; width: 100%; padding: 10px;" onfocus="this.style.backgroundColor = '#d6cbdb'; this.style.border = '1px solid #8e2460';" onblur="this.style.backgroundColor = '#fff'; this.style.border = '1px solid grey';" />
                </div>
                <div style="float: right; width: 15%;">
                            <asp:LinkButton ID="btn_sendComment1" OnClick="btn_sendComment_Click1" runat="server" Style="padding: 12px;" class="w3-btn-block w3-margin-bottom w3-theme-d5" Text="بفرست!" />

                </div>
            
        </div>
    </div>
</div>

