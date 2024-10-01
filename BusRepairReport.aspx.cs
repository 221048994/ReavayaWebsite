using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Web.UI;

namespace ReaVaya_Bus_System
{
    public partial class BusRepairReport : System.Web.UI.Page
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
            string query = @"SELECT TOP 10 Type, COUNT(*) AS EmergencyCount
                             FROM dbo.Emergency
                             GROUP BY Type
                             ORDER BY EmergencyCount DESC;";

            List<string> emergencyTypes = new List<string>();
            List<int> emergencyCounts = new List<int>();

            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    emergencyTypes.Add(reader["Type"].ToString());
                    emergencyCounts.Add(Convert.ToInt32(reader["EmergencyCount"]));
                }
                reader.Close();
            }

            // Serialize the data to pass to JavaScript
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            string XAxisLabels = serializer.Serialize(emergencyTypes);
            string YAxisData = serializer.Serialize(emergencyCounts);

            // Assign serialized data to hidden fields
            hiddenXAxisLabels.Value = XAxisLabels;
            hiddenYAxisData.Value = YAxisData;
        }
    }
}