using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReaVaya_Bus_System
{
    public partial class TrackBusFromTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["Origin"] != null && Session["Destination"] != null)
            {
                originn.Text = Session["Origin"].ToString();
                destinationn.Text = Session["Destination"].ToString();
            }
            else
            {
                originn.Text = Request.QueryString["origin"];
                destinationn.Text = Request.QueryString["destination"];
                
            }
            
        }
    }
}