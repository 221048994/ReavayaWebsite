<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ReaVaya_Bus_System.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>

    .container1 {
      max-width: 800px;
      margin: 0 auto;
      padding: 20px;
      background-color: #fff;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h1 {
      text-align: center;
      margin-bottom: 20px;
    }

    form {
      display: flex;
      flex-direction: column;
    }

    label {
      margin-bottom: 10px;
    }

    input[type="text"],
    input[type="date"] {
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 16px;
    }

    textarea {
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 16px;
      height: 100px;
    }

    button {
      padding: 10px 20px;
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
    }

    button:hover {
      background-color: #0056b3;
    }

    .notice {
      border: 1px solid #ccc;
      border-radius: 5px;
      padding: 20px;
      margin-bottom: 20px;
      background-color: #f9f9f9;
    }

    .notice h2 {
      margin-top: 0;
    }

    .notice.date {
      font-size: 14px;
      color: #888;
      text-align: right;
    }
  </style>
    <div class="container1">
                    <h1 class="register-title">Profile Management</h1>
                    <asp:Panel runat="server" CssClass="form1">
                        <div class="form-group">
                            <label for="Name">Name:</label>
                            <asp:TextBox ID="name" CssClass="form-control" runat="server" ReadOnly="True" />
                        </div>
                        <div class="form-group">
                            <label for="Surname">Surname:</label>
                            <asp:TextBox ID="surname" CssClass="form-control" runat="server" ReadOnly="True" />
                        </div>
                        <div class="form-group">
                            <label for="Phone">Contact Number:</label>
                            <asp:TextBox ID="phone" CssClass="form-control" runat="server" ReadOnly="True" />
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <asp:TextBox ID="email" CssClass="form-control" runat="server" ReadOnly="true"/>
                        </div>
                        <div class="form-group btn-box">
                            <asp:Button ID="btn_Email" CssClass="button" runat="server" Text="Change Email" OnClick="Btn_Email" />
                        </div>
                        <div class="form-group" runat="server" id="changeEmail" visible="false">
                            <label for="email">Email:</label>
                            <asp:TextBox ID="text_email" CssClass="form-control" runat="server" PlaceHolder="Enter New Email:"/>
                        </div>
                        <br>
                        <div class="form-group btn-box">
                            <asp:Button ID="saveChangesBtn" CssClass="button" runat="server" Text="Save Changes" OnClick="SaveChangesBtn_Click" />
                        </div>
                        <div class="form-group" runat="server" id="verify" visible="false">
                            <label for="Password">Enter Password:</label>
                            <asp:TextBox ID="Password" TextMode="Password" CssClass="form-control" runat="server" Placeholder="Enter Password..."/>
                        </div>
                        <asp:Label ID="successLabel" runat="server" Text="Changes saved successfully......" CssClass="success-label" Visible="false" ForeColor="#33CC33" />
                    </asp:Panel>
                </div>
</asp:Content>
