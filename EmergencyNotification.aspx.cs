using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReaVaya_Bus_System
{
    public partial class EmergencyNotification : System.Web.UI.Page
    {
        private string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEmergenceNotifications();
            }
        }

        private void LoadEmergenceNotifications()
        {
            DataTable dtEmergence = GetEmergenceNotifications();
            if (dtEmergence.Rows.Count > 0)
            {
                rptEmergence.DataSource = dtEmergence;
                rptEmergence.DataBind();
                pnlNotifications.Visible = true;
            }
            else
            {
                pnlNotifications.Visible = false;
            }
        }

        private DataTable GetEmergenceNotifications()
        {
            DataTable dtEmergency = new DataTable();
            string query = "SELECT EmergencyID, Type, Message, Driver, date_sent FROM Emergency ORDER BY EmergencyID DESC";


            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dtEmergency);
                    }
                }
            }

            return dtEmergency;
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            LoadEmergenceNotifications();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("getAuthorities.aspx");
        }

        protected void rptEmergence_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            // Check if the item is a data item (not header, footer, etc.)
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Find the labels by their ID
                Label lblDriver = (Label)e.Item.FindControl("Driver");
                Label lblDate = (Label)e.Item.FindControl("Date");
                Label lblType = (Label)e.Item.FindControl("TypeLabel"); // Ensure you have this label in your ItemTemplate
                Label lblContacts = (Label)e.Item.FindControl("ContactsLabel"); // Ensure you have this label in your ItemTemplate


                lblDate.Text = DateTime.Now.ToString(); // Replace with actual date from your data source

                // Get the notice type and relevant contacts
                string noticeType = lblType.Text; // Assuming you have the TypeLabel bound to notice type
                lblContacts.Text = GetRelevantContacts(noticeType); // Set the relevant contacts
            }
        }

        private string GetRelevantContacts(string noticeType)
        {
            switch (noticeType.ToLower())
            {
                case "breakdown":
                    return "Paramedics: 123-456-7890, Towing Service: 987-654-3210";
                case "accident":
                    return "Paramedics: 123-456-7890, Police: 111-222-3333";
                case "medical emergency":
                    return "Paramedics: 123-456-7890";
                // Add more cases for different notice types
                default:
                    return "No relevant contacts available.";
            }
        }
    }
}
