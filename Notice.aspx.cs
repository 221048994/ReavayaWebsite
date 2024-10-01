using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ReaVaya_Bus_System
{
    public partial class Notice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public List<GetNotice> GetNoticeByType(string typeGeneral, string typeUser)
        {
            List<GetNotice> notices = new List<GetNotice>();

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            string query = "SELECT Top 5 Type,  Title, Message, DateCreated FROM [Notification] WHERE Type = @TypeGeneral OR Type = @TypeUser";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@TypeGeneral", typeGeneral);
                    command.Parameters.AddWithValue("@TypeUser", typeUser);

                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        while (reader.Read())
                        {
                            GetNotice notice = new GetNotice
                            {
                                Title = reader.GetString(0),
                                Message = reader.GetString(1),
                                DateCreated = reader.GetString(2),
                            };
                            notices.Add(notice);
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle the exception (logging, displaying a message, etc.)
                        //successLabel.Text = "An error occurred while retrieving card information: " + ex.Message;
                    }
                }
            }

            return notices;
        }

        public class GetNotice
        {
            public string Title { get; set; }
            public string Message { get; set; }
            public string DateCreated { get; set; }
        }
    }
}