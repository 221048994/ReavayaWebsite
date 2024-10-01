using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReaVaya_Bus_System
{
    public partial class ReloadSuccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["ExistingSerialNumber"] != null && Session["ExistingAmount"] != null && Session["ExistingAmount"] != null)
                {
                    serialNumberLabel.Text = Session["ExistingSerialNumber"].ToString();
                    amountLabel.Text = Session["ExistingAmount"].ToString();
                    decimal am = Convert.ToDecimal(Session["Amount"]);
                    decimal ea = Convert.ToDecimal(Session["ExistingAmount"]);
                    newBalanceLabel.Text = Convert.ToString(am + ea);
                }
                else if (Session["SerialNumber"] != null && Session["Amount"] != null)
                {
                    serialNumberLabel.Text = Session["SerialNumber"].ToString();
                    amountLabel.Text = Session["Amount"].ToString();
                    decimal am = Convert.ToDecimal(Session["Amount"]);              
                    newBalanceLabel.Text = Convert.ToString(am);
                }
            }
        }

        protected void RedirectButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reloads.aspx");
        }
    }
}