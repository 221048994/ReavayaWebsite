<%@ Page Title="Ticket Report" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TicketReport.aspx.cs" Inherits="ReaVaya_Bus_System.TicketReport" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>



    <!-- Page Header -->
    <div class="container mt-5">
        <h1 class="text-center text-primary mb-4">Ticket Report</h1>

        <!-- Date Filters -->
        <div class="row mb-4">
            <div class="col-md-6">
                <label for="StartDate" class="form-label">From:</label>
                <asp:TextBox ID="StartDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label for="EndDate" class="form-label">To:</label>
                <asp:TextBox ID="EndDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <!-- Generate Report Button -->
        <div class="d-flex justify-content-center mb-5">
            <asp:Button ID="GenerateReportButton" runat="server" Text="Generate Report" CssClass="btn btn-primary btn-md" OnClick="GenerateReportButton_Click" />
        </div>

        <!-- Report Summary Section -->
        <div class="card mb-5">
            <div class="card-header text-white bg-info">
                <h2 class="text-center">Report Summary</h2>
            </div>
            <div class="card-body">
                <div class="row text-center">
                    <div class="col-md-4">
                        <p>Total Tickets Purchased:</p>
                        <p class="h4 text-success"><asp:Label ID="TotalTicketsLabel" runat="server" /></p>
                    </div>
                    <div class="col-md-4">
                        <p>Total Tickets Used:</p>
                        <p class="h4 text-danger"><asp:Label ID="UsedTicketsLabel" runat="server" /></p>
                    </div>
                    <div class="col-md-4">
                        <p>Total Income:</p>
                        <p class="h4 text-primary"><asp:Label ID="TotalIncomeLabel" runat="server" /></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Detailed Report Section -->
        <h3 class="text-center text-secondary">Detailed Report</h3>
        <div class="table-responsive">
            <asp:GridView ID="TicketsGridView" runat="server" AutoGenerateColumns="true" CssClass="table table-bordered table-striped" />
        </div>
        

        <!-- Boarding Time Analysis Section -->
<h1 class="text-center text-primary mb-4">Ticket Status Analysis</h1>
<div class="card">
    <asp:Chart ID="BoardingTimeChart" runat="server" Width="1100px" Height="400px">
        <Series>
            <asp:Series 
                Name="BoardingTimes" 
                ChartType="Pie"
                XValueMember="Status"
                YValueMembers="Count"
                IsValueShownAsLabel="True" />  
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisX Title="Ticket Status" />
                <AxisY Title="Number of Tickets" />
            </asp:ChartArea>
        </ChartAreas>
        <Legends>
            <asp:Legend Title="Ticket Status" Docking="Right" Alignment="Center" />
        </Legends>
    </asp:Chart>
</div>




    </div>

    <!-- Bootstrap and custom CSS for better aesthetics -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f7f7f7;
            font-family: 'Arial', sans-serif;
        }
        .card {
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 20px;
            margin-bottom:20px;
        }
        .table {
            margin-top: 20px;
        }
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }

        #BoardingTimeChart {
         border: 1px solid red;
        }

        .container {
          
            
        }

    </style>

</asp:Content>
