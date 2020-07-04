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
    public partial class AccountStatement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);


            string sql = "SELECT  'فواتير البيع',[name_p],sum([price] * [count]) as moeny,	 [date],convert(varchar(50), id)+':رقم الفاتورة ','' from[bels] where name_p=N'دليفيا 2' and(CONVERT (date, bels.date,102)   between '2020-06-01' and '2020-06-29') GROUP BY   id,bels.name_p,[date] union all  SELECT   'مستند قبض' ,[name] ,[money] ,[date] ,[note]  ,'' FROM[earnn] where type='مستند قبض'   and name = N'دليفيا 2' and(CONVERT (date, date,102)   between '2020-06-01' and '2020-06-29') union all  SELECT   'ديون سابقة'      ,[name]  ,[money] ,[date]  ,[note]  ,'' FROM[earnn] where type!='مستند قبض' and name = N'دليفيا 2' and(CONVERT (date, date,102)   between '2020-06-01' and '2020-06-29') union all SELECT DISTINCT  'خصم فاتورة البيع',   bels.name_p,   discount.disc_do, bels.date ,convert(varchar(50), id)+':رقم الفاتورة ','' FROM discount INNER JOIN  bels ON discount.bell_id = bels.id  WHERE(discount.n = 1)  and bels.name_p=N'دليفيا 2' And discount.disc_do<>0  and (CONVERT (date, bels.date,102)   between '2020-06-01' and '2020-06-29') ";
                
                SqlDataAdapter adap = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            adap.Fill(dt);
        }
    }
}