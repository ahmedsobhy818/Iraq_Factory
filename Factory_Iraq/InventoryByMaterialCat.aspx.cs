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
    public partial class InventoryByMaterialCat : System.Web.UI.Page
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
                SqlCommand commp = new SqlCommand("select col from  [cat]", conn);

                SqlDataReader reader = commp.ExecuteReader();
                cmbMaterialCat.Items.Add("");
                while (reader.Read())
                {
                 string s = reader.GetString(0);
                    cmbMaterialCat.Items.Add(s);
                }

                reader.Close();
                reader.Dispose();
                conn.Close();

            }

        }

        protected void cmbMaterialCat_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sql = "SELECT material.code AS كود, material.name AS اسم, FORMAT(SUM((Pen_company.price + Pen_company.mesarif) * Pen_company.qty) / SUM(Pen_company.qty), 'C', 'en-us') AS سعر, SUM(Pen_company.qty - Pen_company.frotin) AS كمية, FORMAT(SUM((Pen_company.price + Pen_company.mesarif) * Pen_company.qty) / SUM(Pen_company.qty) * SUM(Pen_company.qty - Pen_company.frotin), 'C', 'en-us') AS مجموع, material.measure AS وحدة, material.width AS تعبئة, material.wezin AS وزن, material.mark AS ماركة, material.cat AS صنف, material.limit AS[حد الادنى]FROM Pen_company INNER JOIN material ON Pen_company.p_id = material.code WHERE(Pen_company.count - Pen_company.frotin > 0) AND(material.code <> '#') and material.cat =N'" + cmbMaterialCat.SelectedValue + "' GROUP BY material.code, material.name, material.qty, material.measure, material.wezin, material.cat, material.mark, material.width, material.limit ORDER BY كود ";
            //string sql = "SELECT material.code AS كود, material.name AS اسم, FORMAT(SUM((Pen_company.price + Pen_company.mesarif) * Pen_company.qty) / SUM(Pen_company.qty), 'C', 'en-us') AS سعر, SUM(Pen_company.qty - Pen_company.frotin) AS كمية, FORMAT(SUM((Pen_company.price + Pen_company.mesarif) * Pen_company.qty) / SUM(Pen_company.qty) * SUM(Pen_company.qty - Pen_company.frotin), 'C', 'en-us') AS مجموع, material.measure AS وحدة, material.width AS تعبئة, material.wezin AS وزن, material.mark AS ماركة, material.cat AS صنف, material.limit AS[حد الادنى]FROM Pen_company INNER JOIN material ON Pen_company.p_id = material.code WHERE(Pen_company.count - Pen_company.frotin > 0) AND(material.code <> '#')  GROUP BY material.code, material.name, material.qty, material.measure, material.wezin, material.cat, material.mark, material.width, material.limit ORDER BY كود ";

            string connStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);

            SqlDataAdapter adap = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            adap.Fill(dt);

            Repeater1.DataSource = dt;
            Repeater1.DataBind();

            double total = 0;
            foreach(DataRow row in dt.Rows)
            {
                double x = Convert.ToDouble(row[4].ToString().Replace("$", ""));
                total += x;
            }
            lblTotal.Text = Math.Round(total, 2).ToString() + "$";
            //upTotal.Update();
        }
    }
}