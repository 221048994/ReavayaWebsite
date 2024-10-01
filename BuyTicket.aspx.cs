using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReaVaya_Bus_System
{
    public partial class BuyTicket : System.Web.UI.Page
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

            if ((stationFrom.SelectedValue == "Thokoza Park" && stationTo.SelectedValue == "Lakeview") ||
    (stationFrom.SelectedValue == "Lakeview" && stationTo.SelectedValue == "Thokoza Park"))
            {
                TripAmount = 18.50;
            }
            else if ((stationFrom.SelectedValue == "Thokoza Park" && stationTo.SelectedValue == "Ellis Park") ||
                     (stationFrom.SelectedValue == "Ellis Park" && stationTo.SelectedValue == "Thokoza Park"))
            {
                TripAmount = 22.50;
            }
            else if ((stationFrom.SelectedValue == "Braamfontein" && stationTo.SelectedValue == "Parktown") ||
                     (stationFrom.SelectedValue == "Parktown" && stationTo.SelectedValue == "Braamfontein"))
            {
                TripAmount = 8.50;
            }
            else if ((stationFrom.SelectedValue == "Thokoza Park" && stationTo.SelectedValue == "Braamfontein") ||
                     (stationFrom.SelectedValue == "Braamfontein" && stationTo.SelectedValue == "Thokoza Park"))
            {
                TripAmount = 15.00;
            }
            else if ((stationFrom.SelectedValue == "Metro Centre" && stationTo.SelectedValue == "Noordgesig") ||
                     (stationFrom.SelectedValue == "Noordgesig" && stationTo.SelectedValue == "Metro Centre"))
            {
                TripAmount = 7.50;
            }
            else if ((stationFrom.SelectedValue == "Rissik Street" && stationTo.SelectedValue == "Pimville") ||
                     (stationFrom.SelectedValue == "Pimville" && stationTo.SelectedValue == "Rissik Street"))
            {
                TripAmount = 9.00;
            }
            else if ((stationFrom.SelectedValue == "Mapetla" && stationTo.SelectedValue == "Ellis Park") ||
                     (stationFrom.SelectedValue == "Ellis Park" && stationTo.SelectedValue == "Mapetla"))
            {
                TripAmount = 10.50;
            }
            else if ((stationFrom.SelectedValue == "Thokoza Park" && stationTo.SelectedValue == "Metro Centre") ||
                     (stationFrom.SelectedValue == "Metro Centre" && stationTo.SelectedValue == "Thokoza Park"))
            {
                TripAmount = 12.00;
            }
            else if ((stationFrom.SelectedValue == "Thokoza Park" && stationTo.SelectedValue == "Noordgesig") ||
                     (stationFrom.SelectedValue == "Noordgesig " && stationTo.SelectedValue == "Thokoza Park"))
            {
                TripAmount = 11.00;
            }
            else if ((stationFrom.SelectedValue == "Ellis Park" && stationTo.SelectedValue == "Parktown") ||
                     (stationFrom.SelectedValue == "Parktown" && stationTo.SelectedValue == "Ellis Park"))
            {
                TripAmount = 9.50;
            }
            else if ((stationFrom.SelectedValue == "Braamfontein " && stationTo.SelectedValue == "Pimville") ||
                     (stationFrom.SelectedValue == "Pimville" && stationTo.SelectedValue == "Braamfontein "))
            {
                TripAmount = 17.00;
            }
            else if ((stationFrom.SelectedValue == "Noordgesig" && stationTo.SelectedValue == "Rissik Street") ||
                     (stationFrom.SelectedValue == "Rissik Street" && stationTo.SelectedValue == "Noordgesig"))
            {
                TripAmount = 8.00;
            }
            else if ((stationFrom.SelectedValue == "Thokoza Park" && stationTo.SelectedValue == "Mapetla") ||
                     (stationFrom.SelectedValue == "Mapetla" && stationTo.SelectedValue == "Thokoza Park"))
            {
                TripAmount = 7.50;
            }
            else if ((stationFrom.SelectedValue == "Metro Centre" && stationTo.SelectedValue == "Pimville") ||
                     (stationFrom.SelectedValue == "Pimville" && stationTo.SelectedValue == "Metro Centre"))
            {
                TripAmount = 14.00;
            }
            else if ((stationFrom.SelectedValue == "Braamfontein" && stationTo.SelectedValue == "Rissik Street") ||
                     (stationFrom.SelectedValue == "Rissik Street" && stationTo.SelectedValue == "Braamfontein"))
            {
                TripAmount = 10.00;
            }
            else if ((stationFrom.SelectedValue == "Ellis Park" && stationTo.SelectedValue == "Noordgesig") ||
                     (stationFrom.SelectedValue == "Noordgesig" && stationTo.SelectedValue == "Ellis Park"))
            {
                TripAmount = 8.75;
            }
            else if ((stationFrom.SelectedValue == "Parktown" && stationTo.SelectedValue == "Rissik Street") ||
                     (stationFrom.SelectedValue == "Rissik Street" && stationTo.SelectedValue == "Parktown"))
            {
                TripAmount = 9.25;
            }
            else if ((stationFrom.SelectedValue == "Mapetla" && stationTo.SelectedValue == "Pimville") ||
                     (stationFrom.SelectedValue == "Pimville" && stationTo.SelectedValue == "Mapetla"))
            {
                TripAmount = 6.50;
            }
            else if ((stationFrom.SelectedValue == "Braamfontein" && stationTo.SelectedValue == "Noordgesig") ||
                     (stationFrom.SelectedValue == "Noordgesig" && stationTo.SelectedValue == "Braamfontein"))
            {
                TripAmount = 12.50;
            }
            else if ((stationFrom.SelectedValue == "Parktown" && stationTo.SelectedValue == "Pimville") ||
                     (stationFrom.SelectedValue == "Pimville" && stationTo.SelectedValue == "Parktown"))
            {
                TripAmount = 11.50;
            }
            else if ((stationFrom.SelectedValue == "Rissik Street" && stationTo.SelectedValue == "Metro Centre") ||
                     (stationFrom.SelectedValue == "Metro Centre" && stationTo.SelectedValue == "Rissik Street"))
            {
                TripAmount = 9.75;
            }
            else if ((stationFrom.SelectedValue == "Ellis Park" && stationTo.SelectedValue == "Rissik Street") ||
                     (stationFrom.SelectedValue == "Rissik Street" && stationTo.SelectedValue == "Ellis Park"))
            {
                TripAmount = 11.75;
            }
            else if ((stationFrom.SelectedValue == "Metro Centre" && stationTo.SelectedValue == "Braamfontein") ||
                     (stationFrom.SelectedValue == "Braamfontein" && stationTo.SelectedValue == "Metro Centre"))
            {
                TripAmount = 8.00;
            }
            else if ((stationFrom.SelectedValue == "Mapetla" && stationTo.SelectedValue == "Parktown") ||
                     (stationFrom.SelectedValue == "Parktown" && stationTo.SelectedValue == "Mapetla"))
            {
                TripAmount = 14.50;
            }
            else if ((stationFrom.SelectedValue == "Noordgesig" && stationTo.SelectedValue == "Pimville") ||
                     (stationFrom.SelectedValue == "Pimville" && stationTo.SelectedValue == "Noordgesig"))
            {
                TripAmount = 6.75;
            }
            else
            {
                amount.Visible = false;
                return;
            }


            amount.Text = TripAmount.ToString("F2");
            amount.Visible = true;
            Session["Price"] = TripAmount;
        }
        protected void PlaceOrderBtn_Click(object sender, EventArgs e)
        {

            if (Session["LoggedInUser"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string sf = stationFrom.Text;
                Session["Origin"] = sf;
                string st = stationTo.Text;
                Session["Destination"] = st;
                string date = Convert.ToString(DateTime.UtcNow);
                Session["Date"] = date;
                string time = Convert.ToString(DateTime.Now);
                Session["Time"] = time;
                double am = Convert.ToDouble(Session["Price"]);

                string TicketNo = GenerateRandomNumberString("43957");
                Session["TicketNumber"] = TicketNo;

                string owner = Session["LoggedInUser"].ToString();

                if (sf != null && st != null && date != null && time != null)
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
                            command.Parameters.AddWithValue("@Origin", sf);
                            command.Parameters.AddWithValue("@Destination", st);
                            command.Parameters.AddWithValue("@Date", date);
                            command.Parameters.AddWithValue("@Time", time);
                            command.Parameters.AddWithValue("@TripAmount", am);

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
                Response.Redirect("CheckoutTicket.aspx");
            }


        }

        public double getTripAmount()
        {
            return this.TripAmount;
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

        public static double GenerateRandomDouble()
        {
            Random random = new Random();
            double min = 10.0;
            double max = 32.50;
            double randomValue = random.NextDouble() * (max - min) + min;
            return Math.Round(randomValue, 2);
        }
    }
}