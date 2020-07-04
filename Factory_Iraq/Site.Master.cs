using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Factory_Iraq
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            NotLogged.Visible = (Session["user"] == null);
            logged.Visible = Session["user"] != null;

            if (logged.Visible)
                userSpan.InnerText = Session["user"].ToString();

            if (Request.Path.ToLower().Contains("login"))
            {
                NotLogged.Visible = false;
                logged.Visible = false;
            }
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("login.aspx");
        }
    }
}