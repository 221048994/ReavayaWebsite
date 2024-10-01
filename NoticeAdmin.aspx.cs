using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReaVaya_Bus_System
{
    public partial class NoticeAdmin : System.Web.UI.Page
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
            // Load notifications from the database for each tab and bind to repeaters
            LoadNotificationsForType("General", rptNotificationsGeneral);
            LoadNotificationsForType("Driver", rptNotificationsDriver);
            LoadNotificationsForType("Users", rptNotificationsUsers);
        }

        private void LoadNotificationsForType(string type, Repeater repeater)
        {
            List<Notification> notifications = GetNotificationsByType(type);
            repeater.DataSource = notifications;
            repeater.DataBind();
        }

        private void SaveNotificationToDatabase(string type, string title, string message)
        {
            string email = (string)Session["LoggedInUser"]; // Assuming this retrieves the logged-in user's email
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            DateTime date = DateTime.Now;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Include the Email column in the INSERT statement
                string query = "INSERT INTO [Notification] (Type, Title, Message, DateCreated) VALUES (@Type, @Title, @Message, @DateCreated)";
                SqlCommand command = new SqlCommand(query, connection);

                command.Parameters.AddWithValue("@Type", type);
                command.Parameters.AddWithValue("@Title", title);
                command.Parameters.AddWithValue("@Message", message);
                command.Parameters.AddWithValue("@DateCreated", date);
                command.Parameters.AddWithValue("@Email", email);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        protected void btnSendNotificationGeneral_Click(object sender, EventArgs e)
        {
            string title = txtTitleGeneral.Text.Trim();
            string message = txtMessageGeneral.Text.Trim();

            
                SaveNotificationToDatabase("General", title, message);
                txtTitleGeneral.Text = string.Empty;
                txtMessageGeneral.Text = string.Empty;
            
            LoadNotifications();
        }

        protected void btnSendNotificationDriver_Click(object sender, EventArgs e)
        {
            // Save Driver notification to the database
            SaveNotificationToDatabase("Driver", txtTitleDriver.Text.Trim(), txtMessageDriver.Text.Trim());
            LoadNotifications();
            txtTitleDriver.Text = string.Empty;
            txtMessageDriver.Text = string.Empty;
        }

        protected void btnSendNotificationUsers_Click(object sender, EventArgs e)
        {
            // Save Users notification to the database
            SaveNotificationToDatabase("Users", txtTitleUsers.Text, txtMessageUsers.Text);
            LoadNotifications();
            txtTitleUsers.Text = string.Empty;
            txtMessageUsers.Text = string.Empty;
        }


        public List<Notification> GetNotificationsByType(string type)
        {
            List<Notification> notifications = new List<Notification>();
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT NotificationId, Type, Title, Message, DateCreated FROM Notification WHERE Type = @Type ORDER BY DateCreated DESC";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Type", type);

                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Notification notification = new Notification
                            {
                                ID = Convert.ToInt32(reader["NotificationId"]),
                                Title = reader["Title"].ToString(),
                                Message = reader["Message"].ToString(),
                                DateCreated = Convert.ToDateTime(reader["DateCreated"])
                            };
                            notifications.Add(notification);
                        }
                    }
                }
            }

            return notifications;
        }
    }

    public class Notification
    {
        public int ID { get; set; }
        public string Title { get; set; }
        public string Message { get; set; }
        public DateTime DateCreated { get; set; }
    }
}
