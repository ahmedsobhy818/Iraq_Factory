using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Factory_Iraq
{
    public partial class FrmTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
            return;
            SqlConnection nn = new SqlConnection(@"Data Source=mi3-wsq3.a2hosting.com ;Initial Catalog= barovcas_florzaxo;User ID='barovcas_florzaxo';Password='hello12H';MultipleActiveResultSets=true");
            nn.Open();

            SqlCommand commp = new SqlCommand("select * from  [cat]", nn);

            SqlDataReader reade = commp.ExecuteReader();

            while (reade.Read())
            {

                int id = reade.GetInt32(0);
                string s2 = reade.GetString(1);
                //string s3 = reade.GetString(2);
            }

            reade.Close();
            reade.Dispose();
            nn.Close();

            //1306
            string sql = "SELECT material.code AS كود, material.name AS اسم, FORMAT(SUM((Pen_company.price + Pen_company.mesarif) * Pen_company.qty) / SUM(Pen_company.qty), 'C', 'en-us') AS سعر, SUM(Pen_company.qty - Pen_company.frotin) AS كمية, FORMAT(SUM((Pen_company.price + Pen_company.mesarif) * Pen_company.qty) / SUM(Pen_company.qty) * SUM(Pen_company.qty - Pen_company.frotin), 'C', 'en-us') AS مجموع, material.measure AS وحدة, material.width AS تعبئة, material.wezin AS وزن, material.mark AS ماركة, material.cat AS صنف, material.limit AS[حد الادنى]FROM Pen_company INNER JOIN material ON Pen_company.p_id = material.code WHERE(Pen_company.count - Pen_company.frotin > 0) AND(material.code <> '#') and material.cat =N'مواد كيمياوية' GROUP BY material.code, material.name, material.qty, material.measure, material.wezin, material.cat, material.mark, material.width, material.limit ORDER BY كود ";
            //string sql = "SELECT material.code AS كود, material.name AS اسم, FORMAT(SUM((Pen_company.price + Pen_company.mesarif) * Pen_company.qty) / SUM(Pen_company.qty), 'C', 'en-us') AS سعر, SUM(Pen_company.qty - Pen_company.frotin) AS كمية, FORMAT(SUM((Pen_company.price + Pen_company.mesarif) * Pen_company.qty) / SUM(Pen_company.qty) * SUM(Pen_company.qty - Pen_company.frotin), 'C', 'en-us') AS مجموع, material.measure AS وحدة, material.width AS تعبئة, material.wezin AS وزن, material.mark AS ماركة, material.cat AS صنف, material.limit AS[حد الادنى]FROM Pen_company INNER JOIN material ON Pen_company.p_id = material.code WHERE(Pen_company.count - Pen_company.frotin > 0) AND(material.code <> '#')  GROUP BY material.code, material.name, material.qty, material.measure, material.wezin, material.cat, material.mark, material.width, material.limit ORDER BY كود ";

            SqlDataAdapter adap = new SqlDataAdapter(sql, nn);
            DataTable dt = new DataTable();
            adap.Fill(dt);
        }
    }
}