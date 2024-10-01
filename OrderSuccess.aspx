<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="OrderSuccess.aspx.cs" Inherits="ReaVaya_Bus_System.OrderSuccess" %>

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
                    <h3 class="card-title text-success">Order Successful!</h3>
                    <p class="card-text">
                        Your card with Serial Number: <strong><asp:Label ID="serialNumberLabel" runat="server"></asp:Label></strong> 
                        has been ordered and loaded with R<strong><asp:Label ID="amountLabel" runat="server"></asp:Label></strong>. 
                        The new card can be collected at <strong><asp:Label ID="CollectionStation" runat="server"></asp:Label></strong> within 7 days.
                    </p>
                    <asp:Button ID="redirectButton" CssClass="btn btn-primary" runat="server" Text="Okay" OnClick="RedirectButton_Click" />
                </div>
            </div>
        </div>
    </section>
</main>
</asp:Content>
