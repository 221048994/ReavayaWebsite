<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseTicket.aspx.cs" Inherits="ReaVaya_Bus_System.PurchaseTicket" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Purchase Ticket</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript">
        function updatePrice() {
            __doPostBack('<%= ddlQuantity.UniqueID %>', '');
        }
    </script>
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
        <h2 class="text-center">Purchase Ticket</h2>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" CssClass="text-danger">
            <ContentTemplate>
                <div class="form-group">
                    <label for="txtOrigin">Origin:</label>
                    <asp:TextBox ID="txtOrigin" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtDestination">Destination:</label>
                    <asp:TextBox ID="txtDestination" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="ddlQuantity">Quantity:</label>
                    <asp:DropDownList ID="ddlQuantity" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlQuantity_SelectedIndexChanged" onchange="updatePrice()">
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="txtPrice">Price:</label>
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                </div>
                <div class="form-group text-center">
                    <asp:Button ID="btnPurchase" runat="server" Text="Purchase" CssClass="btn btn-primary" OnClick="btnPurchase_Click" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
