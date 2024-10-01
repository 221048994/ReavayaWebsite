<%@ Page Title="Bus Repair Report" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BusRepairReport.aspx.cs" Inherits="ReaVaya_Bus_System.BusRepairReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Top Emergency Types</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            color: #333;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        h1 {
            text-align: center;
            color: #0073e6;
            margin-top: 20px;
        }

        .chart-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px;
        }

        .card {
            width: 90%;
            max-width: 800px;
            background-color: #fff;
            padding: 20px;
            margin: 20px auto;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .summary {
            text-align: center;
            font-size: 1.1em;
            color: #555;
            margin-top: 20px;
        }

        canvas {
            max-width: 100%;
            height: auto;
        }

        @media (max-width: 768px) {
            .card {
                padding: 10px;
                margin: 10px;
            }

            h1 {
                font-size: 1.5em;
            }

            .summary {
                font-size: 1em;
            }
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>Reported Incidents</h1>

        <div class="chart-container">
            <canvas id="emergencyChart"></canvas>
        </div>

        <div class="summary">
            <p>This chart shows the top emergency types and the number of emergencies reported. The X-axis represents emergency types, while the Y-axis shows the number of emergencies.</p>
            <p><strong>Frequent emergency types</strong> may indicate areas that require attention or improvement.</p>
        </div>

        <!-- Hidden fields to store X-axis (emergency types) and Y-axis (emergency counts) data -->
        <asp:HiddenField ID="hiddenXAxisLabels" runat="server" />
        <asp:HiddenField ID="hiddenYAxisData" runat="server" />

        <script>
            // Parse hidden field data for the chart
            const xLabels = JSON.parse(document.getElementById('<%= hiddenXAxisLabels.ClientID %>').value);
            const yData = JSON.parse(document.getElementById('<%= hiddenYAxisData.ClientID %>').value);

            // Chart.js configuration
            const ctx = document.getElementById('emergencyChart').getContext('2d');
            const emergencyChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: xLabels,
                    datasets: [{
                        label: 'Number of Incidents',
                        data: yData,
                        backgroundColor: 'rgba(54, 162, 235, 0.5)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1,
                        hoverBackgroundColor: 'rgba(54, 162, 235, 0.7)',
                        hoverBorderColor: 'rgba(54, 162, 235, 1)'
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        x: {
                            title: {
                                display: true,
                                text: 'Incident Types',
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
                                text: 'Number of Incidents',
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
                        },
                        tooltip: {
                            callbacks: {
                                label: function (tooltipItem) {
                                    return tooltipItem.dataset.label + ': ' + tooltipItem.raw + ' incidents';
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