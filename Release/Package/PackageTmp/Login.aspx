<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ReaVaya_Bus_System.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700&display=swap" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha256-mLBIhmBvigTFWPSCtvdu6a76T+3Xyt+K571hupeFLg4=" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet"> <!-- Your custom stylesheet -->
</head>
<body>
    <form id="form1" runat="server">
        <main>
            <section>
                <div class="login-container">
                    <h2 class="login-title">Login</h2>
                    <br>
                    <asp:Panel runat="server" CssClass="form1">
                        <div class="form-group">
    <label for="email">Email:</label>
    <asp:TextBox ID="email" CssClass="form-control" runat="server" Placeholder="Enter Email..."></asp:TextBox>
    <asp:RegularExpressionValidator ID="EmailValidator" 
        runat="server" 
        ControlToValidate="email" 
        ErrorMessage="Please enter a valid email address."
        CssClass="text-danger"
        ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$">
    </asp:RegularExpressionValidator>
</div>
                        <div class="form-group">
                            <label for="password">Password:</label>
                            <asp:TextBox ID="password" TextMode="Password" CssClass="form-control" runat="server" Placeholder="Enter Password..."></asp:TextBox>
                        </div>
                        <asp:Label ID="invalidLabel" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                        <div class="form-group btn-box">
                            <asp:Button ID="loginBtn" CssClass="login-btn" runat="server" Text="Login" OnClick="loginBtn_Click" />
                        </div>
                        <p class="signup-link">Do not have an account? <a href="Registration.aspx">Sign Up</a></p>
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

