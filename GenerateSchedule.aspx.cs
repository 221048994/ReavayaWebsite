using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReaVaya_Bus_System
{
    public partial class GenerateSchedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDrivers();
                LoadRoutes();
                LoadBuses();
                LoadScheduleHistory();  // Load schedule history on page load
            }
        }
        private void LoadDrivers()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT Email, Name, Surname FROM [User] WHERE UserType = 2", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                driverDropdown.DataSource = dt;
                driverDropdown.DataTextField = "Name";
                driverDropdown.DataValueField = "Email";
                driverDropdown.DataBind();

               // Add "Select Bus" as the first item
        driverDropdown.Items.Insert(0, new ListItem("Select Driver", ""));
            }
        }

        private void LoadRoutes()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT Route_No, Description FROM [Route]", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                routeDropdown.DataSource = dt;
                routeDropdown.DataTextField = "Description";
                routeDropdown.DataValueField = "Route_No";
                routeDropdown.DataBind();

                // Add "Select Bus" as the first item
        routeDropdown.Items.Insert(0, new ListItem("Select Route", ""));
            }
        }

        private void LoadBuses()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT BusID, NumberPlate FROM [Bus]", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                busDropdown.DataSource = dt;
                busDropdown.DataTextField = "NumberPlate";
                busDropdown.DataValueField = "BusID";
                busDropdown.DataBind();

                // Add "Select Bus" as the first item
        busDropdown.Items.Insert(0, new ListItem("Select Bus", ""));
            }
        }

        protected void GenerateScheduleButton_Click(object sender, EventArgs e)
        {
            if (driverDropdown == null || routeDropdown == null || busDropdown == null)
            {
                statusLabel.Text = "Error: Dropdown controls are not initialized.";
                return;
            }

            if (string.IsNullOrEmpty(driverDropdown.SelectedValue) || string.IsNullOrEmpty(routeDropdown.SelectedValue) || string.IsNullOrEmpty(busDropdown.SelectedValue))
            {
                statusLabel.Text = "Error: Please select valid options for driver, route, and bus.";
                return;
            }

            // Check if startDateInput and endDateInput are not empty
            if (string.IsNullOrEmpty(startDateInput.Text) || string.IsNullOrEmpty(endDateInput.Text))
            {
                statusLabel.Text = "Error: Please enter valid start and end dates.";
                return;
            }

            string driverEmail = driverDropdown.SelectedValue;
            string routeNo = routeDropdown.SelectedValue;
            string busID = busDropdown.SelectedValue;
            string tier = tierDropdown.SelectedValue;
            DateTime startDate, endDate;

            try
            {
                startDate = Convert.ToDateTime(startDateInput.Text);
                endDate = Convert.ToDateTime(endDateInput.Text);

                // Ensure end date is not before start date
                if (endDate < startDate)
                {
                    statusLabel.Text = "Error: End date cannot be before start date.";
                    return;
                }
            }
            catch (Exception ex)
            {
                statusLabel.Text = "Error: Invalid input format. Please check the date values.";
                return;
            }

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO [Schedule] (DriverEmail, Route_No, BusID, StartDate, EndDate, Tier) VALUES (@DriverEmail, @Route_No, @BusID, @StartDate, @EndDate, @Tier)", con);
                cmd.Parameters.AddWithValue("@DriverEmail", driverEmail);
                cmd.Parameters.AddWithValue("@Route_No", routeNo);
                cmd.Parameters.AddWithValue("@BusID", busID);
                cmd.Parameters.AddWithValue("@StartDate", startDate);
                cmd.Parameters.AddWithValue("@EndDate", endDate);
                cmd.Parameters.AddWithValue("@Tier", tier);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            statusLabel.Text = "<b>Schedule generated successfully!</b>";
            statusLabel.ForeColor = System.Drawing.Color.Green;


        }

        private List<string> GenerateTimeSlots(TimeSpan start, TimeSpan end, int intervalMinutes)
        {
            List<string> slots = new List<string>();
            for (TimeSpan time = start; time <= end; time = time.Add(new TimeSpan(0, intervalMinutes, 0)))
            {
                slots.Add(time.ToString(@"hh\:mm"));
            }
            return slots;
        }

        private void LoadScheduleHistory()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            string query = @"
    SELECT 
        U.Name + ' ' + U.Surname AS DriverName, 
        R.Description AS RouteName, 
        B.NumberPlate AS BusNumber, 
        S.StartDate, 
        S.EndDate, 
        S.Tier
    FROM 
        [Schedule] S
    JOIN 
        [User] U ON S.DriverEmail = U.Email
    JOIN 
        [Route] R ON S.Route_No = R.Route_No
    JOIN 
        [Bus] B ON S.BusID = B.BusID;";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    rptSchedules.DataSource = reader;
                    rptSchedules.DataBind();
                }
            }
        }
    }
}