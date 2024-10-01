using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReaVaya_Bus_System
{
    public partial class BookSuccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // string sn = Session["SerialNumber"].ToString();
                IDLabel.Text = "98321";
                string amount = Session["Price"].ToString();
                amountLabel.Text = amount;
                string cs = Session["Origin"].ToString();
                CollectionStation.Text = cs;
            }
        }

        protected void RedirectButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrackBus.aspx");
        }
    }
}