<%-- 
    Document   : agregaMarcador
    Created on : May 2, 2017, 11:48:37 AM
    Author     : jonathan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/agregaM.css"/> ">
        <title>Agrega Marcador</title>



    </head>
    <body>
        <div class="contenedor">
            <header>
                
            </header>
    
            <section class="main">
                <div id="mapa"></div>
            </section>
            
            <aside>
                <b>Closest matching address:</b>
                <div id="address"></div>
                <b>Current position:</b>
                <form action="/Marcadores/guardaMarcador" method="GET">
                    <input id ="latitud" name = "latitud"  readonly="readonly" >
                    <input id ="longitud" name = "longitud"  readonly="readonly" >
                    <input name = "nombre"  placeholder="Nombre del punto" required="true">
                    <br>
                    <input name = "descripcion"   type="text"  placeholder="Descripcion" required="true"  style=" height: 80px ">
                    <br>
                    <button id="btnSes" class="btn btn-primary btn-lg">Agrega Marcador</button>
      
                </form>
            
           </aside>
    </div>
  

  
    <script>


    function geocodePosition(pos) {
      geocoder.geocode({
        latLng: pos
      }, function(responses) {
        if (responses && responses.length > 0) {
          updateMarkerAddress(responses[0].formatted_address);
        } else {
          updateMarkerAddress('Cannot determine address at this location.');
        }
      });
    }



    function updateMarkerPosition(latLng) {

      document.getElementById('latitud').value=latLng.lat();
      document.getElementById('longitud').value=latLng.lng();
    }

    function updateMarkerAddress(str) {
      document.getElementById('address').innerHTML = str;
    }
    var map;
    var latLng;
    var geocoder;
    function initialize() {
      geocoder = new google.maps.Geocoder();
      latLng = new google.maps.LatLng(19.323447, -99.179521);
      map = new google.maps.Map(document.getElementById('mapa'), {
        zoom: 17,
        center: latLng,

      });
      marker = new google.maps.Marker({
        position: latLng,
        title: 'Point A',
        map: map,
        draggable: true
      });

      // Update current position info.
      updateMarkerPosition(latLng);
      geocodePosition(latLng);

      // Add dragging event listeners.
      google.maps.event.addListener(marker, 'dragstart', function() {
        updateMarkerAddress('Dragging...');
      });

      google.maps.event.addListener(marker, 'drag', function() {
        updateMarkerPosition(marker.getPosition());
      });

      google.maps.event.addListener(marker, 'dragend', function() {
        geocodePosition(marker.getPosition());
      });



    }

    </script>
    
    <!-- Latest compiled and minified JavaScript -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCug-PSCy85c1e2cPnPVzRGgdCK8RSMbdg&callback=initialize">
    </script>
</body>
</html>
