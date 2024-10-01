<%@ Page Title="Top 10 customers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ValuedCustomerReport.aspx.cs" Inherits="ReaVaya_Bus_System.ValuedCustomerReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Top Valued Customers</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            color: #333;
        }
        h1 {
            text-align: center;
            color: #0073e6;
        }
        .chart-container {
            display: flex;
            justify-content: center;
            margin: 20px;
        }
        #customerChart {
            background-color: white;
            padding: 20px;
            border: 1px solid #ddd;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .summary {
            text-align: center;
            margin-top: 20px;
            font-size: 1.2em;
            color: #555;
        }

.card {
  width: 80%;
  padding: 20px;
  margin-left: 140px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  border-radius: 10px;
  text-align: center;
  margin-top: 20px;
}
.card h3 {
  margin-bottom: 20px;
  color: #333;
}


.option-card h4 {
  margin-bottom: 10px;
  color: #00008B;
}
    </style>
</head>
<body>
  <div class="card">
    <h2>Top Customer Ticket Purchase Report</h2>
    <div class="chart-container">
        <canvas id="customerChart" width="463" height="463" style="display: block; box-sizing: border-box; height: 463px; width: 463px;"></canvas>
    </div>

    <div class="summary">
        <h4>This chart shows the top 10 customers and the number of tickets they purchased in the last 30 days.
        The X-axis represents the top customers, while the Y-axis shows the number of days tickets were bought.
        <br /><br />
        <strong>Customers who bought many tickets</strong> will receive a special promotion as a reward for their loyalty.
        Customers with fewer tickets purchased will be offered <strong>free tickets</strong> to encourage future purchases.</h4>
    </div>

    <!-- Hidden fields to store X-axis (customer names) and Y-axis (ticket counts) data -->
    <asp:HiddenField ID="hiddenXAxisLabels" runat="server" />
    <asp:HiddenField ID="hiddenYAxisData" runat="server" />

    <script>
        // Get hidden field values and parse them into JavaScript objects
        var xLabels = JSON.parse(document.getElementById('<%= hiddenXAxisLabels.ClientID %>').value);
        var yData = JSON.parse(document.getElementById('<%= hiddenYAxisData.ClientID %>').value);

        // Setup the bar chart using Chart.js
        var ctx = document.getElementById('customerChart').getContext('2d');
        var customerChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: xLabels,   // X-axis labels (customer names)
                datasets: [{
                    label: 'Tickets Bought in the last 30 days',
                    data: yData,   // Y-axis data (number of tickets)
                    backgroundColor: 'rgba(54, 162, 235, 0.5)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: false,  // Disable responsive resizing
                maintainAspectRatio: false,  // Prevent maintaining aspect ratio
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: 'Top Customers',
                            color: '#333',
                            font: {
                                size: 14,
                                weight: 'bold'
                            }
                        }
                    },
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: 'Number of Days',
                            color: '#333',
                            font: {
                                size: 14,
                                weight: 'bold'
                            }
                        }
                    }
                },
                plugins: {
                    legend: {
                        display: true,
                        labels: {
                            color: '#333',
                            font: {
                                size: 14
                            }
                        }
                    }
                }
            }
        });
    </script>
  </div>
</body>
</html>
</asp:Content>
