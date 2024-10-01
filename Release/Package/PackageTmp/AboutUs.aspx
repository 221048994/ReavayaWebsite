<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="ReaVaya_Bus_System.AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
                        .card {
    font-family: Arial, sans-serif;
    background-color: skyblue;
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
    margin-left: 50px;
    margin-right: 50px;
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

    <section class="about_section layout_padding">
    <div class="card">
        <div class="row">
            <div class="col-md-6">
                <div class="notification-item">
                    <div class="heading_container">
                        <h2>
                            About Us
                        </h2>
                    </div>
                    <p>
                        Rea Vaya is a bus rapid transit (BRT) system in Johannesburg, South Africa.
                        It was launched in 2009 to provide efficient and reliable public transport,
                        reduce traffic congestion, and contribute to environmental sustainability.
                        With dedicated lanes, modern buses, and user-friendly stations, Rea Vaya
                        offers a comfortable and convenient travel experience for residents and
                        visitors alike.
                    </p>
                    <div>
                        <a href="https://reavaya.org.za/">
                            Read More
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="img-box">
                    <img src="images/about-img.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
</section>
</asp:Content>
