using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReaVaya_Bus_System
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBusTagOrders();
            }
        }

        private void LoadBusTagOrders()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            string userEmail = Session["LoggedInUser"].ToString();

            string query = "SELECT OrderID, OwnerEmail, CollectionStation, Balance, Date FROM TagOrder WHERE OwnerEmail = @OwnerEmail";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@OwnerEmail", userEmail);
                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        BusTagOrderGridView.DataSource = reader;
                        BusTagOrderGridView.DataBind();
                    }
                }
            }
        }
    }
}