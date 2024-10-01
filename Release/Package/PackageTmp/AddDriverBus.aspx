<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddDriverBus.aspx.cs" Inherits="ReaVaya_Bus_System.AddDriverBus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .container {
            max-width: 900px;
            margin: auto;
            padding: 20px;
        }
        .form-section {
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .form-section h3 {
            margin-top: 0;
        }
        .form-group label {
            font-weight: bold;
        }
        .btn-container {
            text-align: right;
            margin-top: 10px;
        }
        .status-label {
            margin-top: 10px;
            font-weight: bold;
        }
    </style>
    <div class="container">
            <h2 class="text-center">Add Admins, Drivers, Buses</h2>
            
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="admin-tab" data-toggle="tab" href="#admin" role="tab" aria-controls="admin" aria-selected="true">Add Admin</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="driver-tab" data-toggle="tab" href="#driver" role="tab" aria-controls="driver" aria-selected="false">Add Driver</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="bus-tab" data-toggle="tab" href="#bus" role="tab" aria-controls="bus" aria-selected="false">Add Bus</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <!-- Admin Section -->
                <div class="tab-pane fade show active form-section" id="admin" role="tabpanel" aria-labelledby="admin-tab">
                    <h3>Add New Admin</h3>
                    <div class="form-group">
                        <label for="adminName">Admin Name:</label>
                        <asp:TextBox ID="adminName" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="adminSurname">Admin Surname:</label>
                        <asp:TextBox ID="adminSurname" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="adminEmail">Admin Email:</label>
                        <asp:TextBox ID="adminEmail" runat="server" CssClass="form-control" TextMode="Email" />
                    </div>
                    <div class="form-group">
                        <label for="adminContact">Contact Information:</label>
                        <asp:TextBox ID="adminContact" runat="server" CssClass="form-control" TextMode="Phone" />
                    </div>
                    <div class="btn-container">
                        <asp:Button ID="addAdminButton" runat="server" Text="Add Admin" CssClass="btn btn-primary" OnClick="AddAdminButton_Click" />
                    </div>
                    <asp:Label ID="addAdminStatus" runat="server" CssClass="status-label"></asp:Label>
                    <hr />
                    <h4> <asp:Label ID="AdminsAdded" runat="server"></asp:Label></h4>

                    <asp:Repeater ID="adminRepeater" runat="server" OnItemCommand="adminRepeater_ItemCommand">
                        <ItemTemplate>
                            <p><%# Eval("Name") %> <%# Eval("Surname") %> - <%# Eval("Email") %></p>
                            <asp:Button ID="btnDeleteAdmin" runat="server" CommandName="DeleteAdmin" CommandArgument='<%# Eval("Email") %>' Text="Remove" CssClass="btn btn-danger btn-sm" />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <!-- Driver Section -->
                <div class="tab-pane fade form-section" id="driver" role="tabpanel" aria-labelledby="driver-tab">
                    <h3>Add Driver</h3>
                    <div class="form-group">
                        <label for="driverName">Driver Name:</label>
                        <asp:TextBox ID="driverName" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="driverSurname">Driver Surname:</label>
                        <asp:TextBox ID="driverSurname" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="driverEmail">Driver Email:</label>
                        <asp:TextBox ID="driverEmail" runat="server" CssClass="form-control" TextMode="Email" />
                    </div>
                    <div class="form-group">
                        <label for="driverContact">Contact Information:</label>
                        <asp:TextBox ID="driverContact" runat="server" CssClass="form-control" TextMode="Phone" />
                    </div>
                    <div class="form-group">
                        <label for="driverLicense">License Number:</label>
                        <asp:TextBox ID="driverLicense" runat="server" CssClass="form-control" />
                    </div>
                    <div class="btn-container">
                        <asp:Button ID="addDriverButton" runat="server" Text="Add Driver" CssClass="btn btn-primary" OnClick="AddDriverButton_Click" />
                    </div>
                    <asp:Label ID="addDriverStatus" runat="server" CssClass="status-label"></asp:Label>
                    <hr />
                    <h4> <asp:Label ID="AddedDrivers" runat="server"></asp:Label></h4>
                    <asp:Repeater ID="driverRepeater" runat="server" OnItemCommand="driverRepeater_ItemCommand">
                        <ItemTemplate>
                            <p><%# Eval("Name") %> <%# Eval("Surname") %> - <%# Eval("Email") %></p>
                            <asp:Button ID="btnDeleteDriver" runat="server" CommandName="DeleteDriver" CommandArgument='<%# Eval("Email") %>' Text="Remove" CssClass="btn btn-danger btn-sm" />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <!-- Bus Section -->
                <div class="tab-pane fade form-section" id="bus" role="tabpanel" aria-labelledby="bus-tab">
                    <h3>Add Bus</h3>
                    <div class="form-group">
                        <label for="busNumber">Number Plate:</label>
                        <asp:TextBox ID="busNumber" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="busCondition">Condition:</label>
                        <asp:TextBox ID="busCondition" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="busType">Bus Type:</label>
                        <asp:DropDownList ID="busType" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Select type"/>
                            <asp:ListItem Text="Trunk" Value="Trunk" />
                            <asp:ListItem Text="Feeder" Value="Feeder" />
                        </asp:DropDownList>
                    </div>
                    <div class="btn-container">
                        <asp:Button ID="addBusButton" runat="server" Text="Add Bus" CssClass="btn btn-primary" OnClick="AddBusButton_Click" />
                    </div>
                    <asp:Label ID="addBusStatus" runat="server" CssClass="status-label"></asp:Label>
                    <hr />
                    <h4> <asp:Label ID="AddedBuses" runat="server"></asp:Label></h4>
                    <asp:Repeater ID="busRepeater" runat="server" OnItemCommand="busRepeater_ItemCommand">
                        <ItemTemplate>
                            <p><%# Eval("NumberPlate") %> - <%# Eval("Condition") %> - <%# Eval("Type") %></p>
                            <asp:Button ID="btnDeleteBus" runat="server" CommandName="DeleteBus" CommandArgument='<%# Eval("NumberPlate") %>' Text="Remove" CssClass="btn btn-danger btn-sm" />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        // Keep the tab active after postback
        $(document).ready(function () {
            var hash = document.location.hash;
            if (hash) {
                $('.nav-tabs a[href="' + hash + '"]').tab('show');
            }

            $('.nav-tabs a').on('shown.bs.tab', function (e) {
                var newHash = e.target.hash;
                history.replaceState(null, null, newHash);
            });
        });
    </script>
</asp:Content>
