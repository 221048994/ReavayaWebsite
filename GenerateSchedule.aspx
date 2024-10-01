<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GenerateSchedule.aspx.cs" Inherits="ReaVaya_Bus_System.GenerateSchedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <title>Generate Schedule</title>
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

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input[type=text],
        .form-group select,
        .form-group input[type=date] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-group button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 12px 20px;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
        }

        .form-group button:hover {
            background-color: #0056b3;
        }

        /* Tab styles */
        .tab {
            display: inline-block;
            padding: 10px 20px;
            cursor: pointer;
            background-color: #007bff;
            color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px 5px 0 0;
        }

        .tab.active {
            background-color: #0056b3;
        }

        .tab-content {
            display: none;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 0 0 5px 5px;
            background-color: #fff;
        }

        .tab-content.active {
            display: block;
        }

        /* Schedule display */
        .schedules {
            margin-top: 20px;
            background-color: #f9f9f9;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .schedule {
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
        }

        .schedule h3 {
            margin-top: 0;
            color: #333;
        }

        .schedule p {
            margin-bottom: 0;
            color: #666;
        }

        .btngen {
            display: block;
            width: 20%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
        }

        .btngen:hover {
            background-color: #0056b3;
        }
    </style>

    <script>
        function showTab(tabId) {
            var tabs = document.querySelectorAll('.tab');
            var contents = document.querySelectorAll('.tab-content');

            tabs.forEach(function (tab) {
                tab.classList.remove('active');
            });

            contents.forEach(function (content) {
                content.classList.remove('active');
            });

            document.getElementById(tabId).classList.add('active');
            document.querySelector('[data-tab="' + tabId + '"]').classList.add('active');
        }

        document.addEventListener('DOMContentLoaded', function () {
            showTab('tab-schedule');
        });
    </script>
        <div class="container">
        <h1>Generate Schedule</h1>
        <div>
            <span class="tab active" data-tab="tab-schedule" onclick="showTab('tab-schedule')">Schedule Generating</span>
            <span class="tab" data-tab="tab-history" onclick="showTab('tab-history')">Schedule</span>
        </div>

        <div id="tab-schedule" class="tab-content active">
            <div class="form-group">
                <label for="driverDropdown">Driver:</label>
                <asp:DropDownList ID="driverDropdown" runat="server" CssClass="form-control">
                <asp:ListItem Text="Select Driver"/>
                    
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="routeDropdown">Route:</label>
                <asp:DropDownList ID="routeDropdown" runat="server" CssClass="form-control">
                    
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="busDropdown">Bus Number Plate:</label>
                <asp:DropDownList ID="busDropdown" runat="server" CssClass="form-control">
                <asp:ListItem Text="Select Bus"/>
                    
                </asp:DropDownList>
            </div>

            <div class="form-group">
    <label for="startDateInput">Start Date:</label>
    <asp:TextBox ID="startDateInput" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
</div>

<div class="form-group">
    <label for="endDateInput">End Date:</label>
    <asp:TextBox ID="endDateInput" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
</div>

<div class="form-group">
    <label for="tierDropdown">Tier:</label>
    <asp:DropDownList ID="tierDropdown" runat="server" CssClass="form-control">
         <asp:ListItem Text="Select Tier" />
        <asp:ListItem Text="Tier One" Value="1" />
        <asp:ListItem Text="Tier Two" Value="2" />
        <asp:ListItem Text="Tier Three" Value="3" />
    </asp:DropDownList>
</div>


            <div class="form-group">
                <asp:Button ID="GenerateScheduleButton" style="width:200px;" class="btngen" runat="server" Text="Generate Schedule" OnClick="GenerateScheduleButton_Click" />
            </div>
            <div class="form-group">
                
                <asp:Label ID="statusLabel" runat="server" CssClass="status-message"></asp:Label>
            </div>
        </div>

        <div id="tab-history" class="tab-content">
            <h2>Driver Schedules</h2>
            <div class="schedules">
                <asp:Repeater ID="rptSchedules" runat="server">
                    <ItemTemplate>
                        <div class="schedule">
                            <h3>Driver: <%# Eval("DriverName") %></h3>
                            <p>Route: <%# Eval("RouteName") %></p>
                            <p>Number Plate: <%# Eval("BusNumber") %></p>
                            <p>Start Date: <%# Eval("StartDate", "{0:dd/MM/yyyy}") %></p>
                            <p>End Datet: <%# Eval("EndDate", "{0:dd/MM/yyyy}") %></p>
                            <p>Tier: <%# Eval("Tier") %></p>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
