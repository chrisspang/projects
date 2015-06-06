
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
  if map_add_marker? and map_add_marker == 1
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

# In show.html.erb we want to activate the first blurb in the nav
$ ->
  $(".nav-tab-bar:first").addClass('active')  
  $(".tab-pane:first").addClass('active')

# http://stackoverflow.com/questions/18770517/rails-4-how-to-use-document-ready-with-turbo-links
# 
#$(document).ready(ready)
#$(document).on('page:load', ready)

# In index.html.erb we want to allow autocomplete

buildSearch = (tag) ->
  remote_url = tag.data('remote')
  console.log(remote_url)
  
  projects = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
#    prefetch: remote_url, # '../data/films/post_1960.json',
    remote: {
      url: "#{remote_url}?a=%QUERY",       # '../data/films/queries/%QUERY.json',
      wildcard: '%QUERY'
    }
  })
  
#  $('#bloodhound .typeahead').typeahead({
  tag.typeahead({
    hint: true,
    highlight: true,
    minLength: 1
  },
  {
    name: 'projects',
    display: 'value',
    source: projects,
    async: true,
    limit: 10,
  })

$ ->
  tag = $('#bloodhound .typeahead')
  if tag?
    buildSearch(tag)
