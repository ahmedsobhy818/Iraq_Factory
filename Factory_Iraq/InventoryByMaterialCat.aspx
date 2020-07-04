<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InventoryByMaterialCat.aspx.cs" Inherits="Factory_Iraq.InventoryByMaterialCat" %>
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
            #search img , #print img{
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

<h1>جرد المخزن حسب اصناف</h1>
    
        <div class="item">
        <div style="line-height:33px">الصنف : </div>
            <div>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="cmbMaterialCat" runat="server"  Width="264px" AutoPostBack="True" OnSelectedIndexChanged="cmbMaterialCat_SelectedIndexChanged" CssClass="form-control">
                </asp:DropDownList>
                </ContentTemplate>
            </asp:UpdatePanel>
                
            </div>
            </div>

        
           <div class="item">
                <div id="search">
                    <input type="text" placeholder="بحث" class="form-control"/>
                    <img src="images/search-outline-filled.png" />
                </div>
            </div>
           
        <div class="item">
                <div id="print">
                    <input type="button"   class="btn btn-primary"  value="طباعة" />
                    <img src="images/Avosoft-Warm-Toolbar-Print.ico" />
                </div>
            </div>

        <div class="item">
            <div>المجموع :</div>
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
                <th style="width: 10%" class=".hidden-sm-down">
                    كود
                </th>
                <th style="width: 10%">
                    الاسم
                </th>
                <th style="width: 10%">
                    السعر
                </th>
                <th style="width: 10%">
                    الكمية
                </th>
                <th style="width: 10%">
                    المجموع
                </th>
                <th style="width: 10%">
                    وحدة القياس
                </th>
                <th style="width: 5%">
                    تعبئة
                </th>
                <th style="width: 5%">
                    وزن
                </th>
                <th style="width: 10%">
                    ماركة
                </th>
                <th style="width: 10%">
                    صنف
                </th>
                <th style="width: 10%">
                    Limit
                </th>
            </tr>
                </thead>
            <tbody>
    </HeaderTemplate>

     <ItemTemplate>
            <tr>
                <td style="width: 10%" class=".hidden-sm-down">
                     <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("كود") %>' />
                </td>
                <td style="width: 10%">
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("اسم") %>' />
                </td>
                <td style="width: 10%">
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("سعر") %>' />
                </td>
                <td style="width: 10%">
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("كمية") %>' />
                </td>
                <td style="width: 10%">
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("مجموع") %>' />
                </td>
                <td style="width: 10%">
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("وحدة") %>' />
                </td>
                <td style="width: 5%">
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("تعبئة") %>' />
                </td>
                <td style="width: 5%">
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("وزن") %>' />
                </td>
                <td style="width: 10%">
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("ماركة") %>' />
                </td>
                <td style="width: 10%">
                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("صنف") %>' />
                </td>
                <td style="width: 10%">
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("حد الادنى") %>' />
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

        $("#search input").on('keyup', function () { doFilter() })

        $("#print input").on("click", function () { PrintRepeater() })

        function doFilter() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.querySelector("#search input");
            filter = input.value.toUpperCase();
            table = document.getElementById("table1");
            if (table == null)
                return;
            tr = table.getElementsByTagName("tr");
            total = 0;
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1];


                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                        console.log(tr[i].getElementsByTagName("td")[4].innerText);
                        total += parseFloat(tr[i].getElementsByTagName("td")[4].innerText.replace("$", "").replace(",", ""));
                    } else {
                        tr[i].style.display = "none";
                    }
                }

            }
            $('div.item').eq(3).find('span').text(total.toFixed(2) + "$");
        }

        function PrintRepeater() {

            var repeater = document.getElementById('table1');
            if (repeater == null)
                return;
            var printWindow = window.open('', '', 'height=400,width=800');

            printWindow.document.write('<html dir=rtl><head><style>table{text-align:center}</style><title>جرد المخزن حسب اصناف</title>');

            printWindow.document.write('</head><body >');

            printWindow.document.write(repeater.outerHTML);
            printWindow.document.write('</body></html>');

            //printWindow.document.close();
            printWindow.print();
            setTimeout(function () {


                printWindow.document.close();

            }, 500);

            return false;

        }
    </script>
    </div>
</asp:Content>
