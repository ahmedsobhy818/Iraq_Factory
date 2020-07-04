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
    public partial class ProductionMaterialsSold : System.Web.UI.Page
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
            string sql = " SELECT[produce_material].name,  FORMAT(bels.price, 'N', 'en-us')     ,COALESCE(bels.count, 0),  FORMAT(COALESCE((bels.price * bels.count), 0), 'N', 'en-us')  , bels.date, bels.name_p, bels.id,bels.id_code,COALESCE(bels.weight, 0),COALESCE((bels.price * bels.weight), 0),bels.mwad_id ,bels.username,bels.useradress,COALESCE(bels.bels_type, ''),bels.user_ID,COALESCE(bels.single_price, 0),bels.note ,'0',   '0' ,'0',  [produce_material].[dept],bels.note1,bels.[carton],bels.[mwad_id],bels.[driver_name],bels.[driver_address],bels.sike,COALESCE((bels.price* bels.count),0),driver_phone,bels.name_p FROM  bels INNER JOIN  [produce_material] ON bels.id_code = [produce_material].id WHERE(produce_material.[name]  = N'" + cmbMaterials.SelectedValue  + "') and(bels.weight!=0 or bels.count !=0 )";


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