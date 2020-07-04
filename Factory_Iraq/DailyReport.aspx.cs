using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Factory_Iraq
{
    public partial class DailyReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] == null)
                {
                    Session["redirect"] = Request.Path;
                    Response.Redirect("login.aspx");
                }

                date1.Value = DateTime.Today.ToString("yyyy-MM-dd");
                date2.Value = DateTime.Today.ToString("yyyy-MM-dd");
            }
        }

        protected void search_btn1_Click(object sender, EventArgs e)
        {
            string sql = "SELECT  'صندوق', [comp] ,[money],[da],[note],[type] FROm[qas_incomee]  where[type] = 'دخول' and(CONVERT(date, da, 102)   between '" + date1.Value  + "' and  '" + date2.Value  + "') union all    SELECT    'صندوق', [comp] ,[money] ,[da] ,[note] ,[type] FROm[qas_incomee]  where[type] = 'سحب'  and(CONVERT (date, da,102)   between '" + date1.Value + "' and '" + date2.Value  + "')   union all SELECT    'مصاريف',''  ,[money] ,[date] ,[work] ,[type] FROM[e_work]  where(CONVERT (date,  [date],102)   between '" + date1.Value + "' and '" + date2.Value  + "')  union all  SELECT  'حوالات', [comp] ,[money] ,[da] ,[note]  ,''  FROm[transfer]  where(CONVERT (date, da,102)   between '" + date1.Value + "' and '" + date2.Value  + "') union all SELECT  'حوالات', [comp] ,[money] ,[da] ,[note]  ,''  FROm[transfer3] where(CONVERT (date, da,102)   between '" + date1.Value + "' and '" + date2.Value  + "')  union all  SELECT  'مكتب خوالات', [comp],[money] ,[da],[note]   ,'' FROM hawalat union all  SELECT   'مستند قبض' ,[name] ,[money] ,[date]      ,[note]  ,'' FROM[earnn] where type='مستند قبض'  and(CONVERT (date, date,102)   between '" + date1.Value + "' and '" + date2.Value  + "') union all SELECT   'ديون سابقة'  ,[name],[money] ,[date] ,[note] ,''  FROM[earnn] where type!='مستند قبض'  and(CONVERT (date, [date],102)   between '" + date1.Value + "' and '" + date2.Value  + "') union all  SELECT   'ديون سابقة'       ,[name] ,[money]  ,[date]  ,[note]  ,''  FROM[earnn] where type!='مستند قبض' and(CONVERT (date, [date],102)   between '" + date1.Value + "' and '" + date2.Value  + "') union all SELECT  'فواتير البيع', [name_p],sum([price] *[count]) as moeny,	 [date],convert(varchar(50), id)+':رقم الفاتورة ',''  from[bels] where(CONVERT ([date], bels.date,102)   between '" + date1.Value + "' and '" + date2.Value  + "') GROUP BY   id,bels.name_p,[date]  union all   SELECT DISTINCT   'خصم فاتورة البيع',   bels.name_p,   discount.disc_do,   bels.date ,    '',''  FROM discount INNER JOIN  bels ON discount.bell_id = bels.id WHERE(discount.n = 1)   And discount.disc_do<>0  and (CONVERT (date, bels.date,102)   between '" + date1.Value + "' and '" + date2.Value  + "')";

            string connStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);

            SqlDataAdapter adap = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            adap.Fill(dt);

            Repeater1.DataSource = dt;
            Repeater1.DataBind();


        }
    }
}