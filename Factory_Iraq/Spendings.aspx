<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Spendings.aspx.cs" Inherits="Factory_Iraq.Spendings" %>
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

<h1>تقرير عن مصاريف</h1>
    
    <div class="item" >
            <div style="line-height:33px">من التاريخ :</div>
            <div>
                        <input type="date" runat="server" id="date1" value = "2020-01-01"  class="form-control" />
            </div>
        </div>

  <div class="item" style="clear:both" >
            <div style="line-height:33px;">الى التاريخ :</div>
            <div>
                        <input type="date" runat="server" id="date2" value = "2021-01-01" class="form-control" />
            </div>
        </div>

    <div class="item" style="clear:both">
            <div>مجموع المصاريف :</div>
            <div>
                <asp:UpdatePanel runat="server" ID="upTotal">
                    <ContentTemplate>
                        <asp:Label ID="lblTotal" runat="server"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
                
            </div>
        </div>

    <div class="item" style="clear:both">
        <div style="line-height:33px">نوع المصرف : </div>
            <div>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="cmbTypes" runat="server"  Width="264px"   CssClass="form-control">
                </asp:DropDownList>
                </ContentTemplate>
            </asp:UpdatePanel>
                
            </div>
            </div>

    <div class="item" >
                <div id="search">
                    <asp:UpdatePanel runat="server" style="width:100%">
                        <ContentTemplate>
                            <asp:Button  Text="بحـــث"  CssClass="btn btn-success" style="width:100%" runat="server"   ID="search_btn1" OnClick="search_btn1_Click"></asp:Button>
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

    <div class="item" style="clear:both;min-width:150px">
    
    </div>

    <div class="item" style="margin-left:145px">
        <span style="line-height:33px" >تقرير عام</span>
    </div>

    <div class="item" >
                <div id="search2">
                    <asp:UpdatePanel runat="server" style="width:100%">
                        <ContentTemplate>
                            <asp:Button  Text="بحـــث"  CssClass="btn btn-success" style="width:100%" runat="server"   ID="search_btn2" OnClick="search_btn2_Click"></asp:Button>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
    
                    <img src="images/search-outline-filled.png" />
                </div>
            </div>
    
     <div class="item">
                <div id="print2">
                    <input type="button"   class="btn btn-primary"  value="طباعة" />
                    <img src="images/Avosoft-Warm-Toolbar-Print.ico" />
                </div>
        </div>




    <div class="item" style="clear:both;min-width:150px">
    
    </div>

    <div class="item" style="margin-left:45px">
        <span style="line-height:33px" >  تقرير عام حسب نوع المصروف</span>
    </div>

    <div class="item" >
                <div id="search3">
                    <asp:UpdatePanel runat="server" style="width:100%">
                        <ContentTemplate>
                            <asp:Button  Text="بحـــث"  CssClass="btn btn-success" style="width:100%" runat="server" ID="search_btn3" OnClick="search_btn3_Click"   ></asp:Button>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
    
                    <img src="images/search-outline-filled.png" />
                </div>
            </div>
    
     <div class="item">
                <div id="print3">
                    <input type="button"   class="btn btn-primary"  value="طباعة" />
                    <img src="images/Avosoft-Warm-Toolbar-Print.ico" />
                </div>
        </div>

        <div class="item" style="clear:both"></div>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
                
    <div id="report1" runat="server" class="report1">
      
        <div style="text-align:center;font-weight:bold;font-size:30px">نوع تقرير المصروفات</div>

        <div class="item" >
            <div style="line-height:33px">من التاريخ :</div>
            <div style="line-height:33px">
                <%--<asp:UpdatePanel runat="server">
                    <ContentTemplate>--%>
                        <asp:Label runat="server" id="lblDateFrom1" />
                <%--    </ContentTemplate>
                </asp:UpdatePanel>        --%>
                
            </div>
        </div>

        <div class="item goLeft" >
            <div style="line-height:33px">الى التاريخ :</div>
            <div style="line-height:33px">
               <%-- <asp:UpdatePanel runat="server">
                    <ContentTemplate>--%>
                        <asp:Label runat="server" id="lblDateTo1" />
                    <%--</ContentTemplate>
                </asp:UpdatePanel>        --%>
                
            </div>
        </div>
        <div style="clear:both">
        <hr style="font-weight:bold" />
            </div>
        
        <asp:Repeater ID="Repeater1" runat="server">

                  <HeaderTemplate>
        <table id="table1" class="table tabled-bordered table-striped table-hover tablesaw tablesaw-stack"  data-tablesaw-mode="stack">
            <thead>
            <tr>
                <th style="width: 20%" >
                    رقم الفاتورة
                </th>
                <th style="width: 20%">
                    التاريخ
                </th>
                <th style="width: 20%">
                    نوع المصرف
                </th>
                <th style="width: 20%">
                    ملاحظة
                </th>
                <th style="width: 20%">
                    المبلغ
                </th>
                
            </tr>
                </thead>
            <tbody>
    </HeaderTemplate>

     <ItemTemplate>
            <tr>
                <td style="width: 20%" >
                     <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("رقم_القائمة") %>' />
                </td>
                <td style="width: 20%">
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("تاريخ", "{0:yyyy-MM-dd}") %>' />
                </td>
                <td style="width: 20%">
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("type") %>' />
                </td>
                <td style="width: 20%">
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("ملاحظة") %>' />
                </td>
                <td style="width: 20%">
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("المبلغ" ) %>' />
                </td>
                

            </tr>
        </ItemTemplate>
     <FooterTemplate>
         </tbody>
        </table>
    </FooterTemplate>



                  </asp:Repeater>
        
                        <asp:Label ID="lblTotal1" runat="server" CssClass="goLeft"></asp:Label>    
        

        
        
    </div>
                </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel runat="server"  >
        <ContentTemplate>
    
    <div id="report2" class="report2" runat="server">
      
        <div style="text-align:center;font-weight:bold;font-size:30px">نوع تقرير المصروفات</div>

        <div class="item" >
            <div style="line-height:33px">من التاريخ :</div>
            <div style="line-height:33px">
                <%--<asp:UpdatePanel runat="server">
                    <ContentTemplate>--%>
                        <asp:Label runat="server" id="lblDateFrom2" />
                <%--    </ContentTemplate>
                </asp:UpdatePanel>        --%>
                
            </div>
        </div>

        <div class="item goLeft" >
            <div style="line-height:33px">الى التاريخ :</div>
            <div style="line-height:33px">
               <%-- <asp:UpdatePanel runat="server">
                    <ContentTemplate>--%>
                        <asp:Label runat="server" id="lblDateTo2" />
                    <%--</ContentTemplate>
                </asp:UpdatePanel>        --%>
                
            </div>
        </div>
        <div style="clear:both">
        <hr style="font-weight:bold" />
            </div>
        
        <asp:Repeater ID="Repeater2" runat="server">

                  <HeaderTemplate>
        <table id="table2" class="table tabled-bordered table-striped table-hover tablesaw tablesaw-stack"  data-tablesaw-mode="stack">
            <thead>
            <tr>
                <th style="width: 20%" >
                    رقم الفاتورة
                </th>
                <th style="width: 20%">
                    التاريخ
                </th>
                <th style="width: 20%">
                    نوع المصرف
                </th>
                <th style="width: 20%">
                    ملاحظة
                </th>
                <th style="width: 20%">
                    المبلغ
                </th>
                
            </tr>
                </thead>
            <tbody>
    </HeaderTemplate>

     <ItemTemplate>
            <tr>
                <td style="width: 20%" >
                     <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("رقم_القائمة") %>' />
                </td>
                <td style="width: 20%">
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("تاريخ", "{0:yyyy-MM-dd}") %>' />
                </td>
                <td style="width: 20%">
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("type") %>' />
                </td>
                <td style="width: 20%">
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("ملاحظة") %>' />
                </td>
                <td style="width: 20%">
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("المبلغ" ) %>' />
                </td>
                

            </tr>
        </ItemTemplate>
     <FooterTemplate>
         </tbody>
        </table>
    </FooterTemplate>



                  </asp:Repeater>
        
                        <asp:Label ID="lblTotal2" runat="server" CssClass="goLeft"></asp:Label>    
      
    </div>
    </ContentTemplate>
        </asp:UpdatePanel>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
    
            <div id="report3" class="report3" runat="server">


        <div style="text-align:center;font-weight:bold;font-size:30px">نوع تقرير المصروفات</div>

        <div class="item" >
            <div style="line-height:33px">من التاريخ :</div>
            <div style="line-height:33px">
                <%--<asp:UpdatePanel runat="server">
                    <ContentTemplate>--%>
                        <asp:Label runat="server" id="lblDateFrom3" />
                <%--    </ContentTemplate>
                </asp:UpdatePanel>        --%>
                
            </div>
        </div>

        <div class="item goLeft" >
            <div style="line-height:33px">الى التاريخ :</div>
            <div style="line-height:33px">
               <%-- <asp:UpdatePanel runat="server">
                    <ContentTemplate>--%>
                        <asp:Label runat="server" id="lblDateTo3" />
                    <%--</ContentTemplate>
                </asp:UpdatePanel>        --%>
                
            </div>
        </div>
        <div style="clear:both">
        <hr style="font-weight:bold" />
            </div>
        
        <asp:Repeater ID="Repeater3" runat="server">

                  <HeaderTemplate>
        <table id="table3" class="table tabled-bordered table-striped table-hover tablesaw tablesaw-stack"  data-tablesaw-mode="stack">
            <thead>
            <tr>
                <th style="width: 20%" >
                    نوع المصرف
                </th>
                <th style="width: 20%">
                    المبلغ
                </th>
                
            </tr>
                </thead>
            <tbody>
    </HeaderTemplate>

     <ItemTemplate>
            <tr>
                <td style="width: 20%" >
                     <asp:Label ID="lbl" runat="server" Text='<%# Eval("type") %>' />
                </td>
                <td style="width: 20%">
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("المبلغ") %>' />
                </td>
                
            </tr>
        </ItemTemplate>
     <FooterTemplate>
         </tbody>
        </table>
    </FooterTemplate>



                  </asp:Repeater>
        
                        <asp:Label ID="lblTotal3" runat="server" CssClass="goLeft"></asp:Label>    
      
    </div>
            </ContentTemplate>
        </asp:UpdatePanel>

    <script>
        $('.report1').hide();
        $('.report2').hide();
        $('.report3').hide();
       // document.querySelector('.report2').innerHTML = "";
       // document.querySelector('.report3').innerHTML = "";


        $("#print input").on("click", function () { PrintRepeater1() })
        $("#print2 input").on("click", function () { PrintRepeater2() })
        $("#print3 input").on("click", function () { PrintRepeater3() })


        function PrintRepeater1() {
            
            var repeater = document.getElementById('table1');
            if (repeater == null)
                return;

            var report1 = document.querySelector('.report1');

            var printWindow = window.open('', '', 'height=400,width=800');

            printWindow.document.write('<html dir=rtl><head><style>table{text-align:center} div.item{ float:right;  margin:10px;  }   div.item div{ float:right;  margin-left:5px; }  .goLeft{  float:left !important }</style><title>نوع تقرير المصروفات</title>');

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


        function PrintRepeater2() {

            var repeater = document.getElementById('table2');
            if (repeater == null)
                return;

            var report2 = document.querySelector('.report2');

            var printWindow = window.open('', '', 'height=400,width=800');

            printWindow.document.write('<html dir=rtl><head><style>table{text-align:center} div.item{ float:right;  margin:10px;  }   div.item div{ float:right;  margin-left:5px; }  .goLeft{  float:left !important }</style><title>نوع تقرير المصروفات</title>');

            printWindow.document.write('</head><body >');

            printWindow.document.write(report2.outerHTML);
            printWindow.document.write('</body></html>');

            //printWindow.document.close();
            printWindow.print();
            setTimeout(function () {


                printWindow.document.close();

            }, 500);

            return false;

        }


        function PrintRepeater3() {

            var repeater = document.getElementById('table3');
            if (repeater == null)
                return;

            var report3 = document.querySelector('.report3');

            var printWindow = window.open('', '', 'height=400,width=800');

            printWindow.document.write('<html dir=rtl><head><style>table{text-align:center} div.item{ float:right;  margin:10px;  }   div.item div{ float:right;  margin-left:5px; }  .goLeft{  float:left !important }</style><title>نوع تقرير المصروفات</title>');

            printWindow.document.write('</head><body >');

            printWindow.document.write(report3.outerHTML);
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
