<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="Ticket.aspx.cs" Inherits="ReaVaya_Bus_System.Ticket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Rea Vaya Bus Ticket</title>
    <link href="css/custom2.css" rel="stylesheet">
    <style>
        .ticket {
            width: 600px;
            height: 350px;
            border: 2px solid #000;
            margin: 20px auto;
            padding: 20px;
            position: relative;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }
        .ticket-header {
            background-color: #1E90FF;
            color: #fff;
            padding: 10px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
        }
        .ticket-content {
            padding: 10px;
            display: flex;
            justify-content: space-between;
        }
        .ticket-content label {
            display: block;
            margin: 5px 0;
        }
        .ticket-footer {
            position: absolute;
            bottom: 20px;
            left: 20px;
        }
        .barcode {
            text-align: center;
            margin-top: 10px;
        }
        .barcode img {
            display: block;
            margin: 0 auto;
        }
        .seat-number {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: #FF4500;
            color: #fff;
            padding: 10px;
            font-size: 24px;
            font-weight: bold;
        }
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        .price-label {
            font-size: 24px;
            color: green;
            font-weight: bold;
        }
        body {
            background-color: #f5f5f5;
            font-family: 'Poppins', sans-serif;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
    </style>

<body>
    
        <main>
            <section>
                <div class="container">
                    <div class="ticket">
                        <div class="ticket-header">
                            <asp:Image ID="ReaVayaLogo" runat="server" src="images/Rea_Vaya_logo.svg.png"
 Style="height: 50px; vertical-align: middle;" /> Rea Vaya Bus Ticket
                        </div>
                        <div class="seat-number">
                            <asp:Label ID="SeatNumberLabel" runat="server" Text="1A"></asp:Label>
                        </div>
                        <div class="ticket-content">
                            <div>
                                <label>Ticket No. <asp:Label ID="TicketNo" runat="server" Text="Label"></asp:Label></label>                                    
                                <label>Date: <asp:Label ID="Date" runat="server" Text="Label"></asp:Label></label>
                                <label>Time: <asp:Label ID="Time" runat="server" Text="Label"></asp:Label></label>
                                <label>From: <asp:Label ID="From" runat="server" Text="Label"></asp:Label></label>
                                <label>Destination: <asp:Label ID="To" runat="server" Text="Label"></asp:Label></label>
                            </div>
                            <div>
                                <asp:Label ID="Price" runat="server" CssClass="price-label" Text="R0.00"></asp:Label>
                            </div>
                        </div>
                        <div class="barcode">
                            <asp:Image ID="BarcodeImage" runat="server" src="images/winui-code-32-barcode.png" Style="height: 50px;" Width="100px" />
                            <asp:Label ID="Barcode" runat="server" Text="1 234 345 66 8899"></asp:Label>
                        </div>
                    </div>
                    <div class="button-container">
                        <asp:Button ID="GeneratePDFButton" runat="server" Text="Get PDF" CssClass="btn btn-primary" OnClick="GeneratePDFButton_Click" />
                    </div>
                    <div class="button-container">
                        <asp:Button ID="Trackbus" runat="server" Text="Track Bus" CssClass="btn btn-primary" OnClick="Trackbus_Click" />
                    </div>
                </div>
            </section>
        </main>
    
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js" integrity="sha256-Zr3vByTlMGQhvMfgkQ5BtWRSKBGa2QlspKYJnkjZTmo=" crossorigin="anonymous"></script>
    <script src="js/custom.js"></script>
</body>
</asp:Content>
