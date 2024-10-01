using iTextSharp.text.pdf;
using iTextSharp.text;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReaVaya_Bus_System
{
    public partial class Ticket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                    if (Session["Origin"] != null && Session["Destination"] != null && Session["Price"] != null)
                    {
                        TicketNo.Text = Session["TicketNumber"].ToString();
                        DateTime date = DateTime.UtcNow;
                        Date.Text = date.ToString("yyyy-MM-dd");
                        DateTime time = DateTime.Now;
                        Time.Text = time.ToString("HH:mm");
                        From.Text = Session["Origin"].ToString();
                        To.Text = Session["Destination"].ToString();
                        Price.Text = "Ticket Price R" + Session["Price"].ToString();
                        Barcode.Text = "1 234 345 66 8899";
                    }
                    else if (Request.QueryString["origin"] != null && Request.QueryString["destination"] != null && Request.QueryString["price"] != null)
                    {
                        TicketNo.Text = Session["TicketNumber"].ToString();
                        DateTime date = DateTime.UtcNow;
                        Date.Text = date.ToString("yyyy-MM-dd");
                        DateTime time = DateTime.Now;
                        Time.Text = time.ToString("HH:mm");
                        From.Text = Request.QueryString["origin"];
                        To.Text = Request.QueryString["destination"];
                        Price.Text = "Ticket Price R" + Request.QueryString["price"];
                        Barcode.Text = "1 234 345 66 8899";
                    }
                    
                }
            
        }

        protected void GeneratePDFButton_Click(object sender, EventArgs e)
        {
            using (MemoryStream memoryStream = new MemoryStream())
            {
                Document document = new Document();
                PdfWriter writer = PdfWriter.GetInstance(document, memoryStream);
                document.Open();

                // Add the content
                PdfPTable table = new PdfPTable(2);
                table.WidthPercentage = 100;

                PdfPCell cell = new PdfPCell(new Phrase("Rea Vaya Bus Ticket"));
                cell.Colspan = 2;
                cell.HorizontalAlignment = Element.ALIGN_CENTER;
                cell.BackgroundColor = new BaseColor(30, 144, 255);
                cell.Padding = 10;
                table.AddCell(cell);

                table.AddCell("No.:");
                table.AddCell(TicketNo.Text);

                table.AddCell("Date:");
                table.AddCell(Date.Text);

                table.AddCell("Time:");
                table.AddCell(Time.Text);

                table.AddCell("From:");
                table.AddCell(From.Text);

                table.AddCell("Destination:");
                table.AddCell(To.Text);

                table.AddCell("Barcode: ");
                table.AddCell(Barcode.Text);

                document.Add(table);

                // Add barcode
                iTextSharp.text.Image barcodeImage = iTextSharp.text.Image.GetInstance(Server.MapPath("images/winui-code-32-barcode.png"));
                barcodeImage.ScaleToFit(150f, 50f);
                barcodeImage.Alignment = Element.ALIGN_RIGHT;
                document.Add(barcodeImage);

                document.Close();

                byte[] bytes = memoryStream.ToArray();
                memoryStream.Close();

                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("Content-Disposition", "attachment; filename=ReaVayaBusTicket.pdf");
                Response.Buffer = true;
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.BinaryWrite(bytes);
                Response.End();
            }
        }

        protected void Trackbus_Click(object sender, EventArgs e)
        {
                string origin = Request.QueryString["origin"];
                string destination = Request.QueryString["destination"];
                Response.Redirect($"TrackBusFromTicket.aspx?origin={origin}&destination={destination}"); 
        }
    }
}