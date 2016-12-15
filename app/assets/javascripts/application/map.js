function calculateAndDisplayRoute(directionsService, directionsDisplay, destination) {
  var origin = document.getElementById('location').value;

  if (origin == '') {
    directionsDisplay.setMap(null);
    return;
  }

  directionsService.route({
    origin: origin,
    destination: destination.position,
    travelMode: jQuery('#mode button.active').attr('data-name')
  }, function(response, status) {
    if (status === 'OK') {
      jQuery('#directions_error').addClass('hide');
      directionsDisplay.setDirections(response);
    } else {
      jQuery('#directions_error .error').text(status);
      jQuery('#directions_error').removeClass('hide');
    }
  });
}

var loadMap = function(parent, origin, mode) {
  var directionsService = new google.maps.DirectionsService;
  var directionsDisplay = new google.maps.DirectionsRenderer;

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 9,
    center: {lat: 43.225224, lng: 0.912337}
  });
  directionsDisplay.setMap(map);
  console.log(map.getCenter().toUrlValue());

  var bernard = new google.maps.Marker({
    position: {lat: 43.225224, lng: 0.912337},
    map: map,
    title: 'Notre-Dame de Saint Bernard, Lieu de la cérémonie'
  });
  var bernardInfo = new google.maps.InfoWindow({
    content: '<strong>Notre-Dame de Saint Bernard</strong><br />' +
      'Lieu de la cérémonie.'
  });
  bernard.addListener('click', function() {
    bernardInfo.open(map, bernard);
  });

  var lorette = new google.maps.Marker({
    position: {lat: 43.222434, lng: 0.929848},
    map: map,
    title: 'Notre-Dame de Lorette'
  });
  var loretteInfo = new google.maps.InfoWindow({
    content: '<strong>Notre-Dame de Lorette</strong><br />' +
      'Lieu de la réception.'
  });
  lorette.addListener('click', function() {
    bernardInfo.open(map, lorette);
  });

  var onChangeHandler = function() {
    calculateAndDisplayRoute(directionsService, directionsDisplay, bernard);
  };
  jQuery('#location').keyup(function() {
    setTimeout(onChangeHandler, 1000);
  });
  jQuery('#mode button').click(function(e) {
    jQuery('#mode button').removeClass('active');
    jQuery(e.target).addClass('active');
    onChangeHandler();

    return false;
  });

  var search = 'Notre+Dame+de+Saint-Bernard,+Alan';
  var params, type;

  if (origin !== undefined && origin !== '') {
    params = '&destination=' + search + '&origin=' + origin;
    if (mode !== undefined) {
      params += '&mode=' + mode;
    }

    type = 'directions';
  } else {
    params = '&q=' + search
    type = 'place';
  }
}

jQuery(document).ready(function() {
  var apiKey = 'AIzaSyD83QHIVNb8ICtxJeyMV_Q0oAVrUhM-u8g';
  var script = jQuery('<script async defer \
    src="https://maps.googleapis.com/maps/api/js?key=' + apiKey + '&callback=loadMap"> \
    </script>').appendTo('head');

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      jQuery('#location').
        val(position.coords.latitude + ', ' + position.coords.longitude).
        keyup();
    });
  }
});
