using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace ReaVaya_Bus_System
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedInUser"] != null)
            {
                
                string email = (string)Session["LoggedInUser"];

                int usertype = getUserCredentials(email);

                if (usertype.Equals(1))
                {
                    normalHome.Visible = false;
                    commuterHome.Visible = true;
                    driverHome.Visible = false;
                    adminHome.Visible = false;
                }

                else if (usertype.Equals(2))
                {
                    normalHome.Visible = false;
                    commuterHome.Visible = false;
                    driverHome.Visible = true;
                    adminHome.Visible = false;
                }

                else if (usertype.Equals(3))
                {
                    normalHome.Visible = false;
                    commuterHome.Visible = false;
                    driverHome.Visible = false;
                    adminHome.Visible = true;
                }
            }
            else
            {

                normalHome.Visible = true;
                commuterHome.Visible = false;
                driverHome.Visible = false;
                adminHome.Visible = false;
            }
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
    }
}