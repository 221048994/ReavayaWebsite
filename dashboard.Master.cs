using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReaVaya_Bus_System
{
    public partial class dashboard : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadNotifications();
                Username.Text = getUserCredentials(Session["LoggedInUser"].ToString());
            }
        }

        private void LoadNotifications()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Title, Message, DateCreated FROM Notification WHERE Type = 'Users'";
                SqlCommand cmd = new SqlCommand(query, conn);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    // Bind the reader to the Repeater control
                    NotificationRepeater.DataSource = reader;
                    NotificationRepeater.DataBind();

                    // Get the notification count
                    reader.Close();
                    query = "SELECT COUNT(*) FROM Notification WHERE Type = 'Users'";
                    cmd = new SqlCommand(query, conn);
                    int notificationCount = (int)cmd.ExecuteScalar();

                    // Update the notification count label
                    NotificationCount.Text = notificationCount.ToString();
                }
                catch (Exception ex)
                {
                    // Handle the exception
                }
            }
        }

        public string getUserCredentials(string email)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            string query = "SELECT Name, Surname FROM [User] WHERE Email = @email";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Email", email);

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        string userName = reader.GetString(0) + " " + reader.GetString(1);
                        return userName;
                    }
                }
            }

            return "";
        }
    }
}
