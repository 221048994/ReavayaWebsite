using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReaVaya_Bus_System
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Assuming you have a method to get the current user's information
                var currentUser = GetCurrentUser();
                name.Text = currentUser.Name;
                surname.Text = currentUser.Surname;
                email.Text = currentUser.Email;
                phone.Text = "0" + currentUser.Phone.ToString();
            }
        }

        public void Btn_Email(object sender, EventArgs e)
        {
            changeEmail.Visible = true;
        }

        protected void SaveChangesBtn_Click(object sender, EventArgs e)
        {
            verify.Visible = true;
            string email = Session["LoggedInUser"].ToString();
            if (Password.Text != getUserCredentials(email)[4])
            {
                Password.Text = string.Empty;
                return;
            }

            // Assuming you have a method to update the user's information
            var currentUser = GetCurrentUser();
            currentUser.Email = email.ToString();

            if (!string.IsNullOrEmpty(Password.Text))
            {

            }

            SaveUser(currentUser);
            successLabel.Visible = true;
        }


        private User GetCurrentUser()
        {
            // Implement method to retrieve current user information
            string email = Session["LoggedInUser"].ToString();
            return new User { Name = getUserCredentials(email)[2], Email = getUserCredentials(email)[0], Surname = getUserCredentials(email)[1], Phone = Convert.ToInt32(getUserCredentials(email)[3]) };
        }

        private bool VerifyCurrentPassword(User user, string currentPassword)
        {
            // Implement method to verify the current password
            return user.Password == currentPassword;
        }

        private void SaveUser(User user)
        {
            // Implement method to save updated user information
        }

        public class User
        {
            public string Name { get; set; }
            public string Surname { get; set; }

            public int Phone { get; set; }
            public string Email { get; set; }
            public string Password { get; set; }
        }


        public string[] getUserCredentials(string email)
        {
            string[] credentials = new string[5];
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            string query = "SELECT Email, ContactInfo, Surname, Name, Password FROM [User] WHERE Email = @Email";

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
                        credentials[1] = reader["Surname"].ToString();
                        credentials[2] = reader["Name"].ToString();
                        credentials[3] = reader["ContactInfo"].ToString();
                        credentials[4] = reader["Password"].ToString();
                        return credentials;
                    }
                }
            }

            return null;
        }
    }
}