<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="welcome.aspx.cs" Inherits="Factory_Iraq.welcome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

 <div class="alert alert-success" role="alert" id="msg" runat="server" style="text-align:left;width:100%;margin-top:30px" >
 
</div>
</div>
    <script>
        setTimeout(function () { window.location="main.aspx" }, 10000);
    </script>
</asp:Content>
