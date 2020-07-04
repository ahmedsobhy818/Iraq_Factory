<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MaterialsGain2Dates.aspx.cs" Inherits="Factory_Iraq.MaterialsGain2Dates" %>
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
<h1>ربح المواد بين تاريخين</h1>
    <div class="item" >
            <div style="line-height:33px" > من التاريخ :</div>
            <div>
                        
                <input type="date" runat="server" class="form-control" id="date1"/>
            </div>
        </div>

        <div class="item" >
            <div style="line-height:33px" > الى  التاريخ  :</div>
            <div>
                        
                <input type="date" runat="server" class="form-control" id="date2"/>
            </div>
        </div>

        <div class="item search" style="clear:both;margin-right:58px" >
                <div id="search" >
                    <asp:UpdatePanel runat="server" style="width:100%">
                        <ContentTemplate>
                            <asp:Button  Text="بحـــث"  CssClass="btn btn-success" style="width:100%" runat="server"   ID="search_btn1" OnClick="search_btn1_Click"  ></asp:Button>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
    
                    <img src="images/search-outline-filled.png" />
                </div>
            </div>

    
<div class="item">
                <div id="print" class="print">
                    <input type="button"   class="btn btn-primary"  value="طباعة" />
                    <img src="images/Avosoft-Warm-Toolbar-Print.ico" />
                </div>
        </div>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>

        
    <div class="item" style="clear:both;font-weight:bold;min-width:200px" >
            <div  > مجموع فواتير البيع : </div>
    </div>

    <div class="item"  >
          <asp:Label ID="lblTotal" runat="server" Text="0" ></asp:Label>
    </div>

    <div class="item" style="clear:both;font-weight:bold;min-width:200px" >
            <div  >الربح : </div>
    </div>

    <div class="item"  >
          <asp:Label ID="lblGain" runat="server" Text="0" ></asp:Label>
    </div>
            </ContentTemplate>
    </asp:UpdatePanel>

    </div>
    <script>
        $("#print input").on("click", function () { PrintRepeater1() })

        function PrintRepeater1() {

            
            var printWindow = window.open('', '', 'height=400,width=800');

            printWindow.document.write('<html dir=rtl><head><style>table{text-align:center} div.item{ float:right;  margin:10px;  }   div.item div{ float:right;  margin-left:5px; }  .goLeft{  float:left !important } .tablesaw-cell-label ,.print,.search{display:none !important} table{width:100%}</style><title>ربح المواد بين تاريخين</title>');

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
