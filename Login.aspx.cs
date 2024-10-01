using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;


namespace ReaVaya_Bus_System
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public static string HashPassword(string password)
        {
            SHA1 algorithm = SHA1.Create();
            byte[] byteArray = null;
            byteArray = algorithm.ComputeHash(Encoding.Default.GetBytes(password));
            string hashedPassword = "";
            for (int i = 0; i < byteArray.Length - 1; i++)
            {
                hashedPassword += byteArray[i].ToString("x2");
            }
            return hashedPassword;
        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            string emailInput = email.Text.Trim();
            string passwordInput = password.Text.Trim();

            string[] userCredentials = getUserCredentials(emailInput);

            if (userCredentials != null && emailInput == userCredentials[0] && passwordInput == userCredentials[1])
            {
                Session["LoggedInUser"] = emailInput;
                Session["Name"] = userCredentials[2];
                Session["Surname"] = userCredentials[3];
                int ut = Convert.ToInt32(userCredentials[4]);
                if (ut == 1)
                {
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }

            }
            else
            {
                invalidLabel.Text = "Invalid username or password. Please try again.";
                invalidLabel.Visible = true;
            }
        }

        public string[] getUserCredentials(string email)
        {
            string[] credentials = new string[5];
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            string query = "SELECT Email, Password, Name, Surname, UserType FROM [User] WHERE Email = @Email";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Email", email);

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        credentials[0] = reader["Email"].ToString();
                        credentials[1] = reader["Password"].ToString();
                        credentials[2] = reader["Name"].ToString();
                        credentials[3] = reader["Surname"].ToString();
                        credentials[4] = reader["UserType"].ToString();
                        return credentials;
                    }
                }
            }

            return null;
        }
    }
}