<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="getAuthorities.aspx.cs" Inherits="ReaVaya_Bus_System.getAuthorities" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <title>Emergency Contacts</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .authority {
            margin-bottom: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
        }

        .authority p {
            margin: 0;
            color: #666;
        }

        .authority h2 {
            margin-bottom: 10px;
            font-size: 20px;
            color: #007bff;
        }
    </style>

    <div class="container">
        <h1>Emergency Contacts</h1>

        <div class="authority">
            <h2>Police</h2>
            <p><strong>Contact Number:</strong> 10111</p>
            <p><strong>Description:</strong> South African Police Service emergency line for reporting crimes and requesting police assistance.</p>
        </div>

        <div class="authority">
            <h2>Ambulance/Paramedics</h2>
            <p><strong>Contact Number:</strong> 10177</p>
            <p><strong>Description:</strong> Emergency medical services for requesting an ambulance in case of medical emergencies.</p>
        </div>

        <div class="authority">
            <h2>Fire Department</h2>
            <p><strong>Contact Number:</strong> 10177</p>
            <p><strong>Description:</strong> Fire and rescue services for reporting fires and requesting fire-fighting assistance.</p>
        </div>

        <div class="authority">
            <h2>National Emergency Number</h2>
            <p><strong>Contact Number:</strong> 112</p>
            <p><strong>Description:</strong> General emergency number in South Africa for any emergency, available on all mobile networks.</p>
        </div>

        <div class="authority">
            <h2>Poison Information Center</h2>
            <p><strong>Contact Number:</strong> 0861 555 777</p>
            <p><strong>Description:</strong> Helpline for poisoning emergencies and poison-related information.</p>
        </div>
        
        <!-- Add more emergency contacts as needed -->
        <div class="authority">
        <h2>Sea Rescue (NSRI)</h2>
        <p><strong>Contact Number:</strong> 082 911</p>
   <p><strong>Description:</strong> National Sea Rescue Institute for marine emergencies, including drowning and boat accidents.</p>
    </div>

<div class="authority">
    <h2>Crime Stop</h2>
    <p><strong>Contact Number:</strong> 08600 10111</p>
    <p><strong>Description:</strong> Anonymously report crime to the South African Police Service (SAPS).</p>
</div>

<div class="authority">
    <h2>Childline South Africa</h2>
    <p><strong>Contact Number:</strong> 08000 55 555</p>
    <p><strong>Description:</strong> Helpline for children in distress or who need help with abuse, bullying, or any other issues.</p>
</div>

<div class="authority">
    <h2>Gender-Based Violence Command Centre</h2>
    <p><strong>Contact Number:</strong> 0800 428 428</p>
    <p><strong>Description:</strong> Helpline for victims of gender-based violence to get assistance and counseling.</p>
</div>

<div class="authority">
    <h2>Suicide Crisis Helpline</h2>
    <p><strong>Contact Number:</strong> 0800 567 567</p>
    <p><strong>Description:</strong> Helpline for those experiencing suicidal thoughts or mental health crises.</p>
</div>

<div class="authority">
    <h2>Disaster Management</h2>
    <p><strong>Contact Number:</strong> 0800 029 999</p>
    <p><strong>Description:</strong> South African disaster management helpline for natural disasters, floods, and other emergencies.</p>
</div>
    </div>
</asp:Content>
