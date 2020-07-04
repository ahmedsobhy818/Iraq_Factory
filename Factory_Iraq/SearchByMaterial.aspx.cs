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
    public partial class SearchByMaterial : System.Web.UI.Page
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
                SqlCommand commp = new SqlCommand(" select name from  [material]", conn);

                SqlDataReader reader = commp.ExecuteReader();
                cmbNames.Items.Add("");
                while (reader.Read())
                {
                    string s = reader.GetString(0);
                    cmbNames.Items.Add(s);
                }

                reader.Close();
                reader.Dispose();
                conn.Close();

            }


            


        }

        protected void Unnamed3_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);


            string sql2 = "SELECT ID AS رقم_الوصلة, c_name AS اسم, price AS سعر, qty AS العدد, c_date AS التاريخ, car_no AS[رقم السيارة] FROM Pen_company where[p_id] = '" + txtCode.Text + "' and(CONVERT(DATE, c_date, 102)  BETWEEN '" + date1.Value +  "' and '" + date2.Value + "' and ID <> 0)";
            SqlDataAdapter adap2 = new SqlDataAdapter(sql2, conn);
             DataTable dt2 = new DataTable();
             adap2.Fill(dt2);

            Repeater1.DataSource = dt2;
            Repeater1.DataBind();

            double total = 0;
            foreach (DataRow row in dt2.Rows)
            {
                double x = Convert.ToDouble(row[3].ToString().Replace("$", ""));
                total += x;
            }
            lblTotal.Text = Math.Round(total, 2).ToString() + "$";

        }
    }
}