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
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadNotifications();
            }

        }

        private void LoadNotifications()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Title, Message, DateCreated FROM Notification WHERE Type = 'Users' ORDER BY DateCreated DESC";
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
                    Session["Notification"] = notificationCount.ToString();
                }
                catch (Exception ex)
                {
                    // Handle the exception
                }
            }
        }
    }
}