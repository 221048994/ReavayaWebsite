using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReaVaya_Bus_System
{
    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Assuming you have a method to get user details from session or database
                LoadUserProfile();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string currentEmail = txtCurrentEmail.Text;
            string currentPassword = txtCurrentPassword.Text;
            string newEmail = txtNewEmail.Text;
            string newPassword = txtNewPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

            if (newPassword != confirmPassword)
            {
                lblMessage.Text = "New Password and Confirm Password do not match.";
                return;
            }

            // Validate current password
            if (ValidateCurrentPassword(currentEmail, currentPassword))
            {
                // Update email and password in the database
                UpdateUserProfile(currentEmail, newEmail, newPassword);
                lblMessage.Text = "Profile updated successfully.";
            }
            else
            {
                lblMessage.Text = "Current password is incorrect.";
            }
        }

        private void UpdateUserProfile(string currentEmail, string newEmail, string newPassword)
        {
            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("UPDATE [User] SET Email = @NewEmail, Password = @NewPassword WHERE Email = @CurrentEmail", conn);
                cmd.Parameters.AddWithValue("@NewEmail", newEmail);
                cmd.Parameters.AddWithValue("@NewPassword", newPassword);
                cmd.Parameters.AddWithValue("@CurrentEmail", currentEmail);

                cmd.ExecuteNonQuery();
            }
        }

        private void LoadUserProfile()
        {
            // Assuming the user's email or ID is stored in the session
            string userEmail = Session["LoggedInUser"].ToString(); // or use user ID
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Name, Surname, Email FROM [User] WHERE Email = @Email";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", userEmail);

                conn.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        txtName.Text = reader["Name"].ToString();
                        txtSurname.Text = reader["Surname"].ToString();
                        txtCurrentEmail.Text = reader["Email"].ToString();
                    }
                    else
                    {
                        lblMessage.Text = "User not found.";
                    }
                }
            }
        }

        private bool ValidateCurrentPassword(string email, string currentPassword)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Password FROM [User] WHERE Email = @Email";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);

                conn.Open();

                string storedPassword = (string)cmd.ExecuteScalar();

                return storedPassword == currentPassword;
            }
        }


    }
}