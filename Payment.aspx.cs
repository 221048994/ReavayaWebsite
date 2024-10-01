using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReaVaya_Bus_System
{
    public partial class Payment : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedInUser"] == null) 
            {
                Response.Redirect("Login.aspx");
            }
            string userEmail = Session["LoggedInUser"] as string;
            string total = Request.QueryString["price"];
            ReloadAmount.Text = total;
            TicketNo.Text = "98321";

            if (!IsPostBack && userEmail != null)
            {
                // Populate existing cards dropdown
                var cards = GetBankCardsByEmail(userEmail);
                int count = 0;
                foreach (var i in cards)
                {
                    count++;
                    existingCard.Items.Add(new ListItem(i.CardNumber));
                }
            }
        }

        protected void ExistingCard_SelectedIndexChanged(object sender, EventArgs e)
        {
            string userEmail = Session["LoggedInUser"] as string;
            // Populate existing card details based on selected card
            var cards = GetBankCardsByEmail(userEmail);
            int count = 0;
            foreach (var card in cards)
            {
                count++;
                if (existingCard.SelectedValue == card.CardNumber)
                {
                    existingNameOnCard.Text = card.NameOnCard;
                    existingCardNumber.Text = card.CardNumber;
                    existingExpiryDate.Text = card.ExpiryDate.ToString();
                    existingCvv.Text = card.CVV;
                }
            }


            // Set the active tab to existing card tab after postback
            ActiveTab.Value = "#existing-card";
        }

        protected void payBtn_Click(object sender, EventArgs e)
        {
            string userEmail = Session["LoggedInUser"] as string;
            string NameOnCard = nameOnCard.Text.Trim();
            string cardNo = cardNumber.Text.Trim();
            DateTime expirydate = Convert.ToDateTime(expiryDate.Text);
            string CVV = cvv.Text.Trim();
            string CardOwner = userEmail;

            if (NameOnCard != null && cardNo != null && expirydate != null && CVV != null && CardOwner != null)
            {
                // Define the connection string
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

                // Define the query
                string query = "INSERT INTO [Card] (Email, NameOnCard, CardNumber, Expirydate, CVV) VALUES (@Email, @NameOnCard, @CardNumber, @Expirydate, @CVV)";

                // Execute the query
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Email", userEmail);
                        command.Parameters.AddWithValue("@NameOnCard", NameOnCard);
                        command.Parameters.AddWithValue("@CardNumber", cardNo);
                        command.Parameters.AddWithValue("@Expirydate", expirydate);
                        command.Parameters.AddWithValue("@CVV", CVV);

                        try
                        {
                            connection.Open();
                            command.ExecuteNonQuery();

                        }
                        catch (Exception ex)
                        {
                            successLabel.Text = "An error occurred: " + ex.Message;

                        }
                    }
                }

                successLabel.Visible = true;
                string price = Request.QueryString["price"];
                string origin = Request.QueryString["origin"];
                string destination = Request.QueryString["destination"];
                string quantity = Request.QueryString["quantity"];
                Session["Price"] = Request.QueryString["price"];
                Session["Origin"] = Request.QueryString["origin"];
                Session["Destination"] = Request.QueryString["destination"];
                Response.Redirect($"Ticket.aspx?origin={origin}&destination={destination}&price={price}&quantity={quantity}");
                Response.Redirect("Ticket.aspx");

            }
            else
            {
                errorLabel.Text = "Not all text boxes are filled, please try again....";
                errorLabel.Visible = true;
            }
        }

        public List<BankCardInfo> GetBankCardsByEmail(string email)
        {
            List<BankCardInfo> cards = new List<BankCardInfo>();

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            string query = "SELECT Email, NameOnCard, CardNumber, Expirydate, CVV FROM [Card] WHERE Email = @Email";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);

                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        while (reader.Read())
                        {
                            BankCardInfo card = new BankCardInfo
                            {
                                Email = reader.GetString(0),
                                CardNumber = reader.GetString(1),
                                ExpiryDate = reader.GetDateTime(2),
                                CVV = reader.GetString(3),
                                NameOnCard = reader.GetString(4)
                            };
                            cards.Add(card);
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle the exception (logging, displaying a message, etc.)
                        successLabel.Text = "An error occurred while retrieving card information: " + ex.Message;
                    }
                }
            }

            return cards;
        }

        public class BankCardInfo 
        {
            public string Email { get; set; }
            public string CardNumber { get; set; }
            public DateTime ExpiryDate { get; set; }
            public string CVV { get; set; }
            public string NameOnCard { get; set; }
        }
    }
}