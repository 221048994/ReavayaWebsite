<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookSuccess.aspx.cs" Inherits="ReaVaya_Bus_System.BookSuccess" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Payment Success</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700&display=swap" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha256-mLBIhmBvigTFWPSCtvdu6a76T+3Xyt+K571hupeFLg4=" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <link href="css/custom1.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <main>
            <section>
                <div class="container mt-5">
                    <div class="card">
                        <div class="card-body text-center">
                            <h3 class="card-title text-success">Booking Successful!</h3>
                            <p class="card-text">
                                Your Ticket with ID: <strong><asp:Label ID="IDLabel" runat="server"></asp:Label></strong> 
                                has been Booked for R<strong><asp:Label ID="amountLabel" runat="server"></asp:Label></strong>. 
                                The Ticket can be collected at <strong><asp:Label ID="CollectionStation" runat="server"></asp:Label></strong> within 7 days. Please quote your ticket ID when collecting.
                            </p>
                            <asp:Button ID="redirectButton" CssClass="btn btn-primary" runat="server" Text="Okay" OnClick="RedirectButton_Click" />
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </form>
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js" integrity="sha256-Zr3vByTlMGQhvMfgkQ5BtWRSKBGa2QlspKYJnkjZTmo=" crossorigin="anonymous"></script>
    <script src="js/custom.js"></script>
</body>
</html>
