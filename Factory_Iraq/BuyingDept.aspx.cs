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
    public partial class BuyingDept : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Session["redirect"] = Request.Path;
                Response.Redirect("login.aspx");
            }

            string sql = "SELECT c_name اسم ,(SELECT  COALESCE(sum(  [total_discount] +[mesarif] +  [motefriqe]), 0)  FROM[company_hesab] where[comp_na] = c_name and[checked] = 1)+(SELECT  COALESCE(sum([money]),0)  FROM[reciever] where[comp] = c_name)-(SELECT   COALESCE(sum([money]),0)  FROM[transfer] where[comp] = c_name) الباقي from company";

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