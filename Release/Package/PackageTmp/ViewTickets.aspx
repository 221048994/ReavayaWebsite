<%@ Page Title="Existing Tickets" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="ViewTickets.aspx.cs" Inherits="ReaVaya_Bus_System.ViewTickets" %>

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

    <div class="container">
        <asp:Repeater ID="TicketRepeater" runat="server">
            <ItemTemplate>
                <div class="ticket">
                    <div class="ticket-header">
                        <asp:Image ID="ReaVayaLogo" runat="server" ImageUrl="~/images/Rea_Vaya_logo.svg.png" Style="height: 50px; vertical-align: middle;" />
                        Rea Vaya Bus Ticket
                    </div>
                    <div class="seat-number">
                        <asp:Label ID="SeatNumberLabel" runat="server" Text='<%# Eval("TicketNumber") %>'></asp:Label>
                    </div>
                    <div class="ticket-content">
                        <div>
                            <label>Ticket No. <asp:Label ID="TicketNo" runat="server" Text='<%# Eval("TicketNumber") %>'></asp:Label></label>                                    
                            <label>Date: <asp:Label ID="Date" runat="server" Text='<%# Eval("Date", "{0:yyyy/MM/dd}") %>'></asp:Label></label>
                            <label>Time: <asp:Label ID="Time" runat="server" Text='<%# Eval("Time") %>'></asp:Label></label>
                            <label>From: <asp:Label ID="From" runat="server" Text='<%# Eval("Origin") %>'></asp:Label></label>
                            <label>Destination: <asp:Label ID="To" runat="server" Text='<%# Eval("Destination") %>'></asp:Label></label>
                        </div>
                        <div>
                            <asp:Label ID="Price" runat="server" CssClass="price-label" Text='<%# Eval("TripAmount", "R{0:N2}") %>'></asp:Label>
                        </div>
                    </div>
                    <div class="barcode">
                        <asp:Image ID="BarcodeImage" runat="server" ImageUrl="~/images/winui-code-32-barcode.png" Style="height: 50px;" Width="100px" />
                        <asp:Label ID="Barcode" runat="server" Text='<%# Eval("TicketNumber") %>'></asp:Label>
                    </div>
                </div>
                <hr />
<hr />
            </ItemTemplate>
        </asp:Repeater>
        
    </div>

    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js" integrity="sha256-Zr3vByTlMGQhvMfgkQ5BtWRSKBGa2QlspKYJnkjZTmo=" crossorigin="anonymous"></script>
    <script src="js/custom.js"></script>
</asp:Content>

