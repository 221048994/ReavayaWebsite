using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReaVaya_Bus_System
{
    public partial class Purchase : System.Web.UI.Page
    {
        double TripAmount;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdateTripAmount();
            }
        }

        protected void Station_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateTripAmount();
        }

        private void UpdateTripAmount()
        {
            if (stationFrom.SelectedValue == "Thokoza Park Station" && stationTo.SelectedValue == "Lakeview Station")
            {
                TripAmount = 18.50;
            }
            else if (stationFrom.SelectedValue == "Thokoza Park Station" && stationTo.SelectedValue == "Ellis Park Station")
            {
                TripAmount = 22.50;
            }
            else if (stationFrom.SelectedValue == "Braamfontein Station" && stationTo.SelectedValue == "Parktown Station")
            {
                TripAmount = 8.50;
            }
            else if (stationFrom.SelectedValue == "Thokoza Park Station" && stationTo.SelectedValue == "Thokoza Park Station")
            {
                amount.Visible = false;
                return;
            }
            else
            {
                TripAmount = 12.50;
            }
            amount.Text = TripAmount.ToString("F2");
            amount.Visible = true;
        }
        protected void PlaceOrderBtn_Click(object sender, EventArgs e)
        {
            UpdateTripAmount();
            if (Session["Email"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Session["StationFrom"] = stationFrom.Text;
                Session["StationTo"] = stationTo.Text;
                Session["Date"] = DateTime.UtcNow;
                Session["Time"] = DateTime.Now;
                //Session["Quantity"] = quantity.Text;
                Session["TotalA"] = TripAmount;
                Session["TicketInfo"] = new TicketInfo { TicketNo = 1123, from = stationFrom.Text, to = stationTo.Text, Date = DateTime.UtcNow, time = DateTime.Now, Total = TripAmount };
                Response.Redirect("CheckoutBuyTicket.aspx");
            }
        }
    }
}