
# Our Gmaps (gmaps4rails) instance
gmap_handler = null
# The google.maps.Marker currently showing (if there is one)
marker = null

# Create a map to bind to the 'map' div and show
# 'markers' map markers
buildMap = (markers) ->
  gmap_handler = Gmaps.build('Google')
  gmap_handler.buildMap({
    provider: {
      mapTypeId: google.maps.MapTypeId.HYBRID
    },
    internal: {
       id: 'map'
    }
    }, ->
      markers = gmap_handler.addMarkers(markers)
      gmap_handler.bounds.extendWith(markers)
      gmap_handler.fitMapToBounds()
      if markers.length == 1
        gmap_handler.getMap().setZoom(16)
    )

# Create a map marker and display it
placeMarker = (latLng) ->
  if marker?
    marker.setMap(null)

  marker = new google.maps.Marker({
    position: latLng
    map: gmap_handler.getMap()
  })


$ ->
  if map_markers?
    buildMap(map_markers)

  # If map_add_marker==1 then listen for single clicks and
  # place a map marker under them. Also update our form lat/long.
  if map_add_marker
    google.maps.event.addListener gmap_handler.getMap(), 'click', (event) ->
      placeMarker(event.latLng)

      $('#project_latitude').val( event.latLng.lat().toFixed(6) )
      $('#project_longitude').val( event.latLng.lng().toFixed(6) )

  # Listen for clicks on hrefs asking us to zoom to a
  # given lat/long
  $("a[data-map-lat]").click (e) ->
    e.preventDefault()

    lat  = $(this).data("map-lat")
    long = $(this).data("map-long")

    point = new google.maps.LatLng(lat, long)

    gmap_handler.getMap().setZoom(10)
    gmap_handler.getMap().panTo(point)
