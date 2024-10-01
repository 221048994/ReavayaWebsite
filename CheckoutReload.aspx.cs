using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReaVaya_Bus_System
{
    public partial class CheckoutReload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string userEmail = Session["LoggedInUser"].ToString();
                // Populate existing cards dropdown
                var cards = GetBankCardsByEmail(userEmail);
                int count = 0;
                existingCard.Items.Add(new ListItem("Select Existing Bank Card"));
                foreach (var i in cards)
                {
                    count++;
                    existingCard.Items.Add(new ListItem(i.CardNo));
                }
                if (Session["Amount"] != null)
                {
                    ReloadAmount.Text = Session["Amount"].ToString();
                }
                else
                {
                    ReloadAmount.Text = Session["ExistingAmount"].ToString();
                }
                
            }
        }

        protected void ExistingCard_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Populate existing card details based on selected card
            string userEmail = Session["LoggedInUser"].ToString();
            var cards = GetBankCardsByEmail(userEmail);
            int count = 0;
            foreach (var card in cards)
            {
                count++;
                if (existingCard.SelectedValue == card.CardNo)
                {
                    existingNameOnCard.Text = card.NameOncard;
                    existingCardNumber.Text = card.CardNo;
                    existingExpiryDate.Text = card.ExpiryDate;
                    existingCvv.Text = card.CVV;
                }
            }


            // Set the active tab to existing card tab after postback
            ActiveTab.Value = "#existing-card";
        }

        protected void payBtn_Click(object sender, EventArgs e)
        {
            string NameOnCard = nameOnCard.Text.Trim();
            string cardNo = cardNumber.Text.Trim();
            string expirydate = expiryDate.Text.Trim();
            string CVV = cvv.Text.Trim();
            string userEmail = Session["LoggedInUser"].ToString();
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
               
                Response.Redirect("RelaodSuccess.aspx");

            }
            else
            {
                errorLabel.Text = "Not all text boxes are filled, please try again....";
                errorLabel.Visible = true;
            }
        }

        private List<BankCardD> GetBankCardsByEmail(string email)
        {
            List<BankCardD> cards = new List<BankCardD>();

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
                            BankCardD card = new BankCardD
                            {
                                NameOncard = reader.GetString(0),
                                CardOwner = reader.GetString(1),
                                CardNo = reader.GetString(2),
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

        protected void EPaybtn_Click(object sender, EventArgs e)
        {
            string NameOnCard = existingNameOnCard.Text.Trim();
            string cardNo = existingCardNumber.Text.Trim();
            string expirydate = existingExpiryDate.Text.Trim();
            string CVV = existingCvv.Text.Trim();
            string userEmail = Session["LoggedInUser"].ToString();
            string CardOwner = userEmail;

            

                successLabel.Visible = true;
                System.Threading.Thread.Sleep(1500);
                Response.Redirect("ReloadSuccess.aspx");

            
        }
    }



    public class BankCardD
    {
        public string NameOncard { get; set; }
        public string CardOwner { get; set; }
        public string CardNo { get; set; }
        public string ExpiryDate { get; set; }
        public string CVV { get; set; }
    }
}