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
    public partial class SalesByGroup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["user"] == null)
                {
                    Session["redirect"] = Request.Path;
                    Response.Redirect("login.aspx");
                }

                string connStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                conn.Open();
                SqlCommand commp = new SqlCommand( "SELECT DISTINCT[mark]  FROM[produce_material]", conn);

                SqlDataReader reader = commp.ExecuteReader();
                cmbGroups.Items.Add("");
                while (reader.Read())
                {
                    string s = reader.GetString(0);
                    cmbGroups.Items.Add(s);
                }

                reader.Close();
                reader.Dispose();
                conn.Close();
            }
        }

        protected void search_btn1_Click(object sender, EventArgs e)
        {
            string sql = "SELECT bels.id_code, produce_material.name,   SUM(bels.price * bels.count) / SUM(bels.count)   AS Expr1, SUM(bels.count) AS Expr2, ( SUM(bels.price * bels.count))  AS Expr3, [produce_material].mark, produce_material.dept FROM  produce_material INNER JOIN bels ON produce_material.id = bels.id_code  where bels.id_code != '#' and[produce_material].mark =N'" + cmbGroups.SelectedValue  + "' and CONVERT(DATE , bels.date , 102)   between '" + date1.Value  + "' and '" + date2.Value  + "' GROUP BY bels.id_code, produce_material.name,[produce_material].mark,[produce_material].dept  ";



            string connStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);

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
            lblTotal.Text = Math.Round(total, 2).ToString() + "$";


        }

       
    }
}