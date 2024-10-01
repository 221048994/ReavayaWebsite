using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReaVaya_Bus_System
{
    public partial class ValuedCustomerReport : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadChartData();
            }
        }

        private void LoadChartData()
        {
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            string query = @"SELECT TOP 10 TicketOwner, COUNT(*) AS TicketCount
                        FROM dbo.Ticket
                        WHERE Date >= DATEADD(DAY, -30, GETDATE())
                        GROUP BY TicketOwner
                        ORDER BY TicketCount DESC;";

            List<string> customers = new List<string>();
            List<int> ticketCounts = new List<int>();

            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    customers.Add(reader["TicketOwner"].ToString());
                    ticketCounts.Add(Convert.ToInt32(reader["TicketCount"]));
                }
                reader.Close();
            }

            // Serialize the data to pass to JavaScript
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            string XAxisLabels = serializer.Serialize(customers);
            string YAxisData = serializer.Serialize(ticketCounts);
            // Assign serialized data to hidden fields
            hiddenXAxisLabels.Value = XAxisLabels;
            hiddenYAxisData.Value = YAxisData;

        }
    }
}