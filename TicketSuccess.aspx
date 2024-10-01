<%@ Page Title="Payment Successful" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="TicketSuccess.aspx.cs" Inherits="ReaVaya_Bus_System.TicketSuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
                .card {
    font-family: Arial, sans-serif;
    background-color: #FCFBF4;
    padding: 20px;
    margin-bottom: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.welcome-card h1 {
    color: red;
    font-size: 32px;
}

.notice-card h3 {
    color: blue;
    font-size: 24px;
}

.notification-item {
    background-color:floralwhite;
    border-left: #dc3545;
    margin-bottom: 10px;
    margin-left: 80px;
    margin-right:80px;
    padding: 15px;
    border-radius: 20px;
    color:black;
}

.notification-item h4 {
    color: red;
    font-size: 20px;
}

.notification-item p {
    font-size: 16px;
}

.notification-item small {
    color: gray;
    font-size: 14px;
}
    </style>
        <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Payment Success</title>
   
    <link href="css/custom2.css" rel="stylesheet">

<body>
   
        <main>
            <section>
                <div class="card">
                    <div class="notification-item">
                        <div class="card-body text-center">
                            <h3 class="card-title text-success">Purchase Successful!</h3>
                            <p class="card-text">
                                Your Ticket with ID: <strong><asp:Label ID="IDLabel" runat="server"></asp:Label></strong> 
                                has been purchased for R<strong><asp:Label ID="amountLabel" runat="server"></asp:Label></strong>. 
                                The Ticket can be download and will be scanned at the bus station for use. Also note that the ticket is valid for 7 days.
                            </p>
                            <asp:Button ID="redirectButton" CssClass="btn btn-primary" runat="server" Text="View PDF" OnClick="RedirectButton_Click" />
                        </div>
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
