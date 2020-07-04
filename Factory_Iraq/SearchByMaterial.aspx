<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchByMaterial.aspx.cs" Inherits="Factory_Iraq.SearchByMaterial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
  
        <style>
            table{text-align:center}
            table th{text-align:center}
            select{
                height:50px
            }
            #search , #print{
                position:relative;
                width:200px
            }
            #print input{
                width:190px
            }
            #search img {
                position:absolute;
                right:164px;
                height:30px;
                width:30px;
                top:4px
            }
            div.item{
                float:right;
                margin:10px;
                

            }
            div.item div{
                float:right;
                margin-left:5px;
            }
@media (max-width:640px){
    table.tablesaw td {
        width:100% !important
    }


}
            
        </style>

<h1>بحث حسب المادة</h1>
    
        <div class="item">
        <div style="line-height:33px">الاسم : </div>
            <div>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="cmbNames" runat="server"  Width="264px"   CssClass="form-control">
                </asp:DropDownList>
                </ContentTemplate>
            </asp:UpdatePanel>
                
            </div>
            </div>

    <div class="item" >
            <div style="line-height:33px">من التاريخ :</div>
            <div>
                
                    <%--<asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>   --%>
                        <input type="date" runat="server" id="date1" value = "2020-01-01"  class="form-control" />
                 
                
            </div>
        </div>

        
           <div class="item" style="clear:both">
        <div style="line-height:33px">الكود : </div>
               <div id="code">
                    <asp:TextBox  cssClass="form-control" runat="server" ID="txtCode">        </asp:TextBox>
                </div>
            </div>
    
    <div class="item" >
            <div style="line-height:33px">الى التاريخ :</div>
            <div>
                
                    <%-- <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>   --%>
                        <input type="date" runat="server" id="date2" value = "2021-01-01"  class="form-control"/>
                    

            </div>
        </div>

    
    <div class="item" style="clear:both">
                <div id="search">
                    <asp:UpdatePanel runat="server" style="width:100%">
                        <ContentTemplate>
                            <asp:Button  Text="بحـــث"  CssClass="btn btn-success" style="width:100%" runat="server" OnClick="Unnamed3_Click"  ></asp:Button>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
    
                    <img src="images/search-outline-filled.png" />
                </div>
            </div>
           


        <div class="item" >
            <div>كمية المواد فى المخزن :</div>
            <div>
                <asp:UpdatePanel runat="server" ID="upTotal">
                    <ContentTemplate>
                        <asp:Label ID="lblTotal" runat="server"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
                
            </div>
        </div>

        <div class="item" style="clear:both">
            
        </div>


    <asp:UpdatePanel ID="UpRepeater" runat="server">
        <ContentTemplate>
              <asp:Repeater ID="Repeater1" runat="server">
         <HeaderTemplate>
        <table id="table1" class="table tabled-bordered table-striped table-hover tablesaw tablesaw-stack"  data-tablesaw-mode="stack">
            <thead>
            <tr>
                <th style="width: 20%" >
                    رقم الوصلة
                </th>
                <th style="width: 20%">
                    الاسم
                </th>
                <th style="width: 20%">
                    السعر
                </th>
                <th style="width: 20%">
                    العدد
                </th>
                <th style="width: 10%">
                    التاريخ
                </th>
                <th style="width: 10%">
                    رقم السيارة
                </th>
                
            </tr>
                </thead>
            <tbody>
    </HeaderTemplate>

     <ItemTemplate>
            <tr>
                <td style="width: 20%" >
                     <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("رقم_الوصلة") %>' />
                </td>
                <td style="width: 20%">
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("اسم") %>' />
                </td>
                <td style="width: 20%">
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("سعر") %>' />
                </td>
                <td style="width: 20%">
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("العدد") %>' />
                </td>
                <td style="width: 10%">
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("التاريخ" ,  "{0:MMM-yy-dd}") %>' />
                </td>
                <td style="width: 10%">
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("رقم السيارة") %>' />
                </td>
                
            </tr>
        </ItemTemplate>
     <FooterTemplate>
         </tbody>
        </table>
    </FooterTemplate>
    </asp:Repeater>
        </ContentTemplate>
    </asp:UpdatePanel>
  



  <script>
      
      //document.getElementById("date1").value = "2020-01-01";
  </script>
    </div>
</asp:Content>
