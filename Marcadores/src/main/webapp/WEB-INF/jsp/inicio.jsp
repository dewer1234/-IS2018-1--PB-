<%-- 
    Document   : home-admin
    Created on : May 2, 2017, 11:17:09 AM
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
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/iniciocss.css"/> ">
        <title>Home</title>
    </head>
    <body>
        
        <div class="contenedor">
            <header>
                <form action="/Ejercicio1-Marcadores/agregaMarcador"> 
                    <button id="btnSes" class="btn btn-primary btn-lg" >Agrega un marcador</button>
                </form>
            </header>
    
            <section class="main">
                <div id="mapa"></div>
            </section>
            
            <aside>
                
                <table class="table">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Latitud</th>
                            <th>Longitud</th>
                            <th>Actualiza</th>
                        </tr>
                    </thead>
                    <c:forEach var="m" items="${marcadores}">
                        <tbody>
                            <th>${m.nombre}</th>
                            <th>${m.latitud}</th>
                            <th>${m.longitud}</th>
                            <th>
                                <form action="/Ejercicio1-Marcadores/actualizaM" method="GET">
                                    <input id="latitud" name="latitud" hidden="true" value="${m.latitud}">
                                    <input id="longitud" name="longitud" hidden="true" value="${m.longitud}">
                                    <button type="submit" class="btn btn-primary btn-lg active">Actualiza</button>
                                </form> 
                            </th>
                       </tbody>

                    </c:forEach>
                </table>
            
            </aside>
         </div>
        <script>
            
            function ventanaInfo(des,lat,lon,nom) {
                var coso = '<div id="content">'+
                           '<div id="siteNotice">'+
                           '</div>'+
                            '<h1 id="firstHeading" class="firstHeading">'+nom+'</h1>'+
                            '<div id="bodyContent">'+
                             '<p>'+des+'</p>'+
                             '<form action="/Marcadores/eliminaMarcador" method="GET">'+
                             '<input id="latitud" name="latitud" hidden="true" value="'+lat+'">'+
                             '<input id="longitud" name="longitud" hidden="true" value="'+lon+'">'+
                             '<button type="submit" class="btn btn-primary btn-lg active">Eliminame</button>'+
                             '</form>' +
                            '</div>'+
                           '</div>';   
                return coso;
            }
            
            var map;
            function initMap() {
            
            
            markerLat = [
                <c:forEach var="s" items="${marcadores}" varStatus="status">
                    <c:out value="${s.latitud}"/>,
                </c:forEach>];
            markerLong = [
                <c:forEach var="s" items="${marcadores}" varStatus="status">
                <c:out value="${s.longitud}"/>,
                </c:forEach>];
            
            markerName = [
                <c:forEach var="s" items="${marcadores}" varStatus="status">
                "${s.nombre}",
                </c:forEach>];
            
            markerDescr = [
                <c:forEach var="s" items="${marcadores}" varStatus="status">
                "${s.descripcion}",
                </c:forEach>];
    
            map = new google.maps.Map(document.getElementById('mapa'), {
                center: {lat: 19.323447, lng: -99.179521},
                zoom: 3
            });
    
            var infowindow = new google.maps.InfoWindow(); 
            var marker, i;

            for (i = 0; i < markerLat.length; i++) {
                marker = new google.maps.Marker({
                    position: new google.maps.LatLng(markerLat[i], markerLong[i]),
                    map: map,
                    title:markerName[i]
                });

                google.maps.event.addListener(marker, 'click', (function(marker, i) {
                return function() {
                    infowindow.setContent(ventanaInfo(markerDescr[i],markerLat[i],markerLong[i],markerName[i]));
                    infowindow.open(map, marker);
                }})(marker, i));
            
    
            }
            google.maps.event.addDomListener(window, 'load', initMap);
        }
        
        </script>
        <!-- Latest compiled and minified JavaScript -->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
        <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCug-PSCy85c1e2cPnPVzRGgdCK8RSMbdg&callback=initMap">
        </script>
        
    </body>
</html>
