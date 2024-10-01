using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReaVaya_Bus_System
{
    public partial class OrderTag : System.Web.UI.Page
    {
        string email;
        protected void Page_Load(object sender, EventArgs e)
        {
           
                email = Session["LoggedInUser"].ToString();
            
        }

        protected void CalculateBtn_Click(object sender, EventArgs e)
        {
            if (decimal.TryParse(amount.Text, out decimal amountValue))
            {
                decimal total = (amountValue) + 10; // Add R10 booking fee
                orderListView.DataSource = new[]
                {
                    new { Description = "Amount \n" , Value = amountValue.ToString("C") },
                    new { Description = "Booking Fee \n", Value = "R10.00" },
                    new { Description = "Total \n", Value = total.ToString("C") }
                };
                orderListView.DataBind();
                feeLabel.Visible = true;

                Session["CollectionStation"] = station.Text;
                Session["Total"] = total;
                

            }
        }

        protected void PlaceOrderBtn_Click(object sender, EventArgs e)
        {
            
            if (email == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string Station = station.Text;
                double balance = Convert.ToInt32(amount.Text);
                if (Station != null &&  balance != null)
                {
                    // Define the connection string
                    string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

                    // Define the query
                    string query = "INSERT INTO [TagOrder] (OwnerEmail, CollectionStation, Balance, Date) VALUES (@OwnerEmail, @CollectionStation, @Balance, @Date)";

                    // Execute the query
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@OwnerEmail", email);
                            command.Parameters.AddWithValue("@CollectionStation", Station);
                            command.Parameters.AddWithValue("@Balance", balance);
                            command.Parameters.AddWithValue("@Date", DateTime.UtcNow);

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
                Response.Redirect("CheckoutTag.aspx");
            }
            
        }

    }
}