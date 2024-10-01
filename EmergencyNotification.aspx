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

        .deploy-btn {
            margin-top: 10px;
            display: inline-block;
            padding: 8px 15px;
            background-color: dodgerblue;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }

        .deploy-btn:hover {
            background-color: darkblue;
        }
    </style>

    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <div class="container">
        <h1>Emergency Notifications</h1>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Panel ID="pnlNotifications" runat="server" CssClass="notifications-panel">
                    <asp:Repeater ID="rptEmergence" runat="server" OnItemDataBound="rptEmergence_ItemDataBound">
                        <ItemTemplate>
                            <div class="notification">
                                <p><strong>Type:</strong> <asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>'></asp:Label></p>
                                <p><strong>Message:</strong> <asp:Label ID="MessageLabel" runat="server" Text='<%# Eval("Message") %>'></asp:Label></p>
                                <p><strong>Driver:</strong> <asp:Label ID="Driver" runat="server" Text='<%# Eval("Driver") %>'></asp:Label></p>
                                <p><strong>Date:</strong> <asp:Label ID="Date" runat="server" Text='<%# Eval("date_sent") %>'></asp:Label></p>
                                <p><strong>Relevant Contacts:</strong> <asp:Label ID="ContactsLabel" runat="server"></asp:Label></p>
                                
                                <!-- Deploy New Bus Button -->
                                <a href="GenerateSchedule.aspx" class="deploy-btn">Deploy New Bus</a>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </asp:Panel>
                <asp:Timer ID="Timer1" runat="server" Interval="60000" OnTick="Timer1_Tick" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
