<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmTest.aspx.cs" Inherits="Factory_Iraq.FrmTest" MasterPageFile="~/Site.Master"  %>




<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .comboClass{
            border:none;
            border-bottom:1px solid red;
            position:relative
        }
        .comboClass:after{
            height:100px;
            width:100px;
            background-color:green;
            position:absolute;
            top:0px;
            left:0px
        }
    </style>

    
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="comboClass" Width="189px">
            </asp:DropDownList>
            <br />
            <br />
            <asp:TextBox ID="TextBox1" runat="server" CssClass="comboClass"></asp:TextBox>
        </div>
    
    

</asp:Content>


