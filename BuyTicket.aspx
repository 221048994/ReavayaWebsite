<%@ Page Title="Buy Ticket" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="BuyTicket.aspx.cs" Inherits="ReaVaya_Bus_System.BuyTicket" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Bus Card Order</title>
    <link href="css/custom2.css" rel="stylesheet">

    <style>
                .card {
    font-family: Arial, sans-serif;
    background-color: #FCFBF4;
    padding: 20px;
    margin-bottom: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin-top: 50px;
}
.btn2 
{
    color:white;
    background-color:blue;

}

h1 {
    color: black;
    font-size: 32px;
}

.notice-card h3 {
    color: blue;
    font-size: 24px;
}

.notification-item {
   background-color:floralwhite;
    border-left: #dc3545;
    margin-left: 120px;
    margin-right: 120px;
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
    </style>

<body>
        <main>
            <section>
                <div class="card">
                    <h1 class="order-title">Buy Bus Ticket</h1>
                    <div class="notification-item">
                    <asp:Panel runat="server" CssClass="form1">
                        <div class="form-group">
                            <label for="station">Station from:</label>
                            <asp:DropDownList ID="stationFrom" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Station_SelectedIndexChanged">
                                <asp:ListItem Text="Thokoza Park Station" Value="Thokoza Park"></asp:ListItem>
                                <asp:ListItem Text="Ellis Park Station" Value="Ellis Park"></asp:ListItem>
                                <asp:ListItem Text="Braamfontein Station" Value="Braamfontein"></asp:ListItem>
                                <asp:ListItem Text="Metro Centre Station" Value="Metro Centre"></asp:ListItem>
                                <asp:ListItem Text="Noordgesig Station" Value="Noordgesig"></asp:ListItem>
                                <asp:ListItem Text="Parktown Station" Value="Parktown"></asp:ListItem>
                                <asp:ListItem Text="Rissik Street Station" Value="Rissik Street"></asp:ListItem>
                                <asp:ListItem Text="Pimville Station" Value="Pimville"></asp:ListItem>
                                <asp:ListItem Text="Mapetla Station" Value="Mapetla"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                         <div class="form-group">
                            <label for="station">Station To:</label>
                            <asp:DropDownList ID="stationTo" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Station_SelectedIndexChanged">
                                <asp:ListItem Text="Thokoza Park Station" Value="Thokoza Park"></asp:ListItem>
                              
                                <asp:ListItem Text="Ellis Park Station" Value="Ellis Park"></asp:ListItem>
                                <asp:ListItem Text="Braamfontein Station" Value="Braamfontein"></asp:ListItem>
                                <asp:ListItem Text="Metro Centre Station" Value="Metro Centre"></asp:ListItem>
                                <asp:ListItem Text="Noordgesig Station" Value="Noordgesig"></asp:ListItem>
                                <asp:ListItem Text="Parktown Station" Value="Parktown"></asp:ListItem>
                                <asp:ListItem Text="Rissik Street Station" Value="Rissik Street"></asp:ListItem>
                                <asp:ListItem Text="Pimville Station" Value="Pimville"></asp:ListItem>
                                <asp:ListItem Text="Mapetla Station" Value="Mapetla"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="amount">Trip Amount: R</label>
                            <asp:Label ID="amount" runat="server" ForeColor="Green" Visible="True"></asp:Label>
                        </div>
                        <div class="form-group">
                            <asp:ListView ID="orderListView" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("Description") %></td>
                                        <td><%# Eval("Value") %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                        <div class="form-group btn-box">
                            <asp:Button ID="placeOrderBtn" CssClass="btn2" runat="server" Text="Buy" OnClick="PlaceOrderBtn_Click" />
                        </div>
                    </asp:Panel>
                        </div>
                </div>
            </section>
        </main>
    
</body>
</asp:Content>
