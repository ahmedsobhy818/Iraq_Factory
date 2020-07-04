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
    public partial class ProductionMaterials : System.Web.UI.Page
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
                SqlCommand commp = new SqlCommand("SELECT name FROM[produce_material]", conn);

                SqlDataReader reader = commp.ExecuteReader();
                cmbMaterials.Items.Add("");
                while (reader.Read())
                {
                    string s = reader.GetString(0);
                    cmbMaterials.Items.Add(s);
                }

                reader.Close();
                reader.Dispose();
                conn.Close();
            }
        }

        protected void cmbMaterials_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sql = "SELECT Pen_company3.c_name, Pen_company3.c_date, Pen_company3. [price] +Pen_company3.mesarif AS Expr1, Pen_company3.count  AS Expr1, Pen_company3.note, Pen_company3.auto_code,'0',[produce_material].id,Pen_company3.frotin, ( Pen_company3.[date_p]), ( Pen_company3.[date_e]),Pen_company3.[auto_code] FROM Pen_company3 INNER JOIN  [produce_material] ON Pen_company3.p_id = [produce_material].id  where[produce_material].name = N'" + cmbMaterials.SelectedValue  + "' order by Pen_company3.date_e DESC  ";

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