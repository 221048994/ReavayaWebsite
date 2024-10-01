<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Purchase.aspx.cs" Inherits="ReaVaya_Bus_System.Purchase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Buy Bus Ticket</h1>
                    <asp:Panel runat="server" CssClass="form1">
                        <div class="form-group">
                            <label for="station">Station from:</label>
                            <asp:DropDownList ID="stationFrom" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Station_SelectedIndexChanged">
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
                            <label for="station">Station To:</label>
                            <asp:DropDownList ID="stationTo" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Station_SelectedIndexChanged">
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
                            <label for="amount">Trip Amount: R</label>
                            <asp:Label ID="amount" runat="server" ForeColor="Green" Visible="True"></asp:Label>
                        </div>
                        <%--<div class="form-group">
                            <label for="quantity">Quantity:</label>
                            <asp:TextBox ID="quantity" CssClass="form-control" runat="server" Placeholder="Enter Quantity..."></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="calculateBtn" CssClass="btn2" runat="server" Text="Calculate" OnClick="CalculateBtn_Click" />
                        </div>
                        <asp:Label ID="feeLabel" runat="server" Text="You are charged a booking fee of R10." ForeColor="Red" Visible="True"></asp:Label>--%>
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
                            <asp:Button ID="placeOrderBtn" CssClass="btn2" runat="server" Text="Buy" OnClick="PlaceOrderBtn_Click" />
                        </div>

                    </asp:Panel>
</asp:Content>
