<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductionMaterials.aspx.cs" Inherits="Factory_Iraq.ProductionMaterials" %>
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


<h1> انتاج - كشف المواد</h1>

<div class="item" >
        <span style="line-height:33px;">اسم  المادة</span>
    </div>

    <div class="item" >
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <asp:DropDownList ID="cmbMaterials" runat="server" Width="400px" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="cmbMaterials_SelectedIndexChanged"  ></asp:DropDownList>
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>

     <div class="item">
                <div id="print">
                    <input type="button"   class="btn btn-primary"  value="طباعة" />
                    <img src="images/Avosoft-Warm-Toolbar-Print.ico" />
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
                    batch-numbers
                </th>
                <th style="width: 20%">
                    التاريخ
                </th>
                <th style="width: 10%">
                    سعر
                </th>
                <th style="width: 20%">
                     كمية  موجودة
                </th>
                <th style="width: 20%">
                    ت. انتاج
                </th>
                <th style="width: 20%">
                    ت. انتهاء
                </th>
                
            </tr>
                </thead>
            <tbody>
    </HeaderTemplate>

     <ItemTemplate>
            <tr>
                <td style="width: 10%" >
                     <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("c_name") %>' />
                </td>
                <td style="width: 20%">
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("c_date", "{0:MMM-yy dd hh:mm:ss tt}") %>' />
                </td>
                <td style="width: 10%">
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Expr1") %>' />
                </td>
                <td style="width: 10%">
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Expr11") %>' />
                </td>
                <td style="width: 20%">
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("date_p" , "{0:dd-MM-yyyy}"  ) %>' />
                </td>
                <td style="width: 15%">
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("date_e" , "{0:dd-MM-yyyy}") %>' />
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


        function PrintRepeater1() {

            var repeater = document.getElementById('table1');
            if (repeater == null)
                return;

            var report1 = document.querySelector('.report1');

            var printWindow = window.open('', '', 'height=400,width=800');

            printWindow.document.write('<html dir=rtl><head><style>table{text-align:center} div.item{ float:right;  margin:10px;  }   div.item div{ float:right;  margin-left:5px; }  .goLeft{  float:left !important }</style><title>انتاج - كشف المواد</title>');

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
    </script>

    </div>
</asp:Content>
