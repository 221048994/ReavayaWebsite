<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="Pricing.aspx.cs" Inherits="ReaVaya_Bus_System.Pricing" %>

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

    <title>Calculate Price</title>
<style>
    body {
        font-family: 'Poppins', sans-serif;
        background-color: #f4f4f4;
        color: #333;
        margin: 0;
        padding: 0;
    }


    .container2 {
        width: 80%;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    h1 {
        font-size: 2em;
        color: #007bff;
        margin: 20px 0;
    }

    #map-container {
        width: 100%;
        display: flex;
        justify-content: space-between;
        gap: 20px;
        margin-bottom: 0; /* Remove bottom margin */
    }

    #map {
        height: 500px;
        width: 70%;
        border: 2px solid #ccc;
        border-radius: 10px;
    }

    #input-container {
        width: 25%;
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    label {
        font-weight: 600;
    }

    select, button {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
        box-sizing: border-box;
    }

    select:focus, button:focus {
        border-color: #007bff;
        outline: none;
    }

 
    #price-container {
        display: none;
        width: 100%;
        border: 2px solid #ccc;
        border-radius: 10px;
        padding: 10px;
        margin-top: 10px; /* Adjusted margin for spacing */
        background-color: #f9f9f9;
    }

    #price-list {
        list-style-type: none;
        padding: 0;
    }

    #price-list li {
        margin-bottom: 10px;
    }

    .list-item {
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 10px;
        margin-bottom: 5px;
    }

    .list-item:nth-child(odd) {
        background-color: #eef;
    }

    .list-item:nth-child(even) {
        background-color: #ffe;
    }

    .price {
        color: red;
        font-weight: bold;
    }

    .PurchaseBtn {
        display: none;
        padding: 10px 20px;
    background-color: #007bff;
    color: white;
    text-align: center;
    border-radius: 5px;
    }

    .info {
        color: #333;
    }
    .hero_area {
        height: 100px;
    }
    .getPriceBtn {
        padding: 10px 20px;
    background-color: #007bff;
    color: white;
    text-align: center;
    border-radius: 5px;
    }

                    .card {
    font-family: Arial, sans-serif;
    background-color:#FCFBF4 ;
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
    <h1>Rea Vaya Route & Pricing</h1>
    <div id="map-container">
        <div id="input-container">
            <label for="origin">Origin:</label>
<select id="origin">
    <option value="">Select origin station</option>
</select>

<label for="destination">Destination:</label>
<select id="destination">
    <option value="">Select destination station</option>
</select>

            <input type="hidden" id="selectedOrigin" name="selectedOrigin" />
<input type="hidden" id="selectedDestination" name="selectedDestination" />
<input type="hidden" id="priceValue" name="priceValue" />


            <asp:Button ID="getPriceBtn" runat="server" Text="Get Route and Price" CssClass="btn btn-primary" OnClientClick="getRouteAndPrice(); return false"/>
            <div id="price-container">
                <ul id="price-list">
                    <li class="list-item price" id="price"></li>
                    <li class="list-item info" id="additional-info"></li>
                </ul>
                <asp:Button ID="PurchaseBtn" runat="server" Text="Buy Ticket" CssClass="btn btn-primary" OnClientClick="purchaseTicket(); return false" OnClick="PurchaseBtn_Click" />
            </div>
            
        </div>
        <div id="map"></div>
    </div>
</div>

<script>
    var map;
    var directionsService;
    var directionsRenderer;
    var price = 0;
    var originSelect = '';
    var destinationSelect = '';

    var reaVayaStations = [
        { name: "Thokoza Park", location: { lat: -26.2363, lng: 27.9565 } },
        { name: "Ellis Park", location: { lat: -26.2043, lng: 28.0544 } },
        { name: "Braamfontein", location: { lat: -26.1920, lng: 28.0380 } },
        { name: "Metro Centre", location: { lat: -26.2009, lng: 28.0379 } },
        { name: "Noordgesig", location: { lat: -26.2370, lng: 27.9715 } },
        { name: "Parktown", location: { lat: -26.1826, lng: 28.0339 } },
        { name: "Rissik Street", location: { lat: -26.2049, lng: 28.0401 } },
        { name: "Pimville", location: { lat: -26.2794, lng: 27.8692 } },
        { name: "Mapetla", location: { lat: -26.2477, lng: 27.8744 } }
    ];

    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
            center: { lat: -26.2041, lng: 28.0473 },
            zoom: 11
        });

        directionsService = new google.maps.DirectionsService();
        directionsRenderer = new google.maps.DirectionsRenderer();
        directionsRenderer.setMap(map);

        // Create markers for each Rea Vaya station
        reaVayaStations.forEach(function (station) {
            var marker = new google.maps.Marker({
                position: station.location,
                map: map,
                title: station.name
            });
        });

        originSelect = document.getElementById('origin');
        destinationSelect = document.getElementById('destination');

        reaVayaStations.forEach(function (station) {
            var option = document.createElement('option');
            option.text = station.name;
            option.value = station.name;
            originSelect.add(option);
            destinationSelect.add(option.cloneNode(true));
        });
    }

    function getRouteAndPrice() {
        var origin = document.getElementById('origin').value;
        var destination = document.getElementById('destination').value;

        var request = {
            origin: origin,
            destination: destination,
            travelMode: 'TRANSIT',
            transitOptions: {
                modes: ['BUS']
            }
        };

        directionsService.route(request, function (response, status) {
            if (status === 'OK') {
                directionsRenderer.setDirections(response);
                var distance = response.routes[0].legs[0].distance.value / 1000; // in kilometers
                console.log("Distance calculated: " + distance.toFixed(2) + " km");

                price = calculateTicketPrice(distance);
                console.log("Price calculated: R" + price.toFixed(2));

                // Update the hidden fields with selected values
                document.getElementById('selectedOrigin').value = origin;
                document.getElementById('selectedDestination').value = destination;
                document.getElementById('priceValue').value = price.toFixed(2);

                var list = document.getElementById('price-list');
                list.innerHTML = ''; // Clear previous items

                // Add distance
                var distanceItem = document.createElement('li');
                distanceItem.textContent = "Distance: " + distance.toFixed(2) + " km";
                list.appendChild(distanceItem);

                // Add ticket price
                var priceItem = document.createElement('li');
                priceItem.textContent = "Ticket Price: R" + price.toFixed(2);
                list.appendChild(priceItem);

                var additionalInfo = [
                    { description: "Penalty Fees (may occur)", price: 30.00 },
                    { description: "Penalty Inspection", price: 110.00 }
                ];

                // Add additional information
                additionalInfo.forEach(function (info) {
                    var infoItem = document.createElement('li');
                    infoItem.textContent = info.description + ": R" + info.price.toFixed(2);
                    list.appendChild(infoItem);
                });

                document.getElementById('price-container').style.display = 'block';
                document.getElementsByClassName('PurchaseBtn').style.display = 'block';
            } else {
                alert('Error: ' + status);
            }
        });
    }



    function calculateTicketPrice(distance) {
        if (distance <= 5) {
            return 10.00;
        } else if (distance <= 10) {
            return 12.50;
        } else if (distance <= 15) {
            return 15.00;
        } else if (distance <= 25) {
            return 17.00;
        } else if (distance <= 35) {
            return 19.00;
        } else if (distance <= 45) {
            return 20.00;
        } else {
            return 26.00;
        }
    }


</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhD07eGiPvFnBCZ-9cLuTNVj6OuRpaZjg&callback=initMap&libraries=places" defer></script>
</asp:Content>
