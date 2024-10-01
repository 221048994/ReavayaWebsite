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
      background-color:#FCFBF4;
      min-height: 80vh;
      padding: 20px;
    }
    .card {
      width: 100%;
      max-width: 800px;
      padding: 20px;
      margin: 20px auto;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
      background-color: white;
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
      max-width: 300px;
      padding: 20px;
      margin: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
      text-align: center;
      background-color: #fff;
      cursor: pointer;
      transition: transform 0.3s, box-shadow 0.3s;
    }
    .option-card:hover {
      transform: scale(1.05);
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
    }
    .option-card h4 {
      margin-bottom: 10px;
      color: black;
    }
    p {
      color: black;
      font-size: 14px;
    }
    @media (max-width: 768px) {
      .option-card {
        width: 100%;
      }
    }


    .card1 {
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    margin: 40px;
}

.option-container {
    display: flex;
    justify-content: space-around; /* Distribute space evenly */
    flex-wrap: wrap; /* Allows options to wrap on smaller screens */
}

.option-card1 {
    background-color: #f9f9f9;
    border: 1px solid #ddd;
    padding: 15px;
    margin: 10px;
    width: 30%; /* Adjust the width of each card */
    text-align: center;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.option-card1 a {
    text-decoration: none;
    color: #333;
}

.option-card1 a:hover {
    color: #007bff;
}

  </style>

  <!-- About Us Section -->
  <div class="about_section layout_padding" id="normalHome" runat="server" visible="true">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <div class="detail-box">
            <div class="heading_container">
              <h2>About Us</h2>
            </div>
            <p>
              Rea Vaya is a bus rapid transit (BRT) system in Johannesburg, South Africa.
              It was launched in 2009 to provide efficient and affordable public transportation options for residents of Johannesburg.
              Rea Vaya buses run on dedicated lanes, allowing them to bypass traffic congestion and provide faster travel times. 
              The system has helped improve mobility in the city and reduce reliance on private vehicles, contributing to efforts to combat traffic congestion and air pollution.
            </p>
            <a href="#">Read More</a>
          </div>
        </div>
        <div class="col-md-6">
          <div class="img-box">
            <img src="images/i1.jpeg" alt="Rea Vaya Image" style="max-width:100%; border-radius: 10px;">
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- End About Us Section -->

  <!-- Admin Home Section -->
  <div class="container2" id="adminHome" runat="server" visible="false">
    <div class="card">
      <h3>Admin Home</h3>
      <div class="admin-options">
        <div class="option-card">
          <a href="NoticeAdmin.aspx">
            <h4>Notice</h4>
            <p>Give notice to drivers and commuters.</p>
          </a>
        </div>
        <div class="option-card">
          <a href="AddDriverBus.aspx">
            <h4>Manage Assignment</h4>
            <p>Add Drivers, Admins, and Buses.</p>
          </a>
        </div>
        <div class="option-card">
          <a href="EmergencyNotification.aspx">
            <h4>Handle Emergencies and Alerts</h4>
            <p>Send notices to commuters.</p>
          </a>
        </div>
        <div class="option-card">
          <a href="GenerateSchedule.aspx">
            <h4>Generate Schedule & Bus Deploy</h4>
            <p>Generate driver schedule.</p>
          </a>
        </div>
         <div class="card1">
    <h4>Reports</h4>
    <div class="option-container">
        <div class="option-card1">
            <a href="TicketReport.aspx">
                <p>See report on used and unused tickets.</p>
            </a>
        </div>
        <div class="option-card1">
            <a href="ValuedCustomerReport.aspx">
                <p>See who's our best customer.</p>
            </a>
        </div>
        <div class="option-card1">
            <a href="BusRepairReport.aspx">
                <p>See which buses need services.</p>
            </a>
        </div>
    </div>
</div>

       
      </div>
    </div>
  </div>
  <!-- End Admin Home Section -->

  <!-- Commuter Home Section -->
  <div class="container2" id="commuterHome" runat="server" visible="false">
    <div class="card">
      <h3>Welcome</h3>
      <div class="admin-options">
        <div class="option-card">
          <a href="Pricing.aspx">
            <h4>Calculate Price</h4>
            <p>Get price of trip.</p>
          </a>
        </div>
        <div class="option-card">
          <a href="TrackBus.aspx">
            <h4>Track Bus</h4>
            <p>See the bus times for your stop.</p>
          </a>
        </div>
        <div class="option-card">
          <a href="Purchase.aspx">
            <h4>Purchase</h4>
            <p>Purchase ticket.</p>
          </a>
        </div>
        <div class="option-card">
          <a href="Notice.aspx">
            <h4>Notices</h4>
            <p>See delays, alerts, and emergencies.</p>
          </a>
        </div>
                  <div class="option-card">
          <a href="Notice.aspx">
            <h4>Notices</h4>
            <p>See delays, alerts, and emergencies.</p>
          </a>
        </div>
      </div>
    </div>
  </div>
  <!-- End Commuter Home Section -->

  <!-- Driver Home Section -->
  <div class="container2" id="driverHome" runat="server" visible="false">
    <div class="card">
      <h3>Driver Home</h3>
      <div class="admin-options">
        <div class="option-card">
          <h4>Check Schedule</h4>
          <p>Find your schedule to see your workdays.</p>
        </div>
        <div class="option-card">
          <h4>Log Emergency</h4>
          <p>Report an emergency to the admin office.</p>
        </div>
        <div class="option-card">
          <h4>Log Delays</h4>
          <p>Alert commuters about delays.</p>
        </div>
      </div>
    </div>
  </div>
  <!-- End Driver Home Section -->

</asp:Content>
