<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="ReloadSuccess.aspx.cs" Inherits="ReaVaya_Bus_System.ReloadSuccess" %>

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
    margin-left: 100px;
    margin-right: 100px;
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

.nav-tabs {
    margin-left: 100px;
    margin-right: 100px;
}
    </style>

    <main>
    <section>
        <div class="container mt-5">
            <div class="card">
                <div class="notification-item">
                    <h3 class="card-title text-success">Payment Successful!</h3>
                    <p class="card-text">
                        Your card with Serial Number: <strong><asp:Label ID="serialNumberLabel" runat="server"></asp:Label></strong> 
                        was loaded with R<strong><asp:Label ID="amountLabel" runat="server"></asp:Label></strong>. 
                        The new balance on the card is R<strong><asp:Label ID="newBalanceLabel" runat="server"></asp:Label></strong>.
                    </p>
                    <asp:Button ID="redirectButton" CssClass="btn btn-primary" runat="server" Text="Okay" OnClick="RedirectButton_Click" />
                </div>
            </div>
        </div>
    </section>
</main>
</asp:Content>
