<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="AddBankCard.aspx.cs" Inherits="ReaVaya_Bus_System.AddBankCard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
    margin-left: 100px;
    margin-right: 100px;
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
        <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">


        <main>
            <section>
                
                <div class="card">
                    
                   <div class="tab-content" id="myTabContent">
    <!-- New Card Tab -->
    <div class="tab-pane fade show active" id="new-card" role="tabpanel" aria-labelledby="new-card-tab">
        <asp:Panel runat="server" CssClass="form1">
                    <div class="notification-item">
                        <div class="card-body">
                            <h5 class="card-title">Enter new banking details</h5>
                            <div class="form-group">
                                <label for="nameOnCard">Name on Card</label>
                                <asp:TextBox ID="nameOnCard" CssClass="form-control" runat="server" Placeholder="Enter Name on Card..."></asp:TextBox>
                            </div>
                           <div class="form-group">
    <label for="cardNumber">Card Number</label>
    <asp:TextBox ID="cardNumber" CssClass="form-control" runat="server" Placeholder="Enter Card Number..." MaxLength="19"></asp:TextBox>
    <asp:RegularExpressionValidator 
        ID="CardValidator" 
        runat="server" 
        ControlToValidate="cardNumber" 
        ErrorMessage="Please enter a valid 16-digit card number."
        CssClass="text-danger"
        ValidationExpression="^\d{4}\s\d{4}\s\d{4}\s\d{4}$">
    </asp:RegularExpressionValidator>
</div>
                            <div class="form-group">
    <label for="expiryDate">Expiration Date</label>
    <asp:TextBox ID="expiryDate" CssClass="form-control" runat="server" Placeholder="MM/YY" MaxLength="5"></asp:TextBox>
    <asp:RegularExpressionValidator 
        ID="ExpiryDateValidator" 
        runat="server" 
        ControlToValidate="expiryDate" 
        ErrorMessage="Please enter a valid expiration date in MM/YY format."
        CssClass="text-danger"
        ValidationExpression="^(0[1-9]|1[0-2])\/\d{2}$">
    </asp:RegularExpressionValidator>
</div>

<div class="form-group">
    <label for="cvv">CVV</label>
    <asp:TextBox ID="cvv" CssClass="form-control" runat="server" Placeholder="Enter CVV..." MaxLength="3"></asp:TextBox>
    <asp:RegularExpressionValidator 
        ID="CvvValidator" 
        runat="server" 
        ControlToValidate="cvv" 
        ErrorMessage="Please enter a valid 3-digit CVV."
        CssClass="text-danger"
        ValidationExpression="^\d{3}$">
    </asp:RegularExpressionValidator>
</div>
          
                            <div class="form-group text-center">
                                <asp:Button ID="AddBtn" CssClass="btn btn-primary" runat="server" Text="Add" OnClick="AddBtn_Click" />
                            </div>
                            <asp:Label ID="successLabel" runat="server" Text="Bank card added successfully, redirecting..." CssClass="text-success" Visible="false" />
                            <asp:Label ID="errorLabel" runat="server" CssClass="text-danger" Visible="false" />
                        </div>
                    </div>
                </asp:Panel>
</div>
                     
</div>
                       </div>
                    
            </section>
        </main>
         
    
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js" integrity="sha256-Zr3vByTlMGQhvMfgkQ5BtWRSKBGa2QlspKYJnkjZTmo=" crossorigin="anonymous"></script>
    <script src="js/custom.js"></script>

    <script type="text/javascript">
        document.getElementById('<%= cardNumber.ClientID %>').addEventListener('input', function (e) {
            let value = e.target.value.replace(/\s+/g, '');  // Remove all spaces
            if (value.length > 16) {
                value = value.slice(0, 16);  // Limit to 16 digits
            }
            let formattedValue = value.match(/.{1,4}/g)?.join(' ') || '';  // Add space after every 4 digits
            e.target.value = formattedValue;
        });
    </script>

    <script type="text/javascript">
        // Expiration Date Formatting (MM/YY)
        document.getElementById('<%= expiryDate.ClientID %>').addEventListener('input', function(e) {
        let value = e.target.value.replace(/\D+/g, '');  // Remove non-digit characters
        if (value.length > 4) {
            value = value.slice(0, 4);  // Limit to 4 digits
        }
        if (value.length >= 3) {
            value = value.slice(0, 2) + '/' + value.slice(2);  // Add slash after MM
        }
        e.target.value = value;
    });

    // CVV Formatting (3 Digits)
    document.getElementById('<%= cvv.ClientID %>').addEventListener('input', function (e) {
            let value = e.target.value.replace(/\D+/g, '');  // Remove non-digit characters
            e.target.value = value.slice(0, 3);  // Limit to 3 digits
        });
    </script>
</asp:Content>
