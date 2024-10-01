<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmergencyNotification.aspx.cs" Inherits="ReaVaya_Bus_System.EmergencyNotification" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <title>Emergency Notifications</title>
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

        .notifications-panel {
            margin-top: 20px;
            background-color: #f9f9f9;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .notification {
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
        }

        .notification p {
            margin-bottom: 0;
            color: #666;
        }


        .btn:hover {
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
            showTab('tab-notifications');
        });
    </script>

        <!-- Add ScriptManager control here -->
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <div class="container">
            <h1>Emergency Notifications</h1>
            <div>
                <span class="tab active" data-tab="tab-notifications" onclick="showTab('tab-notifications')">Notifications</span>
                <!-- You can add more tabs here if needed -->
            </div>

            <div id="tab-notifications" class="tab-content active">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="pnlNotifications" runat="server" CssClass="notifications-panel">
                            <asp:Repeater ID="rptEmergence" runat="server">
                                <ItemTemplate>
                                    <div class="notification">
                                        <p><strong>Type:</strong> <%# Eval("Type") %></p>
                                        <p><strong>Message:</strong> <%# Eval("Message") %></p>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </asp:Panel>
                        <asp:Timer ID="Timer1" runat="server" Interval="60000" OnTick="Timer1_Tick" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

    <asp:Button ID="Button1" class="btn" style="margin-top:10px;" runat="server" Text="get Authority number" OnClick="Button1_Click" />


        </div>
</asp:Content>
