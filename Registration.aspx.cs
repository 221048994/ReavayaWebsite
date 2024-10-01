using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

namespace ReaVaya_Bus_System
{
    public partial class Registration : System.Web.UI.Page
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

        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            string Name = name.Text.Trim();
            string Surname = surname.Text.Trim();
            string Email = email.Text.Trim();
            string Phone = phone.Text.Trim();
            string Password = password.Text.Trim();
            string ConfirmPassword = confirm_password.Text.Trim();
            int UserType = 1;

            if (Password == ConfirmPassword)
            {
                //  Response.Redirect("Login.aspx");


                // Define the connection string
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

                // Define the query
                string query = "INSERT INTO [User] (Name, Surname, Email, ContactInfo, Password, UserType) VALUES (@Name, @Surname, @Email, @ContactInfo, @Password, @UserType)";

                // Execute the query
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Name", Name);
                        command.Parameters.AddWithValue("@Surname", Surname);
                        command.Parameters.AddWithValue("@Email", Email);
                        command.Parameters.AddWithValue("@ContactInfo", Phone);
                        command.Parameters.AddWithValue("@Password", Password);
                        command.Parameters.AddWithValue("@UserType", UserType);

                        try
                        {
                            connection.Open();
                            command.ExecuteNonQuery();
                            
                        }
                        catch (Exception ex)
                        {
                            connection.Close();
                            successLabel.Text = "An error occurred: " + ex.Message;
                            
                        }
                     
                    }
                    connection.Close();
                }

                successLabel.Visible = true;
                System.Threading.Thread.Sleep(1500);
                Response.Redirect("Login.aspx");

            }
            else
            {
                matchLabel.Text = "Passwords do match, please check again....";
                matchLabel.Visible = true;
            }
        }
    }
}