using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReaVaya_Bus_System
{
    public partial class ViewTickets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTickets();
            }
        }

        private void LoadTickets()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            string userEmail = Session["LoggedInUser"].ToString();

            string query = "SELECT TicketNumber,TicketOwner, Origin, Destination, Date, Time, TripAmount, Status FROM Ticket WHERE TicketOwner = @TicketOwner";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@TicketOwner", userEmail);
                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        TicketRepeater.DataSource = reader;
                        TicketRepeater.DataBind();
                    }
                }
            }

        }

        protected void BoardButton_Click(object sender, EventArgs e)
        {
            Button boardButton = (Button)sender;
            string ticketNumber = boardButton.CommandArgument;
            TimeSpan bTime = DateTime.Now.TimeOfDay; // Capture current time
            boardButton.BackColor = System.Drawing.Color.Gray;

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "UPDATE Ticket SET Status = 'Boarded', boardingTime = @boardingTime WHERE TicketNumber = @TicketNumber";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@TicketNumber", ticketNumber);
                    cmd.Parameters.AddWithValue("@boardingTime", bTime); // Ensure this matches the SQL parameter
                    con.Open();
                    // Debugging output
                    System.Diagnostics.Debug.WriteLine($"Boarding Time: {bTime}");

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        // Optionally, hide the button or mark the ticket as boarded
                        LoadTickets();  // Refresh the ticket list to reflect the change
                    }
                    else
                    {
                        // Handle the case where the ticket was not updated (optional)
                    }
                }
            }
        }


        public static string GenerateRandomString()
        {
            Random random = new Random();

            // Generate a random number between 1 and 5
            int number = random.Next(1, 6);

            // Generate a random letter between 'A' and 'N'
            char letter = (char)random.Next('A', 'N' + 1);

            // Combine number and letter into a string
            string result = number.ToString() + letter;

            return result;
        }
    }
}