using System;
using System.Globalization;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReaVaya_Bus_System
{
    public partial class PurchaseTicket : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string origin = Request.QueryString["origin"];
                string destination = Request.QueryString["destination"];
                string price = Request.QueryString["price"];

                if (!string.IsNullOrEmpty(origin) && !string.IsNullOrEmpty(destination) && !string.IsNullOrEmpty(price))
                {
                    txtOrigin.Text = origin;
                    txtDestination.Text = destination;

                    if (decimal.TryParse(price, NumberStyles.Currency, CultureInfo.InvariantCulture, out decimal basePrice))
                    {
                        Session["BasePrice"] = basePrice; // Store the base price in session
                        UpdateTotalPrice();
                    }
                    else
                    {
                        // Handle the case where the price format is invalid
                        txtPrice.Text = "Invalid Price Format";
                        btnPurchase.Enabled = false; // Disable purchase button if price is invalid
                    }
                }
            }
        }

        protected void ddlQuantity_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateTotalPrice();
        }

        protected void btnPurchase_Click(object sender, EventArgs e)
        {
            string origin = txtOrigin.Text;
            string destination = txtDestination.Text;
            string price = txtPrice.Text;
            string quantity = ddlQuantity.SelectedValue;

            // Redirect to Payment.aspx with the required query parameters
            Response.Redirect($"Payment.aspx?origin={origin}&destination={destination}&price={price}&quantity={quantity}");
            Session["Origin"] = origin;
            Session["Destination"] = destination;
            Session["Price"] = price;
            Session["Quantity"] = quantity;
        }

        private void UpdateTotalPrice()
        {
            if (Session["BasePrice"] != null && decimal.TryParse(Session["BasePrice"].ToString(), out decimal basePrice))
            {
                int quantity = int.Parse(ddlQuantity.SelectedValue);
                decimal totalPrice = basePrice * quantity;
                txtPrice.Text = totalPrice.ToString("F2"); // Display total price in txtPrice
            }
            else
            {
                // Handle the case where the base price is not available or invalid
                txtPrice.Text = "Invalid Price";
            }
        }
    }
}
