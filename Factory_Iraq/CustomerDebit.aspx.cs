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
    public partial class CustomerDebit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Session["redirect"] = Request.Path;
                Response.Redirect("login.aspx");
            }

            dateSpan.InnerText = DateTime.Today.ToString("dd-MM-yyyy");
            string connStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);


            string sql = "select c_name, (select COALESCE(sum([count] * price * unit), 0)from bels where name_p = c_name)+ (SELECT  COALESCE(SUM(money), 0) AS Expr1 FROM earnn WHERE(name = c_name)AND type =N'ديون سابقة' ) - (SELECT       COALESCE(SUM(money), 0) AS Expr1 FROM earnn WHERE(name = c_name)AND(type =N'مستند قبض' or type =N'سماح') ) + (select   COALESCE(SUM(disc_do), 0) from discount WHERE    ([cost_name] = c_name)) from custumer";

            



            SqlDataAdapter adap = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            adap.Fill(dt);

            
           
            double total = 0;
            foreach (DataRow row in dt.Rows)
            {
                double x = Convert.ToDouble(row[1].ToString().Replace("$", ""));
                total += x;
            }

            dt.Columns.Add("دائن");
            foreach (DataRow row in dt.Rows)
            {
                if (Convert.ToDouble(row[1].ToString()) >= 0)
                {
                    row[2] = 0;
                }
                else
                {
                    row[2] = Convert.ToDouble(row[1].ToString()) * -1;
                    row[1] = 0;
                }
            }

            Repeater1.DataSource = dt;
            Repeater1.DataBind();

            lblTotal1.Text = Math.Round(total, 2).ToString() + "$";
            

        }
    }
}