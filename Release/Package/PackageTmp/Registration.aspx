<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="ReaVaya_Bus_System.Registration" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700&display=swap" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha256-mLBIhmBvigTFWPSCtvdu6a76T+3Xyt+K571hupeFLg4=" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <link href="css/custom1.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <main>
            <section>
                <div class="register-container">
                    <h1 class="register-title">Register</h1>
                    <asp:Panel runat="server" CssClass="form1">
                        <div class="form-group">
                            <label for="name">Name:</label>
                            <asp:TextBox ID="name" CssClass="form-control" runat="server" Placeholder="Enter Name..."></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="surname">Surname:</label>
                            <asp:TextBox ID="surname" CssClass="form-control" runat="server" Placeholder="Enter Surname..."></asp:TextBox>
                        </div>
                        <div class="form-group">
    <label for="email">Email:</label>
    <asp:TextBox ID="email" CssClass="form-control" runat="server" Placeholder="Enter Email..."></asp:TextBox>
    <asp:RegularExpressionValidator 
        ID="EmailValidator" 
        runat="server" 
        ControlToValidate="email" 
        ErrorMessage="Please enter a valid email address."
        CssClass="text-danger"
        ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$">
    </asp:RegularExpressionValidator>
</div>

<div class="form-group">
    <label for="phone">Contact Number:</label>
    <asp:TextBox ID="phone" CssClass="form-control" runat="server" Placeholder="Enter Contact Number..."></asp:TextBox>
    <asp:RegularExpressionValidator 
        ID="PhoneValidator" 
        runat="server" 
        ControlToValidate="phone" 
        ErrorMessage="Please enter a valid 10-digit contact number."
        CssClass="text-danger"
        ValidationExpression="^\d{10}$">
    </asp:RegularExpressionValidator>
</div>

                        <div class="form-group">
                            <label for="password">Password:</label>
                            <asp:TextBox ID="password" TextMode="Password" CssClass="form-control" runat="server" Placeholder="Enter Password..."></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="confirm_password">Confirm Password:</label>
                            <asp:TextBox ID="confirm_password" TextMode="Password" CssClass="form-control" runat="server" Placeholder="Confirm Password..."></asp:TextBox>
                        </div>
                        <br>
                        <asp:Label ID="matchLabel" runat="server" Text="Label" ForeColor="Red" Visible="False"></asp:Label>
                        <div class="form-group btn-box">
                            <asp:Button ID="registerBtn" CssClass="btn2" runat="server" Text="Register" OnClick="RegisterBtn_Click" />
                        </div>
                        <asp:Label ID="successLabel" runat="server" Text="Registration successful, redirecting..." CssClass="success-label" Visible="false" ForeColor="#33CC33" />
                    </asp:Panel>
                </div>
            </section>
        </main>
    </form>
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js" integrity="sha256-Zr3vByTlMGQhvMfgkQ5BtWRSKBGa2QlspKYJnkjZTmo=" crossorigin="anonymous"></script>
    <script src="js/custom.js"></script>
</body>
</html>
