using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReaVaya_Bus_System
{
    public partial class ReloadTag : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userEmail = Session["LoggedInUser"].ToString();
            var cards = GetCardsByEmail(userEmail);
            if (!IsPostBack && cards != null)
            {
                int count = 0;
                decimal exAmount = 0;
                existingCard.Items.Add(new ListItem("Select Existing Bus Tag"));
                foreach (var i in cards)
                {
                   count++;
                    existingCard.Items.Add(new ListItem(Convert.ToString(i.SerialNumber)));
                    exAmount = Convert.ToDecimal(i.ReloadedAmount);
                }

            }
        }

        // New function to retrieve all card information by email address
        private List<TagInfo> GetCardsByEmail(string email)
        {
            List<TagInfo> cards = new List<TagInfo>();

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            string query = "SELECT SerialNumber, ReloadedAmount, Balance FROM [BusTag] WHERE OwnerEmail = @OwnerEmail";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@OwnerEmail", email);

                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        while (reader.Read())
                        {
                            TagInfo card = new TagInfo
                            {
                                SerialNumber = reader.GetString(0),
                                ReloadedAmount = reader.GetDecimal(1),
                                Amount = reader.GetDecimal(2),
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

        private decimal GetExistingAmountBySerialNumber(string SerialNo)
        {
            decimal amount = 0;

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            string query = "SELECT Balance FROM [BusTag] WHERE SerialNumber = @SerialNumber";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@SerialNumber", SerialNo);

                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        while (reader.Read())
                        {
                            amount = reader.GetDecimal(0);
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle the exception (logging, displaying a message, etc.)
                        successLabel.Text = "An error occurred while retrieving card information: " + ex.Message;
                    }
                }
            }

            return amount;
        }

        protected void ReloadNewBtn_Click(object sender, EventArgs e)
        {
            string SerialNo = serialNumber.Text.Trim();
            decimal Amount = Convert.ToDecimal(amount.Text.Trim());
            string userEmail = Session["LoggedInUser"].ToString();

            if (SerialNo != null && amount != null)
            {
                // Define the connection string
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

                // Define the query
                string query = "INSERT INTO [BusTag] (SerialNumber, OwnerEmail, ReloadedAmount, Balance, Date) VALUES (@SerialNumber, @OwnerEmail, @ReloadedAmount, @Balance, @Date)";

                // Execute the query
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@SerialNumber", SerialNo);
                        command.Parameters.AddWithValue("@OwnerEmail", userEmail);
                        command.Parameters.AddWithValue("@ReloadedAmount", Amount);
                        command.Parameters.AddWithValue("@Balance", Amount);
                        command.Parameters.AddWithValue("@Date", DateTime.Now);

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
                Session["SerialNumber"] = serialNumber.Text;
                Session["Amount"] = amount.Text;
            }
            else
            {
                EmptyText.Text = "Not all text boxes are filled, please try again....";
                EmptyText.Visible = true;
            }
            Response.Redirect("CheckoutReload.aspx");
        }


        protected void ReloadExistingBtn_Click(object sender, EventArgs e)
        {
            string SerialNo = existingSerialNumber.Text.Trim();
            decimal Amount = Convert.ToDecimal(existingAmount.Text.Trim());
            string userEmail = Session["LoggedInUser"].ToString();
            // Sessions
            decimal exAmount = GetExistingAmountBySerialNumber(SerialNo);

            if (!string.IsNullOrEmpty(SerialNo) && Amount != null)
            {
                // Define the connection string
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

                // Define the update query
                string query = "UPDATE [BusTag] " +
                               "SET ReloadedAmount = @ReloadedAmount, " +
                               "    Balance = Balance + @Amount, " +
                               "    Date = @Date " +
                               "WHERE SerialNumber = @SerialNumber AND OwnerEmail = @OwnerEmail";

                // Execute the query
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@SerialNumber", SerialNo);
                        command.Parameters.AddWithValue("@OwnerEmail", userEmail);
                        command.Parameters.AddWithValue("@ReloadedAmount", Amount);
                        command.Parameters.AddWithValue("@Amount", Amount);
                        command.Parameters.AddWithValue("@Date", DateTime.Now);

                        try
                        {
                            connection.Open();
                            int rowsAffected = command.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                successLabel.Text = "Balance updated successfully.";
                            }
                            else
                            {
                                successLabel.Text = "No matching record found.";
                            }
                        }
                        catch (Exception ex)
                        {
                            successLabel.Text = "An error occurred: " + ex.Message;
                        }
                    }
                }

                successLabel.Visible = true;
                Session["ExistingSerialNumber"] = SerialNo;
                Session["ExistingAmount"] = Amount;
            }
            else
            {
                EmptyText.Text = "Not all text boxes are filled, please try again....";
                EmptyText.Visible = true;
            }

            Response.Redirect("CheckoutReload.aspx");

        }


        protected void ExistingCard_SelectedIndexChanged(object sender, EventArgs e)
        {
            string userEmail = Session["LoggedInUser"].ToString();
            // Populate existing card details based on selected card
            var cards = GetCardsByEmail(userEmail);
            int count = 0;
            foreach (var card in cards)
            {
                count++;
                if (existingCard.SelectedValue == Convert.ToString(card.SerialNumber))
                {
                    existingSerialNumber.Text = Convert.ToString(card.SerialNumber);
                    double balance = Convert.ToDouble(card.Amount);
                    string balanceString = balance.ToString("F2");
                    currentAmount.Text = "Current balance is R" + balanceString;
                    currentAmount.Visible = true;
                }
            }


            // Set the active tab to existing card tab after postback
            ActiveTab.Value = "#existing-card";
        }
    }

    // CardInfo class to store card information
    public class TagInfo
    {
        public string SerialNumber { get; set; }
        public string OwnerEmail { get; set; }
        public decimal ReloadedAmount { get; set; }
        public decimal Amount { get; set; }
    }
}