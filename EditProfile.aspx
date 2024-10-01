<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="ReaVaya_Bus_System.EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
                       <style>
                .card {
    font-family: Arial, sans-serif;
    background-color: #FCFBF4;
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
    margin-left: 80px;
    margin-right: 80px;
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


    <div class="card">
            <h2>Edit Profile</h2>
            <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
            <br />
        <div class="notification-item">
            <div class="form-group">
            <asp:Label ID="lblName" runat="server" Text="Name:"></asp:Label>
            <asp:TextBox ID="txtName" runat="server" ReadOnly="True"></asp:TextBox>
                </div>
            <br />
            <div class="form-group">
            <asp:Label ID="lblSurname" runat="server" Text="Surname:"></asp:Label>
            <asp:TextBox ID="txtSurname" runat="server" ReadOnly="True"></asp:TextBox>
                </div>
            <br />
            <div class="form-group">
            <asp:Label ID="lblCurrentEmail" runat="server" Text="Current Email:"></asp:Label>
            <asp:TextBox ID="txtCurrentEmail" runat="server" ReadOnly="True"></asp:TextBox>
                </div>
            <br />
            <div class="form-group">
            <asp:Label ID="lblNewEmail" runat="server" Text="New Email:"></asp:Label>
            <asp:TextBox ID="txtNewEmail" runat="server"></asp:TextBox>
                </div>
            <br />
            <div class="form-group">
            <asp:Label ID="lblCurrentPassword" runat="server" Text="Current Password:"></asp:Label>
            <asp:TextBox ID="txtCurrentPassword" runat="server" TextMode="Password"></asp:TextBox>
                </div>
            <br />
            <div class="form-group">
            <asp:Label ID="lblNewPassword" runat="server" Text="New Password:"></asp:Label>
            <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                </div>
            <br />
            <div class="form-group">
            <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password:"></asp:Label>
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                </div>
            <br />
            <div class="form-group">
            <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" Text="Save Changes" OnClick="btnSave_Click" />
            </div>
            </div>
        </div>
</asp:Content>
