var map;
var directionsService;
var directionsRenderer;
var reaVayaStations = [
    { name: "Thokoza Park", location: { lat: -26.2363, lng: 27.9565 } },
    { name: "Lakeview", location: { lat: -26.1773, lng: 27.9943 } },
    { name: "Ellis Park", location: { lat: -26.2043, lng: 28.0544 } },
    { name: "Braamfontein", location: { lat: -26.1920, lng: 28.0326 } },
    { name: "Metro Centre", location: { lat: -26.2009, lng: 28.0379 } },
    { name: "Noordgesig", location: { lat: -26.2370, lng: 27.9715 } },
    { name: "Parktown", location: { lat: -26.1826, lng: 28.0339 } },
    { name: "Rissik Street", location: { lat: -26.2049, lng: 28.0401 } },
    { name: "Pimville", location: { lat: -26.2794, lng: 27.8692 } },
    { name: "Mapetla", location: { lat: -26.2477, lng: 27.8744 } }
];

function initMap() {
    map = new google.maps.Map(document.getElementById("map"), {
        center: { lat: -26.2041, lng: 28.0473 },
        zoom: 12
    });

    directionsService = new google.maps.DirectionsService();
    directionsRenderer = new google.maps.DirectionsRenderer();
    directionsRenderer.setMap(map);

    var originSelect = document.getElementById("origin");
    var destinationSelect = document.getElementById("destination");

    for (var i = 0; i < reaVayaStations.length; i++) {
        var option = document.createElement("option");
        option.value = i;
        option.text = reaVayaStations[i].name;
        originSelect.appendChild(option);
        destinationSelect.appendChild(option.cloneNode(true));
    }
}

function calculateRoute() {
    var originIndex = document.getElementById("origin").value;
    var destinationIndex = document.getElementById("destination").value;

    if (originIndex === "" || destinationIndex === "") {
        alert("Please select both origin and destination stations.");
        return;
    }

    var origin = reaVayaStations[originIndex].location;
    var destination = reaVayaStations[destinationIndex].location;

    var request = {
        origin: origin,
        destination: destination,
        travelMode: google.maps.TravelMode.DRIVING
    };

    directionsService.route(request, function (result, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsRenderer.setDirections(result);
        }
    });
}

function getPrice() {
    var originIndex = document.getElementById("origin").value;
    var destinationIndex = document.getElementById("destination").value;

    if (originIndex === "" || destinationIndex === "") {
        alert("Please select both origin and destination stations.");
        return;
    }

    var origin = reaVayaStations[originIndex].location;
    var destination = reaVayaStations[destinationIndex].location;

    var distanceService = new google.maps.DistanceMatrixService();
    distanceService.getDistanceMatrix({
        origins: [origin],
        destinations: [destination],
        travelMode: google.maps.TravelMode.DRIVING
    }, function (response, status) {
        if (status !== google.maps.DistanceMatrixStatus.OK) {
            alert("Error: " + status);
        } else {
            var distance = response.rows[0].elements[0].distance.value / 1000;
            var price = 0;

            $.ajax({
                type: "POST",
                url: "Pricing.aspx/CalculateTicketPrice",
                data: JSON.stringify({ distance: distance }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    price = response.d;
                    document.getElementById("price").innerText = "Ticket Price: R" + price.toFixed(2);
                    document.getElementById("price-container").style.display = "block";
                    document.getElementById("purchase-container").style.display = "block";
                }
            });
        }
    });
}

function purchaseTicket() {
    var originSelect = document.getElementById("origin");
    var destinationSelect = document.getElementById("destination");
    var price = document.getElementById("price").innerText.split("R")[1];

    var origin = originSelect.options[originSelect.selectedIndex].text;
    var destination = destinationSelect.options[destinationSelect.selectedIndex].text;

    var url = `purchase.html?origin=${encodeURIComponent(origin)}&destination=${encodeURIComponent(destination)}&price=${price}`;
    window.location.href = url;
}
