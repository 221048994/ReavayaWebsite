using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.DataVisualization.Charting;


namespace ReaVaya_Bus_System
{
    public partial class TicketReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // Generate Report button click event
        protected void GenerateReportButton_Click(object sender, EventArgs e)
        {
            string startDate = StartDate.Text;
            string endDate = EndDate.Text;

            if (!string.IsNullOrEmpty(startDate) && !string.IsNullOrEmpty(endDate))
            {
                GenerateReport(DateTime.Parse(startDate), DateTime.Parse(endDate));
            }
            else
            {
                // Default report if no date range is provided
                GenerateReport(null, null);
            }
        }

        private void GenerateReport(DateTime? startDate, DateTime? endDate)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_GenerateTicketReport", con); // Stored Procedure for the report
                cmd.CommandType = CommandType.StoredProcedure;

                if (startDate.HasValue)
                    cmd.Parameters.AddWithValue("@StartDate", startDate);
                if (endDate.HasValue)
                    cmd.Parameters.AddWithValue("@EndDate", endDate);

                con.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    // Summary Report
                    if (reader.Read())
                    {
                        TotalTicketsLabel.Text = reader["TotalTickets"].ToString();
                        UsedTicketsLabel.Text = reader["UsedTickets"].ToString();
                        TotalIncomeLabel.Text = reader["TotalIncome"].ToString();
                    }

                    // Detailed Report
                    if (reader.NextResult())
                    {
                        DataTable dt = new DataTable();
                        dt.Load(reader);
                        TicketsGridView.DataSource = dt;
                        TicketsGridView.DataBind();
                    }

                    if (!reader.NextResult())
                    {
                        reader.Close();


                        // 3. Boarding Time Analysis as a separate query
                        string boardingTimeQuery = @"
                                               SELECT 
                                               DATEPART(HOUR, boardingTime) AS Hour, 
                                               COUNT(*) AS Count
                                               FROM Ticket
                                               WHERE Status = 'Boarded'
                                               GROUP BY DATEPART(HOUR, boardingTime)
                                               ORDER BY Hour";

                        SqlCommand boardingTimeCmd = new SqlCommand(boardingTimeQuery, con);

                        using (SqlDataReader rreader = boardingTimeCmd.ExecuteReader())
                        {
                            DataTable dtBoardingTime = new DataTable();
                            dtBoardingTime.Load(rreader);

                            if (dtBoardingTime.Rows.Count > 0)
                            {
                                System.Diagnostics.Debug.WriteLine("Boarding time data found.");

                                foreach (DataRow row in dtBoardingTime.Rows)
                                {
                                    System.Diagnostics.Debug.WriteLine($"Hour: {row["Hour"]}, Count: {row["Count"]}");
                                }

                                // Bind to chart
                                BoardingTimeChart.DataSource = dtBoardingTime;
                                BoardingTimeChart.Series["BoardingTimes"].XValueMember = "Hour";  // X-axis: Status (Boarded/Un-boarded)
                                BoardingTimeChart.Series["BoardingTimes"].YValueMembers = "Count";  // Y-axis: Number of tickets
                                BoardingTimeChart.Series["BoardingTimes"].IsValueShownAsLabel = true;  // Show labels on pie chart
                                BoardingTimeChart.Series["BoardingTimes"].Label = "#PERCENT{P0} (#VAL)";  // Show percentage and ticket count
                                BoardingTimeChart.Series["BoardingTimes"].ToolTip = "Tickets: #VAL";  // Show tooltip with number of tickets

                                BoardingTimeChart.DataBind();
                            }
                            else
                            {
                                System.Diagnostics.Debug.WriteLine("No boarding time data found.");
                            }
                        }
                    }
                }
            }



        }
    }
}
