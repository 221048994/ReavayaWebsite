<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="BusSchedule.aspx.cs" Inherits="ReaVaya_Bus_System.BusSchedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
            <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Payment Success</title>
   
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

<body>
   
        <main>
            <section>
                <div class="container mt-5">
                    <div class="card">
                        <div class="notification-item">
                            <h3 class="card-title text-success">Bus Times</h3>
                            <p class="card-text">
                                Rea Vaya operates weekdays from Monday to Friday from 5am to 9pm and weekends 5am – 6pm.
                                Buses run at a 5-minute frequency (every 5 minutes) during peak hours, 
                                which are from 5am to 08:30pm. Buses run at a 15-minute frequency (every 15 minutes) 
                                during off-peak hours, which are from 08:30am to 14:59pm. On Saturdays, buses run from
                                5am to 7pm at a 30-minute frequency (every 30 minutes).On Sundays, buses run from 
                                6am to 7pm, at a frequency of 30 minutes (every 30 minutes).
                            </p>
                            
                        </div>
                    </div>
                </div>
                 <div class="container mt-5">
                 <div class="card">
                  <div class="notification-item">
                      <h1 class="card-title text-success">Bus Routes</h1>
             <h3 class="card-title text-success">Phase 1A</h3>
             <p class="card-text">
                 Feeder buses run from :

Protea Glen to Thokoza Park and from Eldorado Park to Lakeview.

The route covers 325 kilometres of special lanes and intersections whilst feeder and complementary buses carry passengers to the trunk route stations.

The inner city circular route travels around the CBD, from Hillbrow and Braamfontein, to Ellis Park in the east and Chancellor House on the western edge of the city.

During the 2010 Fifa World Cup tournament, some 307 000 passengers travelled along the Phase 1A routes.
             </p>

                                   <h3 class="card-title text-success">Phase 1B</h3>
             <p class="card-text">
                The route starts in :

Noordgesig in Soweto, and travels through Pennyville, New Canada, Highgate, Auckland Park and Braamfontein, to Parktown, Metro Centre and Rissik Street in the CBD.

The route has made it possible for commuters to easily reach key public healthcare centres such as the Rahima Moosa, Helen Joseph and Charlotte Maxeke hospitals, as well as educational institutions such as the University of Johannesburg, Wits University, Milpark College, Parktown Boys’ High School and Barnato Park High School.

Feeders run to and from Leaglen, Stormhill, Florida, Cresta, Yeoville and Parktown.

There are also additional feeders in Soweto from Pimville and Mapetla.

These routes are now linked to the Metro Centre Rea Vaya loop, which travels to the inner city via Braamfontein.
             </p>
            

                                                         <h3 class="card-title text-success">Phase 1C</h3>
             <p class="card-text">
                Rea Vaya Phase 1 C (a) along Louis Botha Avenue to Sandton is progressing well with much of the work already having been completed to-date. Already, all 13 low floor stations are close to being completed. Three key bridges, Rea Vaya bus and pedestrian bridge located along Lees Street in Marlboro,dedicated cycling and walking bridge by Grayston Drive and Heritage bridge in the Berea area, close to the old Herbert Baker bus station have been built and ready for the operations of Rea Vaya Phase 1C (a) buses.

Over 10,000 people walk between neighbouring Alexandra and Sandton every day.

The heritage bridge is a modern, well-lit pedestrian bridge which is already being
well used by the local community. The route will have 141 low entry buses, interchange by Pan Africa connecting Rea Vaya with other modes of public transport, two depots – one in Alexandra where buses will be parked and maintained, and another in Selby will be used by the Alexandra Bus Operating company (ABC).

The introduction of Rea Vaya Phase 1 C(a) will bring safe, affordable and reliable public transport to Joburg CBD, Hillbrow, Bellevue, Yeoville, Orange Grove, Cheltondale, Highlands North, Balfour Park, Gresswold, Bramley, Wynberg, Alexandra, Marlboro, Athol, Sandton, Sandown, Longmeadow, and Greenstone
             </p>
                      <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Okay" OnClick="Button1_Click" />
         </div>
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
