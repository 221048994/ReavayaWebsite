<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="TrackBus.aspx.cs" Inherits="ReaVaya_Bus_System.TrackBus" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Basic -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <!-- Site Metas -->
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Bus Tracking</title>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }

        .container2 {
            width: 90%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #map-container {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            width: 100%;
            margin-top: 20px;
        }

        #map {
            height: 500px;
            width: 70%;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display:none;
        }

        #input-container {
            width: 65%;
            background-color:floralwhite;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        #input-container label {
            font-size: 14px;
            color: #555;
            margin-bottom: 8px;
            display: block;
        }

        #input-container select,
        #input-container button {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ddd;
            font-size: 14px;
            color: #333;
        }

        #input-container button {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        #input-container button:hover {
            background-color: #0056b3;
        }

        #tracking-info {
            display: none;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color:floralwhite;
        }

        #tracking-info ul {
            list-style: none;
            padding: 0;
        }

        #tracking-info ul li {
            margin-bottom: 5px;
            font-size: 14px;
        }

        h1 {
            font-size: 24px;
            color: #333;
        }

                        .card {
    font-family: Arial, sans-serif;
    background-color: #FCFBF4;
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

<div class="card">
    <h1><center>Rea Vaya Bus Tracking</center></h1>
    <div id="map-container">
        <div id="input-container"  style=" margin-left: 200px;">
            <label for="origin">Origin:</label>
            <select id="origin" aria-label="Select origin station">
                <option value="">Select origin station</option>
            </select>

            <label for="destination">Destination:</label>
            <select id="destination"  aria-label="Select destination station">
                <option value="">Select destination station</option>
            </select>
            <hr>
            <div>
                 <asp:Button ID="trackBusBtn" runat="server" Text="Track Bus" CssClass="btn btn-primary" OnClientClick="trackBus(); return false" />
            </div>
            <div id="tracking-info">
                <ul id="tracking-list">
                    <!-- List of buses and their estimated arrival times will be populated here -->
                </ul>
            </div>
        </div>
        <div id="map"></div>
    </div>
</div>

<script>
    var map;
    var directionsService;
    var directionsRenderer;
    var busMarkers = [];
    var reaVayaStations = [
        { name: "Thokoza Park", location: { lat: -26.2363, lng: 27.9565 } },
        { name: "Lakeview", location: { lat: -26.1773, lng: 27.9943 } },
        { name: "Ellis Park", location: { lat: -26.2043, lng: 28.0544 } },
        { name: "Braamfontein", location: { lat: -26.1920, lng: 28.0380 } },
        { name: "Metro Centre", location: { lat: -26.2009, lng: 28.0379 } },
        { name: "Noordgesig", location: { lat: -26.2370, lng: 27.9715 } },
        { name: "Parktown", location: { lat: -26.1826, lng: 28.0339 } },
        { name: "Rissik Street", location: { lat: -26.2049, lng: 28.0401 } },
        { name: "Pimville", location: { lat: -26.2794, lng: 27.8692 } },
        { name: "Mapetla", location: { lat: -26.2477, lng: 27.8744 } }
    ];

    var reaVayaBuses = [
        { id: "Bus1", name: "T1", location: { lat: -26.2043, lng: 28.0456 } },
        { id: "Bus2", name: "T2", location: { lat: -26.2023, lng: 28.0406 } },

        { id: "Bus3", name: "T4", location: { lat: -26.2100, lng: 28.0500 } },
        { id: "Bus4", name: "T3", location: { lat: -26.2150, lng: 28.0550 } },
        { id: "Bus5", name: "T11", location: { lat: -26.2200, lng: 28.0600 } }

    ];

    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
            center: { lat: -26.2041, lng: 28.0473 },
            zoom: 11
        });

        directionsService = new google.maps.DirectionsService();
        directionsRenderer = new google.maps.DirectionsRenderer();
        directionsRenderer.setMap(map);

        var originSelect = document.getElementById('origin');
        var destinationSelect = document.getElementById('destination');

        reaVayaStations.forEach(function (station) {
            var option = document.createElement('option');
            option.text = station.name;
            option.value = station.name;
            originSelect.add(option);
            destinationSelect.add(option.cloneNode(true));
        });

        // Pre-select origin and destination if provided in the query string
        var urlParams = new URLSearchParams(window.location.search);
        var origin = urlParams.get('depart');
        var destination = urlParams.get('destination');

        if (origin) {
            originSelect.value = origin;
        }
        if (destination) {
            destinationSelect.value = destination;
        }
    }

    function trackBus() {
        var origin = document.getElementById('origin').value;
        var destination = document.getElementById('destination').value;

        if (!origin || !destination) {
            alert('Please select origin and destination.');
            return;
        }

        var originLocation = reaVayaStations.find(station => station.name === origin).location;
        var destinationLocation = reaVayaStations.find(station => station.name === destination).location;

        var request = {
            origin: originLocation,
            destination: destinationLocation,
            travelMode: 'TRANSIT',
            transitOptions: {
                modes: ['BUS']
            }
        };

        directionsService.route(request, function (response, status) {
            if (status === 'OK') {
                directionsRenderer.setDirections(response);

                // Clear existing bus markers
                busMarkers.forEach(marker => marker.setMap(null));
                busMarkers = [];

                // Determine a random number of buses to show (between 1 and 5)
                var numberOfBuses = Math.floor(Math.random() * 5) + 1; // Random number between 1 and 5

                // Randomly select buses from the array
                var selectedBuses = [];
                while (selectedBuses.length < numberOfBuses) {
                    var randomIndex = Math.floor(Math.random() * reaVayaBuses.length);
                    var bus = reaVayaBuses[randomIndex];
                    if (!selectedBuses.includes(bus)) {
                        selectedBuses.push(bus);
                    }
                }

                // Calculate and sort estimated arrival times
                var estimatedTimes = [];
                var route = response.routes[0].overview_path;
                selectedBuses.forEach(function (bus) {
                    var randomIndex = Math.floor(Math.random() * route.length);
                    var busLocation = route[randomIndex];

                    var marker = new google.maps.Marker({
                        position: busLocation,
                        map: map,
                        icon: 'http://maps.google.com/mapfiles/ms/icons/bus.png'
                    });
                    busMarkers.push(marker);

                    var distance = google.maps.geometry.spherical.computeDistanceBetween(
                        new google.maps.LatLng(originLocation.lat, originLocation.lng),
                        busLocation
                    ) / 1000; // Convert to kilometers

                    var estimatedTime = getEstimatedTime(distance);
                    estimatedTimes.push(estimatedTime);
                });

                // Sort the estimated times
                estimatedTimes.sort(function (a, b) {
                    return new Date('1970/01/01 ' + a) - new Date('1970/01/01 ' + b);
                });

                // Display the estimated arrival times
                var trackingInfo = document.getElementById('tracking-info');
                var trackingList = document.getElementById('tracking-list');
                trackingList.innerHTML = '';

                estimatedTimes.forEach(function (time) {
                    var listItem = document.createElement('li');
                    listItem.innerHTML = `Estimated Arrival Time: ${time}`;
                    trackingList.appendChild(listItem);
                });

                trackingInfo.style.display = 'block';

                directionsRenderer.setOptions({
                    polylineOptions: {
                        strokeColor: 'blue'
                    }
                });
            } else {
                alert('Error: ' + status);
            }
        });
    }


    function getEstimatedTime(distance) {
        // Assuming average speed of the bus in kilometers per hour (km/h)
        var averageSpeed = 80; // Adjust this value according to your actual bus speed

        // Calculate estimated travel time in hours
        var travelTimeHours = distance / averageSpeed;

        // Convert travel time to milliseconds
        var travelTimeMs = travelTimeHours * 60 * 60 * 1000;

        // Calculate estimated arrival time
        var now = new Date();
        var arrivalTime = new Date(now.getTime() + travelTimeMs);

        return arrivalTime.toLocaleTimeString();
    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB4ZFRAknFQe3K7YTbGdKRJ7VJf8ezbnqc&callback=initMap&libraries=places" defer></script>
</asp:Content>
