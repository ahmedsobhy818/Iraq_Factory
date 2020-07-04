using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Factory_Iraq
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] != null)
                {
                    Response.Redirect("main.aspx");
                }

                string connStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                conn.Open();
                SqlCommand commp = new SqlCommand("select name from  [user]", conn);

                SqlDataReader reader = commp.ExecuteReader();
                cmbUsers.Items.Add("اسم المســــتخدم");
                while (reader.Read())
                {
                    string s = reader.GetString(0);
                    cmbUsers.Items.Add(s);
                }
                cmbUsers.Text = "اسم المســــتخدم";
                reader.Close();
                reader.Dispose();
                conn.Close();

            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
 
            if (cmbUsers.SelectedIndex <= 0)
            {
                lblError.Text = "Select User";
                return;
            }

            if (txtPass .Text != "" && txtPass.Text != null)
            {
                conn.Open();
                SqlCommand ss = new SqlCommand(@"select pas from [user] where name='" + cmbUsers.SelectedValue  + "'", conn);
                string ff = Convert.ToString(ss.ExecuteScalar());
                conn.Close();
                if (ff == txtPass.Text)
                {
                    {
                        Session["user"] = cmbUsers.SelectedValue;
                        conn.Open();
                        SqlCommand ssf = new SqlCommand(@"select per from [user] where name='" + cmbUsers.SelectedValue + "'", conn);
                        string fff = Convert.ToString(ssf.ExecuteScalar());
                        conn.Close();
                        if (fff == "Admin")
                            Session["admin"] = 1;
                        else
                            Session["admin"] = 0;

                        Session["msg"] = "Welcome, " + Session["user"].ToString();
                        if (Session["redirect"]!=null )
                        {
                            string url = Session["redirect"].ToString();
                            Session["redirect"] = null;
                            Response.Redirect(url);
                        }
                        else
                        {
                            Response.Redirect("welcome.aspx");
                        }
                    }

                }
                else
                {

                    lblError.Text= "Wrong password";
                }
            }
            else
            {
                lblError.Text = "Enter password";
            }
        }
            

}
    }
