using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ReaVaya_Bus_System
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedInUser"] != null)
            {
                string email = (string)Session["LoggedInUser"];
                string name = Session["Name"]?.ToString();
                notificationCount.Text = Convert.ToString(getNotificationCount());

                if (!string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(name))
                {
                    int usertype = getUserCredentials(email);

                    switch (usertype)
                    {
                        case 1:
                            username.InnerText = name;
                            SetNavVisibility(normal: false, commuter: true, driver: false, admin: false);
                            break;
                        case 2:
                            driverName.InnerText = name;
                            SetNavVisibility(normal: false, commuter: false, driver: true, admin: false);
                            break;
                        case 3:
                            adminName.InnerText = name;
                            SetNavVisibility(normal: false, commuter: false, driver: false, admin: true);
                            break;
                        default:
                            SetNavVisibility(normal: true, commuter: false, driver: false, admin: false);
                            break;
                    }
                }
                else
                {
                    // If the session or name is missing, revert to normal navigation
                    SetNavVisibility(normal: true, commuter: false, driver: false, admin: false);
                }
            }
            else
            {
                // User is not logged in, show normal navigation
                SetNavVisibility(normal: true, commuter: false, driver: false, admin: false);
            }
        }

        private void SetNavVisibility(bool normal, bool commuter, bool driver, bool admin)
        {
            normalNav.Visible = normal;
            commuterNav.Visible = commuter;
            driverNav.Visible = driver;
            adminNav.Visible = admin;
        }

        protected void btn_Admin_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Home.aspx");
        }

        protected void btn_Driver_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Home.aspx");
        }

        protected void btn_Logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Home.aspx");
        }

        public int getUserCredentials(string email)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            string query = "SELECT Email, UserType FROM [User] WHERE Email = @email";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Email", email);

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        int usertype = (int)reader["UserType"];
                        return usertype;
                    }
                }
            }

            return 0;
        }

        public int getNotificationCount()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            string query = "SELECT COUNT(*) FROM Emergency";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);

                connection.Open();
                int notiCount = (int)command.ExecuteScalar();
                return notiCount;
            }

            return 0;
        }
    }
}