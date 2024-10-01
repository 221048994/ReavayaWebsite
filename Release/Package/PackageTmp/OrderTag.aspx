<%@ Page Title="Order Bus Tag" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="OrderTag.aspx.cs" Inherits="ReaVaya_Bus_System.OrderTag" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <link href="css/custom2.css" rel="stylesheet">
    
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
    margin-bottom: 10px;
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

.nav-tabs {
    margin-left: 100px;
    margin-right: 100px;
}
  </style>


        <main>
            <section>
                <div class="card">
                    <h3 class="order-title">Place Bus Tag Order</h3>
                    <div class="notification-item">
                    <asp:Panel runat="server" CssClass="form1">
                        <div class="form-group">
                            <label for="station">Collect Station:</label>
                            <asp:DropDownList ID="station" CssClass="form-control" runat="server">
                                <asp:ListItem Text="Thokoza Park Station" Value="Thokoza Park Station"></asp:ListItem>
                                <asp:ListItem Text="Lakeview Station" Value="Lakeview Station"></asp:ListItem>
                                <asp:ListItem Text="Ellis Park Station" Value="Ellis Park Station"></asp:ListItem>
                                <asp:ListItem Text="Braamfontein Station" Value="Braamfontein Station"></asp:ListItem>
                                <asp:ListItem Text="Metro Centre Station" Value="Metro Centre Station"></asp:ListItem>
                                <asp:ListItem Text="Noordgesig Station" Value="Noordgesig Station"></asp:ListItem>
                                <asp:ListItem Text="Parktown Station" Value="Parktown Station"></asp:ListItem>
                                <asp:ListItem Text="Rissik Street Station" Value="Rissik Street Station"></asp:ListItem>
                                <asp:ListItem Text="Pimville Station" Value="Pimville Station"></asp:ListItem>
                                <asp:ListItem Text="Mapetla Station" Value="Mapetla Station"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="amount">Amount to load on Tag: R</label>
                            <asp:TextBox ID="amount" CssClass="form-control" runat="server" Placeholder="Enter Amount..."></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="calculateBtn" CssClass="btn2" runat="server" Text="Calculate" OnClick="CalculateBtn_Click" />
                        </div>
                        <asp:Label ID="feeLabel" runat="server" Text="You are charged a booking fee of R10." ForeColor="Red" Visible="False"></asp:Label>
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
                            <asp:Button ID="placeOrderBtn" CssClass="btn2" runat="server" Text="Place Order" OnClick="PlaceOrderBtn_Click" />
                        </div>
                    </asp:Panel>
                   </div>
                </div>
            </section>
        </main>
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
    <script src="js/custom.js"></script>

</asp:Content>
