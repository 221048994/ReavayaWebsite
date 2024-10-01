using Microsoft.AspNet.FriendlyUrls;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static ReaVaya_Bus_System.Payment;

namespace ReaVaya_Bus_System
{
    public partial class CheckoutTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string userEmail = Session["LoggedInUser"] as string;

            string or = Request.QueryString["origin"];
            string de = Request.QueryString["destination"];
            string pr = Request.QueryString["price"];
            if (Session["Origin"] != null && Session["Destination"] != null && Session["Price"] != null)
            {
                ReloadAmount.Text = Session["Price"].ToString() ;
                if (!IsPostBack && userEmail != null)
                {
                    // Populate existing cards dropdown
                    var cards = GetBankCardsByEmail(userEmail);
                    int count = 0;
                    existingCard.Items.Add(new ListItem("Select Existing Bank Card"));
                    if (cards != null)
                    {
                        foreach (var i in cards)
                        {
                            count++;
                            existingCard.Items.Add(new ListItem(i.CardNumber));
                        }
                    }

                }
            }
            else if(or != null && de != null && pr != null)
            {
                ReloadAmount.Text = pr;
                if (!IsPostBack && userEmail != null)
                {
                    // Populate existing cards dropdown
                    var cards = GetBankCardsByEmail(userEmail);
                    int count = 0;
                    existingCard.Items.Add(new ListItem("Select Existing Bank Card"));
                    if (cards != null)
                    {
                        foreach (var i in cards)
                        {
                            count++;
                            existingCard.Items.Add(new ListItem(i.CardNumber));
                        }
                    }

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
                    existingExpiryDate.Text = card.ExpiryDate;
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
            string expirydate = expiryDate.Text.Trim();
            string CVV = cvv.Text.Trim();
            string CardOwner = userEmail;

            if (NameOnCard != null && cardNo != null && expirydate != null && CVV != null && CardOwner != null)
            {
                // Define the connection string
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

                // Define the query
                string query = "INSERT INTO [BankCard] (CardOwner, NameOnCard, CardNumber, Expirydate, CVV) VALUES (@CardOwner, @NameOnCard, @CardNumber, @Expirydate, @CVV)";

                // Execute the query
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@NameOnCard", NameOnCard);
                        command.Parameters.AddWithValue("@CardOwner", CardOwner);
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
                string origin = Request.QueryString["origin"];
                string destination = Request.QueryString["destination"];
                string price = Request.QueryString["price"];
                Response.Redirect($"TicketSuccess.aspx?origin={origin}&destination={destination}&price={price}");

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
            string query = "SELECT NameOnCard, cardOwner, CardNumber, Expirydate, CVV FROM [BankCard] WHERE CardOwner = @CardOwner";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CardOwner", email);

                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        while (reader.Read())
                        {
                            BankCardInfo card = new BankCardInfo
                            {
                                NameOnCard = reader.GetString(0),
                                CardOwner = reader.GetString(1),
                                CardNumber = reader.GetString(2),
                                ExpiryDate = reader.GetString(3),
                                CVV = reader.GetString(4)
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

        protected void EPaybtn_Click1(object sender, EventArgs e)
        {
            string userEmail = Session["LoggedInUser"] as string;
            string NameOnCard = existingNameOnCard.Text.Trim();
            string cardNo = existingCardNumber.Text.Trim();
            string expirydate = existingExpiryDate.Text.Trim();
            string CVV = existingCvv.Text.Trim();
            string CardOwner = userEmail;

            if (NameOnCard != null && cardNo != null && expirydate != null && CVV != null && CardOwner != null)
            {
                string origin = Request.QueryString["origin"];
                string destination = Request.QueryString["destination"];
                string price = Request.QueryString["price"];
                Response.Redirect($"TicketSuccess.aspx?origin={origin}&destination={destination}&price={price}");
            }
        }
    }

    public class BankCardInfo
    {
        public string CardOwner { get; set; }
        public string CardNumber { get; set; }
        public string ExpiryDate { get; set; }
        public string CVV { get; set; }
        public string NameOnCard { get; set; }
    }
}