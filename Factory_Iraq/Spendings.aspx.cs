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
    public partial class Spendings : System.Web.UI.Page
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

                string connStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                conn.Open();
                SqlCommand commp = new SqlCommand(" select [col] from [masaref_type]", conn);

                SqlDataReader reader = commp.ExecuteReader();
                cmbTypes.Items.Add("");
                while (reader.Read())
                {
                    string s = reader.GetString(0);
                    cmbTypes.Items.Add(s);
                }

                reader.Close();
                reader.Dispose();
                conn.Close();

            }


        }

        protected void search_btn1_Click(object sender, EventArgs e)
        {
            
            string connStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);

            string sql = "select no رقم_القائمة ,   CONVERT(DATE , date, 102) تاريخ ,type, work ملاحظة ,FORMAT([money], 'C', 'en-us')   المبلغ ,FORMAT([money], 'N', 'en-us')         from  [e_work]  where(CONVERT(DATE , date, 102)   between '" + date1.Value + "'  and '" + date2.Value + "') and type =N'" + cmbTypes.SelectedValue + "'";
            


            SqlDataAdapter adap = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            adap.Fill(dt);

            Repeater1.DataSource = dt;
            Repeater1.DataBind();

            double total = 0;
            foreach (DataRow row in dt.Rows)
            {
                double x = Convert.ToDouble(row[4].ToString().Replace("$", ""));
                total += x;
            }
            lblTotal1.Text = Math.Round(total, 2).ToString() + "$";
            lblDateFrom1.Text = date1.Value;
            lblDateTo1.Text = date2.Value;

            report1.Visible = true;
            report2.Visible = false;
            report3.Visible = false;
        }

        protected void search_btn2_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);

            //string sql = "select no رقم_القائمة ,   CONVERT(DATE , date, 102) تاريخ ,type, work ملاحظة ,FORMAT([money], 'C', 'en-us')   المبلغ ,FORMAT([money], 'N', 'en-us')         from  [e_work]  where(CONVERT(DATE , date, 102)   between '" + date1.Value + "'  and '" + date2.Value + "') and type =N'" + cmbTypes.SelectedValue + "'";


            string sql = "select no رقم_القائمة ,   CONVERT(DATE , date, 102) تاريخ ,type , work ملاحظة ,FORMAT([money], 'C', 'en-us')   المبلغ ,FORMAT([money], 'N', 'en-us')         from  [e_work] where(CONVERT(DATE , date, 102)   between '" + date1.Value + "'  and '" + date2.Value + "')  ";
             


            SqlDataAdapter adap = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            adap.Fill(dt);

            Repeater2.DataSource = dt;
            Repeater2.DataBind();

            double total = 0;
            foreach (DataRow row in dt.Rows)
            {
                double x = Convert.ToDouble(row[4].ToString().Replace("$", ""));
                total += x;
            }
            lblTotal2.Text = Math.Round(total, 2).ToString() + "$";
            lblDateFrom2.Text = date1.Value;
            lblDateTo2.Text = date2.Value;

            report1.Visible = false;
            report2.Visible = true;
            report3.Visible = false;
        }

        protected void search_btn3_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);

            //string sql = "select no رقم_القائمة ,   CONVERT(DATE , date, 102) تاريخ ,type, work ملاحظة ,FORMAT([money], 'C', 'en-us')   المبلغ ,FORMAT([money], 'N', 'en-us')         from  [e_work]  where(CONVERT(DATE , date, 102)   between '" + date1.Value + "'  and '" + date2.Value + "') and type =N'" + cmbTypes.SelectedValue + "'";

            
            string sql = "SELECT  type ,  FORMAT(sum(money), 'C', 'en-us') AS المبلغ  , FORMAT(sum(money), 'N', 'en-us') AS المبلغ1 FROM   e_work where( [date] between '" + date1.Value + "'  and '" + date2.Value + "') GROUP BY type";
            


            SqlDataAdapter adap = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            adap.Fill(dt);

            Repeater3.DataSource = dt;
            Repeater3.DataBind();

            double total = 0;
            foreach (DataRow row in dt.Rows)
            {
                double x = Convert.ToDouble(row[1].ToString().Replace("$", ""));
                total += x;
            }
            lblTotal3.Text = Math.Round(total, 2).ToString() + "$";
            lblDateFrom3.Text = date1.Value;
            lblDateTo3.Text = date2.Value;

            report1.Visible = false;
            report2.Visible = false;
            report3.Visible = true;
        }
    }
}