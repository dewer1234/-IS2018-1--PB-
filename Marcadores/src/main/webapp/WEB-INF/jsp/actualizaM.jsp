<%-- 
    Document   : actualizaM
    Created on : May 30, 2017, 12:22:24 PM
    Author     : jonathan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/actualizacss.css"/> ">
        <title>Actualiza</title>
    </head>
    <body>
        <h1 style=" text-align: center;color: white">Actualiza todo si quieres!</h1>
        <div class="contenedor">
            <header>
                
            </header>
            <section class="main">
                <div id="mapa"></div>
            </section>
            <aside>
                
                <form action="/Ejercicio1-Marcadores/actualizar" method="POST">
                    <input id="id" name="id" hidden="true" value="${marcador.marcadorid}"><br>
                    <input id="nombre" name="nombre"   placeholder="${marcador.nombre}"><br>
                    <input id="latitud" name="latitud" readonly="readonly" placeholder="${marcador.latitud}"><br>
                    <input id="longitud" name="longitud" readonly="readonly" placeholder="${marcador.longitud}"><br>
                    <input id="desc" name="desc"  placeholder="${marcador.descripcion}"><br>
                    <button type="submit" class="btn btn-primary btn-lg active">Actualizame</button>
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

            
            var map;
            var latLng;
            var geocoder;
            function initialize() {
              geocoder = new google.maps.Geocoder();
              latLng = new google.maps.LatLng(${marcador.latitud},${marcador.longitud});
              map = new google.maps.Map(document.getElementById('mapa'), {
                zoom: 3,
                center: latLng,

              });
              marker = new google.maps.Marker({
                position: latLng,
                title: '${marcador.latitud},${marcador.longitud}',
                map: map,
                draggable: true
              });

              // Update current position info.
              geocodePosition(latLng);

              

              google.maps.event.addListener(marker, 'drag', function() {
                updateMarkerPosition(marker.getPosition());
              });

              google.maps.event.addListener(marker, 'dragend', function() {
                geocodePosition(marker.getPosition());
              });



            }

        </script>
        <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCug-PSCy85c1e2cPnPVzRGgdCK8RSMbdg&callback=initialize">
        </script>
    </body>
</html>
