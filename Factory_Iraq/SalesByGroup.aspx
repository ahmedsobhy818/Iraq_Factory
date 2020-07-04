<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SalesByGroup.aspx.cs" Inherits="Factory_Iraq.SalesByGroup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
            table{text-align:center !important}
            table th{text-align:center !important}
            select{
                height:50px
            }
            #search , #print , #search2 , #print2, #search3 , #print3{
                position:relative;
                width:200px
            }
            #print input , #print2 input, #print3 input{
                width:190px
            }
            #search img,#print img,#search2 img,#print2 img,#search3 img,#print3 img {
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
            .goLeft{
                float:left !important
            }
            .report1 , .report2 , .report3{
                overflow: hidden;
                 clear: both;
            }

            .tablesaw td, .tablesaw th{
                text-align:center !important
            }
@media (max-width:640px){
    table.tablesaw td {
        width:100% !important
    }


}
            
        </style>



    <h1>تقرير المبيعات حسب المجموعة</h1>

    <div class="item" >
        <span style="line-height:33px;margin-left:80px">صنف</span>
    </div>

    <div class="item" style="min-width:300px">
        <asp:DropDownList ID="cmbGroups" runat="server" Width="200px" CssClass="form-control"  ></asp:DropDownList>
    </div>

    <div class="item"  >
            <div style="line-height:33px">من  :</div>
            <div>
                        <input type="date" runat="server" id="date1" value = "2020-01-01"  class="form-control" />
            </div>
        </div>

  <div class="item"  >
            <div style="line-height:33px;">الى  :</div>
            <div>
                        <input type="date" runat="server" id="date2" value = "2021-01-01" class="form-control" />
            </div>
        </div>

        <div class="item" style="clear:both">
                <div id="search">
                    <asp:UpdatePanel runat="server" style="width:100%">
                        <ContentTemplate>
                            <asp:Button  Text="بحـــث"  CssClass="btn btn-success" style="width:100%" runat="server"   ID="search_btn1" OnClick="search_btn1_Click" ></asp:Button>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
    
                    <img src="images/search-outline-filled.png" />
                </div>
            </div>
    
     <div class="item">
                <div id="print">
                    <input type="button"   class="btn btn-primary"  value="طباعة" />
                    <img src="images/Avosoft-Warm-Toolbar-Print.ico" />
                </div>
        </div>

   
    <div class="item"  >
                <div id="search2">
                    <asp:UpdatePanel runat="server" style="width:100%">
                        <ContentTemplate>
                            <asp:Label  Text="بحـــث عن مادة"  CssClass="btn btn-success" style="width:100%" runat="server"   ID="Button1"  ></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
    
                    <img src="images/search-outline-filled.png" />
                </div>
            </div>

     <div class="item"  >
 
        <div>
                        <input  runat="server" id="txtMaterial" class="form-control txtMaterial" />
            </div>
        </div>
    
    <div class="item"  >
 
        <div>
                    <asp:UpdatePanel runat="server"><ContentTemplate>
                       <asp:Label  runat="server" id="lblTotal" CssClass="form-control lblTotal" > 
                        </asp:Label>
                        </ContentTemplate> </asp:UpdatePanel>
            </div>
        </div>



    <asp:UpdatePanel runat="server">
        <ContentTemplate>
                
    <div id="report1" runat="server" class="report1">
    
            <asp:Repeater ID="Repeater1" runat="server">

                  <HeaderTemplate>
        <table id="table1" class="table tabled-bordered table-striped table-hover tablesaw tablesaw-stack"  data-tablesaw-mode="stack">
            <thead>
            <tr>
                <th style="width: 10%" >
                    كود
                </th>
                <th style="width: 20%">
                    الاسم
                </th>
                <th style="width: 10%">
                    سعر
                </th>
                <th style="width: 10%">
                    كمية 
                </th>
                <th style="width: 20%">
                    مجموع
                </th>
                <th style="width: 15%">
                    ماركة
                </th>
                <th style="width: 15%">
                    صنف
                </th>
                
            </tr>
                </thead>
            <tbody>
    </HeaderTemplate>

     <ItemTemplate>
            <tr>
                <td style="width: 10%" >
                     <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("id_code") %>' />
                </td>
                <td style="width: 20%">
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>' />
                </td>
                <td style="width: 10%">
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Expr1") %>' />
                </td>
                <td style="width: 10%">
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Expr2") %>' />
                </td>
                <td style="width: 20%">
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Expr3" ) %>' />
                </td>
                <td style="width: 15%">
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Mark" ) %>' />
                </td>
                <td style="width: 15%">
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("Dept" ) %>' />
                </td>
                

            </tr>
        </ItemTemplate>
     <FooterTemplate>
         </tbody>
        </table>
    </FooterTemplate>



                  </asp:Repeater>

</div>
            </ContentTemplate></asp:UpdatePanel>



    <script>
        $("#print input").on("click", function () { PrintRepeater1() })
        $(".txtMaterial").on('keyup', function () { doFilter() })

        function PrintRepeater1() {

            var repeater = document.getElementById('table1');
            if (repeater == null)
                return;

            var report1 = document.querySelector('.report1');

            var printWindow = window.open('', '', 'height=400,width=800');

            printWindow.document.write('<html dir=rtl><head><style>table{text-align:center} div.item{ float:right;  margin:10px;  }   div.item div{ float:right;  margin-left:5px; }  .goLeft{  float:left !important }</style><title>تقرير المبيعات حسب المجموعة</title>');

            printWindow.document.write('</head><body >');

            printWindow.document.write(report1.outerHTML);
            printWindow.document.write('</body></html>');

            //printWindow.document.close();
            printWindow.print();
            setTimeout(function () {


                printWindow.document.close();

            }, 500);

            return false;

        }
        function doFilter() {
            
            var input, filter, table, tr, td, i, txtValue;
            input = document.querySelector(".txtMaterial");
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
            $('div.item').eq(8).find('.lblTotal').text(total.toFixed(2) + "$");
        }
    </script>
    </div>
</asp:Content>
