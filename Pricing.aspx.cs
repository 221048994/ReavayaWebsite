using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static iTextSharp.text.pdf.PdfDocument;

namespace ReaVaya_Bus_System
{
    public partial class Pricing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        public string GenerateRandomNumberString(string matchString)
        {
            Random random = new Random();
            string randomNumberString;

            do
            {
                randomNumberString = GenerateRandomDigits(random, 5); // 5-digit string
            }
            while (randomNumberString == matchString);

            return randomNumberString;
        }

        private string GenerateRandomDigits(Random random, int length)
        {
            string digits = string.Empty;
            for (int i = 0; i < length; i++)
            {
                digits += random.Next(0, 10).ToString();
            }
            return digits;
        }

        protected void PurchaseBtn_Click(object sender, EventArgs e)
        {
            string selectedOrigin = Request.Form["selectedOrigin"];
            string selectedDestination = Request.Form["selectedDestination"];
            if (Session["LoggedInUser"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string date = Convert.ToString(DateTime.UtcNow);

                string time = Convert.ToString(DateTime.Now);


                string price = Request.Form["priceValue"];
                string TicketNo = GenerateRandomNumberString("43957");
                Session["TicketNumber"] = TicketNo;

                string owner = Session["LoggedInUser"].ToString();

                if (selectedOrigin != null && selectedDestination != null && date != null && time != null)
                {
                    // Define the connection string
                    string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

                    // Define the query
                    string query = "INSERT INTO [Ticket] (TicketNumber,TicketOwner, Origin, Destination, Date, Time, TripAmount) VALUES (@TicketNumber,@TicketOwner, @Origin, @Destination, @Date, @Time, @TripAmount)";

                    // Execute the query
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@TicketNumber", TicketNo);
                            command.Parameters.AddWithValue("@TicketOwner", owner);
                            command.Parameters.AddWithValue("@Origin", selectedOrigin);
                            command.Parameters.AddWithValue("@Destination", selectedDestination);
                            command.Parameters.AddWithValue("@Date", date);
                            command.Parameters.AddWithValue("@Time", time);
                            command.Parameters.AddWithValue("@TripAmount", price);

                            try
                            {
                                connection.Open();
                                command.ExecuteNonQuery();

                            }
                            catch (Exception ex)
                            {
                                // successLabel.Text = "An error occurred: " + ex.Message;

                            }
                        }
                    }

                }

                string purchaseUrl = $"CheckoutTicket.aspx?origin={HttpUtility.UrlEncode(selectedOrigin)}&destination={HttpUtility.UrlEncode(selectedDestination)}&price={HttpUtility.UrlEncode(price)}";

                // Redirect to the purchase page
                Response.Redirect(purchaseUrl);
            }
        }

    }
}