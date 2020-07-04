<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Factory_Iraq.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<style>
        div.item{
                float:right;
                margin:10px;
                

            }
            div.item div{
                float:right;
                margin-left:5px;
            }

.pass{
    border:none;
    outline:none;
    border-bottom:1px solid blue;
} 
 .login{
     background:#ccc;
     border-radius:5px;
     margin:auto;
     display:block;
     width:50%;
     height:50px
 }
        
</style>

<div style="margin:100px auto;border:1px solid;border-radius:10px;height:400px;width:400px;position:relative">
    
    <div style="margin:70px auto;width:300px" >
        <asp:DropDownList ID="cmbUsers"  runat="server" CssClass="form-control"></asp:DropDownList>
    </div>

    <div style="margin:70px auto;width:300px" >
        <asp:TextBox ID="txtPass" Width="100%"   TextMode="Password" placeholder="كلمة المرور"  runat="server" CssClass=" pass"></asp:TextBox>
    </div>
    <div style="text-align:center;position:absolute;left:40%;top:220px">
    <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label>
    </div>

    <div style="margin:70px auto;width:300px" >
        <asp:Button runat="server" ID="btnLogin" Text="دخــــول" CssClass="login" OnClick="btnLogin_Click" />
    </div>

    
</div>

</asp:Content>
