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
    public partial class GeneralStore : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Session["redirect"] = Request.Path;
                Response.Redirect("login.aspx");
            }

            string sql = "select [produce_material].id as كود,[produce_material].name اسم ,	 (SELECT sum(   Pen_company3.count - Pen_company3.frotin )  FROM            Pen_company3  where p_id =[produce_material].id and Pen_company3.qty - Pen_company3.frotin > 0)  كمية   from[produce_material]  ";




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