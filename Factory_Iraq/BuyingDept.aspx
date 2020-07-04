<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BuyingDept.aspx.cs" Inherits="Factory_Iraq.BuyingDept" %>
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
    <div class="all">
<h1>ديون جهات الشراء</h1>


<div class="item">
                <div id="print" class="print">
                    <input type="button"   class="btn btn-primary"  value="طباعة" />
                    <img src="images/Avosoft-Warm-Toolbar-Print.ico" />
                </div>
        </div>


    
     
               <asp:Repeater ID="Repeater1" runat="server">

                  <HeaderTemplate>
        <table id="table1" class="table tabled-bordered table-striped table-hover tablesaw tablesaw-stack"  data-tablesaw-mode="stack">
            <thead>
            <tr>
                <th style="width: 50%" >
                    اسم
                </th>
                <th style="width: 50%">
                    الباقى
                </th>
                
            </tr>
                </thead>
            <tbody>
    </HeaderTemplate>

     <ItemTemplate>
            <tr>
                <td style="width: 20%" >
                     <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("اسم") %>' />
                </td>
                <td style="width: 20%">
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("الباقي") %>' />
                </td>
                

            </tr>
        </ItemTemplate>
     <FooterTemplate>
         </tbody>
        </table>
    </FooterTemplate>



                  </asp:Repeater>

        </div>
           
    <script>
        $("#print input").on("click", function () { PrintRepeater1() })

        function PrintRepeater1() {

            var repeater = document.getElementById('table1');
            if (repeater == null)
                return;

            //var report1 = document.querySelector('.report1');

            var printWindow = window.open('', '', 'height=400,width=800');

            printWindow.document.write('<html dir=rtl><head><style>table{text-align:center} div.item{ float:right;  margin:10px;  }   div.item div{ float:right;  margin-left:5px; }  .goLeft{  float:left !important } .tablesaw-cell-label ,.print,.search{display:none !important} table{width:100%}</style><title>ديون جهات الشراء</title>');

            printWindow.document.write('</head><body >');

            printWindow.document.write(document.querySelector(".all").outerHTML);
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
