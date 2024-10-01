<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="ReloadTag.aspx.cs" Inherits="ReaVaya_Bus_System.ReloadTag" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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

    <main>
        <section>
            <div class="card">
                <h1 class="title">Reload Bus Card</h1>
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
                        <div class="notification-item">
                        <asp:Panel runat="server" CssClass="form1">
                           <div class="form-group">
    <label for="serialNumber">Serial Number:</label>
    <asp:TextBox ID="serialNumber" CssClass="form-control" runat="server" Placeholder="Enter Serial Number..." MaxLength="14"></asp:TextBox>
    <asp:RegularExpressionValidator 
        ID="SerialNumberValidator" 
        runat="server" 
        ControlToValidate="serialNumber" 
        ErrorMessage="Please enter a valid 12-digit serial number in the format #### #### ####."
        CssClass="text-danger"
        ValidationExpression="^\d{4}\s\d{4}\s\d{4}$">
    </asp:RegularExpressionValidator>
</div>
                            <div class="form-group">
                                <label for="amount">Amount:</label>
                                <asp:TextBox ID="amount" CssClass="form-control" runat="server" Placeholder="Enter Amount..."></asp:TextBox>
                            </div>
                            <asp:Label ID="EmptyText" runat="server" Text="Fill up all text boxes....." CssClass="success-label" Visible="false" ForeColor="#33CC33" />
                            <div class="form-group btn-box">
                                <asp:Button ID="reloadNewBtn" CssClass="btn2" runat="server" Text="Reload" OnClick="ReloadNewBtn_Click" />
                            </div>
                            <asp:Label ID="successLabel" runat="server" Text="Reloaded successful, redirecting..." CssClass="success-label" Visible="false" ForeColor="#33CC33" /><asp:Label ID="Label1" runat="server" Text="Registration successful, redirecting..." CssClass="success-label" Visible="false" ForeColor="#33CC33" />

                        </asp:Panel>
                    </div>
                        </div>
                    <!-- Existing Card Tab -->
                    <div class="tab-pane fade" id="existing-card" role="tabpanel" aria-labelledby="existing-card-tab">
                        <div class="notification-item">
                        <asp:Panel runat="server" CssClass="form1">
                            <div class="form-group">
                                <label for="existingCard">Select Card:</label>
                                <asp:DropDownList ID="existingCard" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ExistingCard_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label for="existingSerialNumber">Serial Number:</label>
                                <asp:TextBox ID="existingSerialNumber" CssClass="form-control" runat="server" ReadOnly="True"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="existingAmount">Amount: R</label>
                                <asp:TextBox ID="existingAmount" CssClass="form-control" runat="server" Placeholder="Enter Amount..."></asp:TextBox>
                                <asp:Label ID="currentAmount" runat="server" Visible="false" ForeColor="#FF3300" Height="4px"></asp:Label>
                            </div>
                            <div class="form-group btn-box">
                                <asp:Button ID="reloadExistingBtn" CssClass="btn2" runat="server" Text="Reload" OnClick="ReloadExistingBtn_Click" />
                            </div>
                        </asp:Panel>
                    </div>
                        </div>
                </div>
            </div>
        </section>
    </main>
    <asp:HiddenField ID="ActiveTab" runat="server" />

<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js" integrity="sha256-Zr3vByTlMGQhvMfgkQ5BtWRSKBGa2QlspKYJnkjZTmo=" crossorigin="anonymous"></script>
<script src="js/custom.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        // Set the active tab from the hidden field value
        var activeTab = $('#<%= ActiveTab.ClientID %>').val();
        if (activeTab) {
            $('#myTab a[href="' + activeTab + '"]').tab('show');
        }

        // Save the active tab to the hidden field on tab change
        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            var activeTab = $(e.target).attr('href');
            $('#<%= ActiveTab.ClientID %>').val(activeTab);
        });
    });
</script>

    <script type="text/javascript">
        document.getElementById('<%= serialNumber.ClientID %>').addEventListener('input', function (e) {
            let value = e.target.value.replace(/\s+/g, '');  // Remove all spaces
            if (value.length > 12) {
                value = value.slice(0, 12);  // Limit to 12 digits
            }
            let formattedValue = value.match(/.{1,4}/g)?.join(' ') || '';  // Add space after every 4 digits
            e.target.value = formattedValue;
        });
</script>
</asp:Content>
