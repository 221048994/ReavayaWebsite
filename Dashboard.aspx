<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="ReaVaya_Bus_System.Dashboard" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .card {
    font-family: Arial, sans-serif;
    background-color: #FCFBF4;
    padding: 80px;
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
    margin-top:-40px;
    margin-bottom: 10px;
    padding: 65px;
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

.login-btn {
    background-color: green;
    border-radius: 8px;
    width: 180px;
    height: 40px;
}

.form1 {
    width: 100%;
}

.login-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 20px;
    width: 60vw;
    max-width: 1400px;
    background-color: rgba(255, 255, 255, 0.9);
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.slider_section {
    height: 240px;
    margin-top: 20px;
    padding-bottom: 20px;
}

.detail-box {
    padding-top: -100px;
}

    </style>
     

    <section class="slider_section ">
    <div class="card">
        <div class="row">
            <div class="col-lg-7 col-md-8 mx-auto">
                <div class="detail-box">
                    <h2>
                        Welcome to Rea Vaya <br>
                        Your Reliable Public Transportation System
                    </h2>
                    <p>
                        Enjoy hassle-free travel with our efficient bus services. Plan your journey, track
                        buses in real-time, and experience comfort and convenience with Rea Vaya.
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>
    <div class="card">
    
        <div class="notification-item">
            <h3>Notices</h3>
    <asp:Repeater ID="NotificationRepeater" runat="server">
        <ItemTemplate>
            
                <h4><%# Eval("Title") %></h4>
                <p><%# Eval("Message") %></p>
                <small><%# Eval("DateCreated", "{0:dd/MM/yyyy HH:mm}") %></small>
                <hr />
        </ItemTemplate>
    </asp:Repeater>
            </div>
</div>
</asp:Content>
