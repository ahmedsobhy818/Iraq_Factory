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
    public partial class MaterialsGain2Dates : System.Web.UI.Page
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
            string sql = " SELECT  SUM([price] *[count]) AS Expr1, SUM( [count]*([carton])) AS Ribi,   SUM([carton] *[count]) AS Expr1 FROM bels AS bels  where CONVERT(DATE , [date], 102)  between '" + date1.Value  + "'  and '" + date2.Value  + "' and id_code<>'#'  ";

            string connStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);

            SqlDataAdapter adap = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            adap.Fill(dt);

            double bells = 0;
            double bells_ribih = 0;

            foreach (DataRow row in dt.Rows)
            {
               if(row[0].ToString().Trim()!="")
                    bells = bells + Convert.ToDouble(row[0].ToString());

                if (row[1].ToString().Trim() != "")
                    bells_ribih = bells_ribih + Convert.ToDouble(row[1]);
            }

            lblTotal.Text = bells.ToString("0.00").Replace(".00", "");
            lblGain.Text = bells_ribih.ToString("0.00").Replace(".00", "");
        }
    }
}