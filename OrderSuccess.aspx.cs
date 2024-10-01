using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReaVaya_Bus_System
{
    public partial class OrderSuccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sn = Session["SerialNumber"].ToString();
                serialNumberLabel.Text = sn;
                string amount = Session["Total"].ToString();
                amountLabel.Text = amount;
                string cs = Session["CollectionStation"].ToString();
                CollectionStation.Text = cs;
            }

        }

        protected void RedirectButton_Click(object sender, EventArgs e)
        {
            string sn = Session["SerialNumber"].ToString();
            decimal amount = Convert.ToDecimal(Session["Total"].ToString());
            string email = Session["LoggedInUser"].ToString();
            if (sn != null && amount != null && email != null)
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
                        command.Parameters.AddWithValue("@SerialNumber", sn);
                        command.Parameters.AddWithValue("@OwnerEmail", email);
                        command.Parameters.AddWithValue("@ReloadedAmount", amount);
                        command.Parameters.AddWithValue("@Balance", amount);
                        command.Parameters.AddWithValue("@Date", DateTime.Now);

                        try
                        {
                            connection.Open();
                            command.ExecuteNonQuery();

                        }
                        catch (Exception ex)
                        {
                            //successLabel.Text = "An error occurred: " + ex.Message;

                        }
                    }
                }
            }
            Response.Redirect("Orders.aspx");
        }
    }
}