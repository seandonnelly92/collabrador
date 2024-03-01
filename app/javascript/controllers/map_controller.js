// import { Controller } from "@hotwired/stimulus"
// import mapboxgl from 'mapbox-gl' // Don't forget this!
// import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// export default class extends Controller {
//   static values = {
//     apiKey: String,
//     postcode: String
//   }

//   static targets = ["map"];

//   connect() {
//     mapboxgl.accessToken = this.apiKeyValue

//     this.map = new mapboxgl.Map({
//       container: this.element,
//       style: "mapbox://styles/mapbox/streets-v10",
//       center: [-0.1372148, 51.5048867],
//       zoom: 12,
//       speed: 1.5
//     })

//     console.log("I am connected")

//     const purpose = this.data.get("mapPurpose");

//     if (purpose === "general") {
//       this.setupGeneralMap();
//     } else if (purpose === "specific") {
//       this.setupSpecificMap();
//     }

//     this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken, mapboxgl: mapboxgl }))
//   }

//   setupGeneralMap() {
//     // General map setup code
//     this.addMarkersToMap(); // Add markers to the map
//     this.fitMapToMarkers(); // Fit map bounds to markers
//   }

//   setupSpecificMap() {
//     // Specific map setup code
//     const postcode = this.data.get("postcode");
//     // You can use the postcode to set up your map accordingly
//     // Example: You can use Geocoding API to get coordinates for the given postcode and then set the map center accordingly
//     // For demonstration, let's assume the coordinates are hardcoded here
//     const coordinates = [-0.1372148, 51.5048867]; // Example coordinates
//     this.map.setCenter(coordinates);
//     // You can also add a marker for the specific location
//     new mapboxgl.Marker()
//       .setLngLat(coordinates)
//       .addTo(this.map);
//   }

//   addMarkersToMap() {
//     // Retrieve markers data
//     const markers = JSON.parse(this.element.getAttribute("data-map-markers-value"));

//     // Add markers to the map
//     markers.forEach((marker) => {
//       const popup = new mapboxgl.Popup().setHTML(marker.map_marker_html);
//       new mapboxgl.Marker()
//         .setLngLat([marker.lng, marker.lat])
//         .setPopup(popup)
//         .addTo(this.map);
//     });
//   }

//   fitMapToMarkers() {
//     // Fit map bounds to markers
//     const bounds = new mapboxgl.LngLatBounds();
//     const markers = JSON.parse(this.element.getAttribute("data-map-markers-value"));
//     markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
//     this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
//   }
// }








//NEW CODE BELOW!


// app/javascript/controllers/map_controller.js
import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  static targets = ["map"];

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [-0.1372148, 51.5048867],
      zoom: 12,
      speed: 1.5
    })

    console.log("I am connected")



    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    // this.bindSearch()

    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken, mapboxgl: mapboxgl }))

  }


  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.map_marker_html)
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  // search(event) {
  //   event.preventDefault();
  //   const postcode = this.postcodeInputTarget.value;
  //   console.log(postcode)
  //   console.log("Post code:", postcode);


//   def search
//   # Retrieve the postcode from the query parameters
//   @postcode = params[:postcode]
//   # Additional logic to handle the search (e.g., geocoding)
//   # Pass the postcode to the view for rendering the map
//   @markers = your_method_to_get_markers_based_on_postcode(@postcode)
// end

  // bindSearch() {

  //   const searchButton = this.element.querySelector('#searchButton'); // Get the button inside the controller's element
  //   console.log(searchButton)
  //   const postcodeInput = this.element.querySelector('#postcodeInput'); // Get the input field inside the controller's element
  //   console.log(postcodeInput)

  //   searchButton.addEventListener('click', async () => {
  //     console.log("Postcode collected")
  //     const postcode = postcodeInput.value;

  //     const coordinates = await this.geocodePostcode(postcode);

  //     if (coordinates) {
  //       this.map.setCenter(coordinates);
  //     } else {
  //       alert('Invalid postcode. Please enter a valid postcode.');
  //     }
  //   });
// }

// async geocodePostcode(postcode) {
//   try {
//     const response = await fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${postcode}.json?access_token=${mapboxgl.accessToken}`);
//     const data = await response.json();

//     // Log the response to the console
//     console.log('Geocoding API response:', data);

//     if (data.features.length > 0) {
//       const coordinates = data.features[0].center
//       return { lng: coordinates[0], lat: coordinates[1] }
//     } else {
//       return null
//     }
//   } catch (error) {
//     console.error('Error geocoding postcode:', error)
//     return null
//   }
// }

}
