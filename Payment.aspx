<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="ReaVaya_Bus_System.Payment" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Enter Card Details</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .container {
            margin-top: 50px;
            align-items: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center">Confirm Payment</h2>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" CssClass="text-danger">
                <ContentTemplate>
                    <!-- Top area -->
                    <div class="card mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Checkout: Ticket Book</h5>
                            <p>Ticket Number: <asp:Label ID="TicketNo" runat="server" CssClass="text-success" Visible="true"/></p>
                            <h6>Total: R <asp:Label ID="ReloadAmount" runat="server" CssClass="text-success" Visible="true" /></h6>
                        </div>
                    </div>

                    <!-- Tab Navigation -->
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="new-card-tab" data-toggle="tab" href="#new-card" role="tab" aria-controls="new-card" aria-selected="true">New Card</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="existing-card-tab" data-toggle="tab" href="#existing-card" role="tab" aria-controls="existing-card" aria-selected="false">Existing Card</a>
                        </li>
                    </ul>

                    <div class="tab-content" id="myTabContent">
                        <!-- New Card Tab -->
                        <div class="tab-pane fade show active" id="new-card" role="tabpanel" aria-labelledby="new-card-tab">
                            <asp:Panel runat="server" CssClass="form1">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">Enter new banking details</h5>
                                        <div class="form-group">
                                            <label for="nameOnCard">Name on Card</label>
                                            <asp:TextBox ID="nameOnCard" CssClass="form-control" runat="server" Placeholder="Enter Name on Card..."></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="cardNumber">Card Number</label>
                                            <asp:TextBox ID="cardNumber" CssClass="form-control" runat="server" Placeholder="Enter Card Number..."></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="expiryDate">Expiration Date</label>
                                            <asp:TextBox ID="expiryDate" CssClass="form-control" type="month" runat="server" Placeholder="MM/YY"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="cvv">CVV</label>
                                            <asp:TextBox ID="cvv" CssClass="form-control" runat="server" Placeholder="Enter CVV..."></asp:TextBox>
                                        </div>
                                        <div class="form-group text-center">
                                            <asp:Button ID="payBtn" CssClass="btn btn-primary" runat="server" Text="Pay" OnClick="payBtn_Click" />
                                        </div>
                                        <asp:Label ID="successLabel" runat="server" Text="Pay successfully, redirecting..." CssClass="text-success" Visible="false" />
                                        <asp:Label ID="errorLabel" runat="server" CssClass="text-danger" Visible="false" />
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>

                        <!-- Existing Card Tab -->
                        <div class="tab-pane fade" id="existing-card" role="tabpanel" aria-labelledby="existing-card-tab">
                            <asp:Panel runat="server" CssClass="form1">
                                <div class="form-group">
                                    <label for="existingCard">Select Bank Card:</label>
                                    <asp:DropDownList ID="existingCard" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ExistingCard_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="card mt-3">
                                    <div class="card-body">
                                        <h5 class="card-title">Pay with existing card</h5>
                                        <div class="form-group">
                                            <label for="existingNameOnCard">Name on Card</label>
                                            <asp:TextBox ID="existingNameOnCard" CssClass="form-control" runat="server" ReadOnly="True"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="existingCardNumber">Card Number</label>
                                            <asp:TextBox ID="existingCardNumber" CssClass="form-control" runat="server" ReadOnly="True"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="existingExpiryDate">Expiration Date</label>
                                            <asp:TextBox ID="existingExpiryDate" CssClass="form-control" runat="server" ReadOnly="True"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="existingCvv">CVV</label>
                                            <asp:TextBox ID="existingCvv" CssClass="form-control" runat="server" ReadOnly="True"></asp:TextBox>
                                        </div>
                                        <div class="form-group text-center">
                                            <asp:Button ID="EPaybtn" CssClass="btn btn-primary" runat="server" Text="Pay" />
                                        </div>
                                        <asp:Label ID="Label1" runat="server" Text="Pay successfully, redirecting..." CssClass="text-success" Visible="false" />
                                        <asp:Label ID="Label2" runat="server" Text="Error, please try again." CssClass="text-danger" Visible="false" />
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <asp:HiddenField ID="ActiveTab" runat="server" />
    </form>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var activeTab = $('#<%= ActiveTab.ClientID %>').val();
            if (activeTab) {
                $('#myTab a[href="' + activeTab + '"]').tab('show');
            }
            $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                var activeTab = $(e.target).attr('href');
                $('#<%= ActiveTab.ClientID %>').val(activeTab);
            });
        });
    </script>
</body>
</html>
