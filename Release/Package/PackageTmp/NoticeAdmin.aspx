<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NoticeAdmin.aspx.cs" Inherits="ReaVaya_Bus_System.NoticeAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        .Notificationcontainer {
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

        /* Form styles */
        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input[type=text],
        .form-group textarea {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-group textarea {
            height: 150px;
            resize: vertical;
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

        /* Notification display */
        .notifications {
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

        .notification h3 {
            margin-top: 0;
            color: #333;
        }

        .notification p {
            margin-bottom: 0;
            color: #666;
        }

        .btnsend {
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
            showTab('tab-general');
        });
    </script>

    <div class="Notificationcontainer">
            <h1>Admin Interface</h1>
            <div>
                <span class="tab active" data-tab="tab-general" onclick="showTab('tab-general')">General</span>
                <span class="tab" data-tab="tab-driver" onclick="showTab('tab-driver')">Driver</span>
                <span class="tab" data-tab="tab-users" onclick="showTab('tab-users')">Users</span>
            </div>
            <div id="tab-general" class="tab-content active">
                <div class="form-group">
                    <label for="notificationTitle">Notification Title:</label>
                    <asp:TextBox ID="txtTitleGeneral" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtMessage">Message:</label>
                    <asp:TextBox ID="txtMessageGeneral" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnSendGeneral" class="btnsend" runat="server" Text="Send" OnClick="btnSendNotificationGeneral_Click" />
                </div>
                <div class="notifications">
                    <!-- Notifications will be displayed here -->
                    <asp:Repeater ID="rptNotificationsGeneral" runat="server">
                        <ItemTemplate>
                            <div class="notification">
                                <h3><%# Eval("Title") %></h3>
                                <p><%# Eval("Message") %></p>
                                <small><%# Eval("DateCreated", "{0:dd/MM/yyyy HH:mm}") %></small>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div id="tab-driver" class="tab-content">
                <div class="form-group">
                    <label for="notificationTitle">Notification Title:</label>
                    <asp:TextBox ID="txtTitleDriver" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtMessage">Message:</label>
                    <asp:TextBox ID="txtMessageDriver" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnSendDriver" class="btn" runat="server" Text="Send" OnClick="btnSendNotificationDriver_Click" />
                </div>
                <div class="notifications">
                    <!-- Notifications will be displayed here -->
                    <asp:Repeater ID="rptNotificationsDriver" runat="server">
                        <ItemTemplate>
                            <div class="notification">
                                <h3><%# Eval("Title") %></h3>
                                <p><%# Eval("Message") %></p>
                                <small><%# Eval("DateCreated", "{0:dd/MM/yyyy HH:mm}") %></small>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div id="tab-users" class="tab-content">
                <div class="form-group">
                    <label for="notificationTitle">Notification Title:</label>
                    <asp:TextBox ID="txtTitleUsers" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtMessage">Message:</label>
                    <asp:TextBox ID="txtMessageUsers" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnSendUsers" class="btn" runat="server" Text="Send" OnClick="btnSendNotificationUsers_Click" />
                </div>
                <div class="notifications">
                    <!-- Notifications will be displayed here -->
                    <asp:Repeater ID="rptNotificationsUsers" runat="server">
                        <ItemTemplate>
                            <div class="notification">
                                <h3><%# Eval("Title") %></h3>
                                <p><%# Eval("Message") %></p>
                                <small><%# Eval("DateCreated", "{0:dd/MM/yyyy HH:mm}") %></small>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>

</asp:Content>
