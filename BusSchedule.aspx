<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="BusSchedule.aspx.cs" Inherits="ReaVaya_Bus_System.BusSchedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Bus Schedule and Routes</title>

    <link href="css/custom2.css" rel="stylesheet">

    <style>
        .card {
            font-family: Arial, sans-serif;
            background-color: #FCFBF4;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        h3, h1 {
            color: green;
        }

        .btn-primary {
            margin-top: 20px;
        }
    </style>

    <body>
        <main>
            <!-- Bus Times Table -->
            <section>
                <div class="container mt-5">
                    <div class="card">
                        <h3>Bus Times Schedule</h3>
                        <table>
                            <thead>
                                <tr>
                                    <th>Day</th>
                                    <th>Time</th>
                                    <th>Frequency</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Weekdays (Mon - Fri)</td>
                                    <td>5:00 AM - 8:30 AM</td>
                                    <td>Every 5 minutes (Peak Hours)</td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>8:30 AM - 2:59 PM</td>
                                    <td>Every 15 minutes (Off-Peak Hours)</td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>3:00 PM - 9:00 PM</td>
                                    <td>Every 5 minutes (Peak Hours)</td>
                                </tr>
                                <tr>
                                    <td>Saturday</td>
                                    <td>5:00 AM - 7:00 PM</td>
                                    <td>Every 30 minutes</td>
                                </tr>
                                <tr>
                                    <td>Sunday</td>
                                    <td>6:00 AM - 7:00 PM</td>
                                    <td>Every 30 minutes</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Bus Routes Table -->
                <div class="container mt-5">
                    <div class="card">
                        <h1>Bus Routes Information</h1>
                        <table>
                            <thead>
                                <tr>
                                    <th>Phase</th>
                                    <th>Routes</th>
                                    <th>Details</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Phase 1A</td>
                                    <td>
                                        Protea Glen to Thokoza Park <br />
                                        Eldorado Park to Lakeview
                                    </td>
                                    <td>
                                        - Covers 325 km of special lanes and intersections.<br />
                                        - Feeder buses carry passengers to trunk route stations.<br />
                                        - Inner city circular route covers Hillbrow, Braamfontein, Ellis Park, and Chancellor House.<br />
                                        - 307,000 passengers traveled during the 2010 Fifa World Cup.
                                    </td>
                                </tr>
                                <tr>
                                    <td>Phase 1B</td>
                                    <td>
                                        Noordgesig to Soweto <br />
                                        Pennyville to Parktown
                                    </td>
                                    <td>
                                        - Passes through New Canada, Highgate, Auckland Park, Braamfontein, and Rissik Street.<br />
                                        - Key healthcare centers: Rahima Moosa, Helen Joseph, Charlotte Maxeke hospitals.<br />
                                        - Educational institutions: University of Johannesburg, Wits, Milpark College.<br />
                                        - Feeders run to Leaglen, Stormhill, Florida, Cresta, Yeoville, and Parktown.
                                    </td>
                                </tr>
                                <tr>
                                    <td>Phase 1C</td>
                                    <td>
                                        Louis Botha Avenue to Sandton <br />
                                        Alexandra to Sandton
                                    </td>
                                    <td>
                                        - Over 10,000 people walk between Alexandra and Sandton daily.<br />
                                        - Key infrastructure: Heritage Bridge, Rea Vaya bridge, Grayston Drive cycling bridge.<br />
                                        - 141 low-entry buses operating.<br />
                                        - Two bus depots: Alexandra and Selby.<br />
                                        - Connecting to Joburg CBD, Hillbrow, Yeoville, Orange Grove, Bramley, Wynberg, and Sandton.
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Okay" OnClick="Button1_Click" />
                    </div>
                </div>
            </section>
        </main>

        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js" integrity="sha256-Zr3vByTlMGQhvMfgkQ5BtWRSKBGa2QlspKYJnkjZTmo=" crossorigin="anonymous"></script>
        <script src="js/custom.js"></script>
    </body>
</asp:Content>
