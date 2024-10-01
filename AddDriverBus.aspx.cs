using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReaVaya_Bus_System
{
    public partial class AddDriverBus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRecentAdmins();
                LoadRecentDrivers();
                LoadRecentBuses();
            }
        }

        protected void AddAdminButton_Click(object sender, EventArgs e)
        {
            string name = adminName.Text;
            string surname = adminSurname.Text;
            string email = adminEmail.Text;
            string contact = adminContact.Text;

            if (!IsValidEmail(email))
            {
                addAdminStatus.Text = "Invalid email format!";
                return;
            }

            if (!IsValidContactNumber(contact))
            {
                addAdminStatus.Text = "Contact number must be exactly 10 digits!";
                return;
            }

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO [User] (Name, Surname, Email, Password, UserType, ContactInfo) VALUES (@Name, @Surname, @Email, @Password, @UserType, @ContactInfo)", con);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Surname", surname);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", email); // Placeholder, you should hash it
                cmd.Parameters.AddWithValue("@UserType", 3);
                cmd.Parameters.AddWithValue("@ContactInfo", contact);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            LoadRecentAdmins();
            addAdminStatus.Text = "Admin added successfully!";
        }

        protected void AddDriverButton_Click(object sender, EventArgs e)
        {
            string name = driverName.Text;
            string surname = driverSurname.Text;
            string email = driverEmail.Text;
            string contact = driverContact.Text;
            string license = driverLicense.Text.Trim();

            if (!IsValidEmail(email))
            {
                addDriverStatus.Text = "Invalid email format!";
                return;
            }

            if (!IsValidContactNumber(contact))
            {
                addDriverStatus.Text = "Contact number must be exactly 10 digits!";
                return;
            }

            if (!Regex.IsMatch(license, @"^[A-Za-z0-9]{12}$"))
            {
                addDriverStatus.Text = "Driver's license must contain exactly 12 alphanumeric characters!";
                return;
            }

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO [User] (Name, Surname, Email, Password, UserType, ContactInfo, LicenseNumber) VALUES (@Name, @Surname, @Email, @Password, @UserType, @ContactInfo, @LicenseNumber)", con);
                SqlCommand stats = new SqlCommand("INSERT INTO [DriverStatus] (DriverEmail, Status) VALUES (@DriverEmail,@Status)", con);
                stats.Parameters.AddWithValue("@DriverEmail", email);
                stats.Parameters.AddWithValue("@Status", "Offline");
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Surname", surname);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", email);
                cmd.Parameters.AddWithValue("@UserType", 2);
                cmd.Parameters.AddWithValue("@ContactInfo", contact);
                cmd.Parameters.AddWithValue("@LicenseNumber", license);
                con.Open();
                cmd.ExecuteNonQuery();
                stats.ExecuteNonQuery();
                con.Close();
            }

            LoadRecentDrivers();
            addDriverStatus.Text = "Driver added successfully!";
            addDriverStatus.Style["color"] = "green";

        }

        protected void AddBusButton_Click(object sender, EventArgs e)
        {
            string numberPlate = busNumber.Text;
            string condition = busCondition.Text;
            string type = busType.SelectedValue;

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO [Bus] (Condition, Type, NumberPlate) VALUES (@Condition, @Type, @NumberPlate)", con);
                cmd.Parameters.AddWithValue("@Condition", condition);
                cmd.Parameters.AddWithValue("@Type", type);
                cmd.Parameters.AddWithValue("@NumberPlate", numberPlate);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            LoadRecentBuses();
            addBusStatus.Text = "Bus added successfully!";
        }

        private void LoadRecentAdmins()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT TOP 5 Name, Surname, Email FROM [User] WHERE UserType = 3 ORDER BY UserID DESC", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                adminRepeater.DataSource = dt;
                adminRepeater.DataBind();
            }
        }

        private void LoadRecentDrivers()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT TOP 5 Name, Surname, Email FROM [User] WHERE UserType = 2 ORDER BY UserID DESC", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                driverRepeater.DataSource = dt;
                driverRepeater.DataBind();
            }
        }

        private void LoadRecentBuses()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT TOP 5 NumberPlate, Condition, Type FROM [Bus] ORDER BY BusID DESC", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                busRepeater.DataSource = dt;
                busRepeater.DataBind();
            }
        }

        protected void adminRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteAdmin")
            {
                string email = Convert.ToString(e.CommandArgument);
                DeleteAdmin(email);
                LoadRecentAdmins();
            }
        }

        protected void driverRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteDriver")
            {
                string email = Convert.ToString(e.CommandArgument);
                DeleteDriver(email);
                LoadRecentDrivers();
            }
        }

        protected void busRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteBus")
            {
                string busId = Convert.ToString(e.CommandArgument);
                DeleteBus(busId);
                LoadRecentBuses();
            }
        }

        private void DeleteAdmin(string email)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM [User] WHERE Email = @Email", con);
                cmd.Parameters.AddWithValue("@Email", email);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        private void DeleteDriver(string email)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM [User] WHERE Email = @Email", con);
                cmd.Parameters.AddWithValue("@Email", email);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        private void DeleteBus(string busId)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM [Bus] WHERE NumberPlate = @NumberPlate", con);
                cmd.Parameters.AddWithValue("@NumberPlate", busId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        private bool IsValidEmail(string email)
        {
            string emailPattern = @"^[^@\s]+@[^@\s]+\.[^@\s]+$";
            return Regex.IsMatch(email, emailPattern);
        }
        // Contact number validation method
        private bool IsValidContactNumber(string contact)
        {
            return contact.Length == 10 && contact.All(char.IsDigit);
        }
    }
}