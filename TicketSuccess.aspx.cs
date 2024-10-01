using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReaVaya_Bus_System
{
    public partial class TicketSuccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["TicketNumber"] == null)
                {
                    IDLabel.Text = GenerateRandomNumberString("30284");
                    Session["TicketNumber"] = IDLabel.Text;
                }
                else
                {
                    IDLabel.Text = Session["TicketNumber"].ToString();
                }

                
                if (Session["Price"] != null)
                {
                    amountLabel.Text = Session["Price"].ToString();
                }
                else if (Request.QueryString["price"] != null)
                {
                    amountLabel.Text = Request.QueryString["price"];
                }
               
             
            }
        }

        protected void RedirectButton_Click(object sender, EventArgs e)
        {
            if (Session["LoggedInUser"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string origin = Request.QueryString["origin"];
                string destination = Request.QueryString["destination"];
                string price = Request.QueryString["price"];
                Response.Redirect($"Ticket.aspx?origin={origin}&destination={destination}&price={price}");
            }
        }

        public string GenerateRandomNumberString(string matchString)
        {
            Random random = new Random();
            string randomNumberString;

            do
            {
                randomNumberString = GenerateRandomDigits(random, 5); // 5-digit string
            }
            while (randomNumberString == matchString);

            return randomNumberString;
        }

        private string GenerateRandomDigits(Random random, int length)
        {
            string digits = string.Empty;
            for (int i = 0; i < length; i++)
            {
                digits += random.Next(0, 10).ToString();
            }
            return digits;
        }

    }
}