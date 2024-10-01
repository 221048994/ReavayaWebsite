<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ReaVaya_Bus_System.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
    body, html {
      margin: 0;
      padding: 0;
      font-family: 'Poppins', sans-serif;
    }
    .container2 {
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      height: 80vh;
    }
    .card {
      width: 80%;
      padding: 20px;
      margin: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
      text-align: center;
    }
    .card h3 {
      margin-bottom: 20px;
      color: #333;
    }
    .admin-options {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-around;
    }
    .option-card {
      width: 45%;
      padding: 20px;
      margin: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
      text-align: center;
      cursor: pointer;
      transition: transform 0.3s;
    }
    .option-card:hover {
      transform: scale(1.05);
    }
    .option-card h4 {
      margin-bottom: 10px;
      color: #00008B;
    }
  </style>

    <div class="about_section layout_padding" id="normalHome" runat="server" visible="true">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <div class="detail-box">
            <div class="heading_container">
              <h2>
                About Us
              </h2>
            </div>
            <p>
                Rea Vaya is a bus rapid transit (BRT) system in Johannesburg, South Africa.
                It was launched in 2009 to provide efficient and affordable public transportation options for residents of Johannesburg.
                Rea Vaya buses run on dedicated lanes, allowing them to bypass traffic congestion and provide faster travel times. 
                The system has helped improve mobility in the city and reduce reliance on private vehicles, contributing to efforts to combat traffic congestion and air pollution.
            </p>
            <a href="">
              Read More
            </a>
          </div>
        </div>
        <div class="col-md-6">
          <div class="img-box">
            <img src="images/i1.jpeg" alt="" >
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- end about section -->

    <!-- Admin home page -->
    <div class="container2" id="adminHome" runat="server" visible="false">
    <div class="card">
      <h3>Admin Home</h3>
      <div class="admin-options">
        <div class="option-card" onclick="navigateTo('manageBusFleet.html')">
          <a href="NoticeAdmin.aspx"><h4>Notice</h4>
          <p>Give notice to drivers and commuters.</p>
            </a>
        </div>
        <div class="option-card" onclick="navigateTo('monitorSystemHealth.html')">
          <a href="AddDriverBus.aspx"><h4>Manage Assignmnet</h4>
          <p>Add Drivers, Admins and Buses.</p>
            </a>
        </div>
        <div class="option-card" onclick="navigateTo('handleBreakdowns.html')">
          <a href="EmergencyNotification.aspx"><h4>Handle Breakdowns & Deploy Replacement Bus</h4>
          <p>Manage breakdowns and dispatch replacement buses.</p>
        </div>
        <div class="option-card" onclick="navigateTo('generateSchedule.html')">
          <a href="GenerateSchedule.aspx"><h4>Generate Schedule for Bus Drivers</h4>
          <p>Create and manage schedules for all bus drivers.</p>
        </div>
      </div>
    </div>
  </div>
    <!-- end admin home -->

    <!-- commuter home -->
    <div class="container2" id="commuterHome" runat="server" visible="false">
    <div class="card">
      <h3>Welcome</h3>
      <div class="admin-options">
        <div class="option-card" onclick="navigateTo('Pricing.aspx')">
          <a href="Pricing.aspx"><h4>Calculate Price</h4></a>
          <p>Get price of trip.</p>
        </div>
        <div class="option-card" onclick="navigateTo('TrackBus.aspx')">
          <a href="TrackBus.aspx"><h4>Track Bus</h4></a>
          <p>See the bus times for your stop.</p>
        </div>
        <div class="option-card" onclick="navigateTo('Purchase.aspx')">
          <a href="Purchase.aspx"><h4>Purchase</h4></a>
          <p>Purchase ticket.</p>
        </div>
        <div class="option-card" onclick="navigateTo('Notice.aspx')">
          <a href="Notice.aspx"><h4>Notices</h4></a>
          <p>See delays, alerts and emergencies.</p>
        </div>
      </div>
    </div>
  </div>
    <!-- end commuter home -->

    <!-- driver home -->
    <div class="container2" id="driverHome" runat="server" visible="false">
    <div class="card">
      <h3>Driver Home</h3>
      <div class="admin-options">
        <div class="option-card" onclick="navigateTo('manageBusFleet.html')">
          <h4>Check Schedule</h4>
          <p>Find your schedule to see your work days.</p>
        </div>
        <div class="option-card" onclick="navigateTo('handleBreakdowns.html')">
          <h4>Log Emergency</h4>
          <p>Report an emergency to the admin office.</p>
        </div>
        <div class="option-card" onclick="navigateTo('generateSchedule.html')">
          <h4>Log Delays</h4>
          <p>Alert commuters about delays.</p>
        </div>
      </div>
    </div>
  </div>
    <!-- end driver home -->



</asp:Content>
