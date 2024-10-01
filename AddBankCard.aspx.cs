using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

namespace ReaVaya_Bus_System
{
    public partial class AddBankCard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected async void AddBtn_Click(object sender, EventArgs e)
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
               
            }
            else
            {
                errorLabel.Text = "Not all text boxes are filled, please try again....";
                errorLabel.Visible = true;
            }
        }
    
    }
}