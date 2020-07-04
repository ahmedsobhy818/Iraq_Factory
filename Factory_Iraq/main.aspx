<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="Factory_Iraq.main" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    div.alert{
        height:100px;
        line-height:65px

    }
        div.alert a{
            height:100%;
            width:100%;
            display:block;
            text-decoration:none;
            color:inherit
        }
    </style>
    <div class="alert alert-success col-md-4 col-xs-12" role="alert"  style="text-align:right;cursor:pointer;margin:25px"  ><a href="InventoryByMaterialCat.aspx">	جرد المخزن حسب اصناف</a></div>
    <div class="alert alert-success col-md-4 col-xs-12" role="alert"  style="text-align:right;cursor:pointer;margin:25px"  ><a href="InventoryByMaterialMark.aspx">	جرد المخزن حسب الماركات</a></div>
    <div class="alert alert-success col-md-4 col-xs-12" role="alert"  style="text-align:right;cursor:pointer;margin:25px"  ><a href="SearchByMaterial.aspx">	بحث حسب المادة</a></div>
    <div class="alert alert-success col-md-4 col-xs-12" role="alert"  style="text-align:right;cursor:pointer;margin:25px"  ><a href="InventoryGeneral.aspx">جرد المخزن عام</a></div>
    <div class="alert alert-success col-md-4 col-xs-12" role="alert"  style="text-align:right;cursor:pointer;margin:25px"  ><a href="Spendings.aspx">تقرير عن مصاريف - نوع المصرف</a></div>
    <div class="alert alert-success col-md-4 col-xs-12" role="alert"  style="text-align:right;cursor:pointer;margin:25px"  ><a href="Spendings.aspx">تقرير عن مصاريف - تقرير عام</a></div>
    <div class="alert alert-success col-md-4 col-xs-12" role="alert"  style="text-align:right;cursor:pointer;margin:25px"  ><a href="Spendings.aspx">تقرير عن مصاريف - تقرير عام حسب نوع المصروف</a></div>
    <div class="alert alert-success col-md-4 col-xs-12" role="alert"  style="text-align:right;cursor:pointer;margin:25px"  ><a href="CustomerDebit.aspx">ديون الزبائن</a></div>
    <div class="alert alert-success col-md-4 col-xs-12" role="alert"  style="text-align:right;cursor:pointer;margin:25px"  ><a href="AccountStatement.aspx">كشف الحساب</a></div>
    <div class="alert alert-success col-md-4 col-xs-12" role="alert"  style="text-align:right;cursor:pointer;margin:25px"  ><a href="SalesByMaterial.aspx">مبيعات حسب المادة</a></div>
    <div class="alert alert-success col-md-4 col-xs-12" role="alert"  style="text-align:right;cursor:pointer;margin:25px"  ><a href="SalesByGroup.aspx">مبيعات حسب المجموعة</a></div>
    <div class="alert alert-success col-md-4 col-xs-12" role="alert"  style="text-align:right;cursor:pointer;margin:25px"  ><a href="SalesByBuyer.aspx" >مبيعات حسب المشترى</a></div>
    <div class="alert alert-success col-md-4 col-xs-12" role="alert"  style="text-align:right;cursor:pointer;margin:25px"  ><a href="GeneralStore.aspx" >انتاج - مخزن عام</a></div>
    <div class="alert alert-success col-md-4 col-xs-12" role="alert"  style="text-align:right;cursor:pointer;margin:25px"  ><a href="ProductionMaterials.aspx" >انتاج - كشف المواد</a></div>
    <div class="alert alert-success col-md-4 col-xs-12" role="alert"  style="text-align:right;cursor:pointer;margin:25px"  ><a href="ProductionMaterialsSold.aspx">انتاج - كشف المواد المباعة</a></div>
    <div class="alert alert-success col-md-4 col-xs-12" role="alert"  style="text-align:right;cursor:pointer;margin:25px"  ><a href="DailyReport.aspx">التقرير اليومى </a></div>
    <div class="alert alert-success col-md-4 col-xs-12" role="alert"  style="text-align:right;cursor:pointer;margin:25px"  ><a href="BuyingDept.aspx">تقرير ديون جهات الشراء</a></div>
    <div class="alert alert-success col-md-4 col-xs-12" role="alert"  style="text-align:right;cursor:pointer;margin:25px"  ><a href="MaterialsGain2Dates.aspx">تقرير ربح المواد بين تاريخين</a></div>
    

    </div>
</asp:Content>
