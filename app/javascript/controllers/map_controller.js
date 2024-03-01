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


    //NEW CODE TO DELETE


    // NEW CODE TO DELETE



    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    // this.bindSearch()

    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken, mapboxgl: mapboxgl }))

  }

  #addMarkersToMap() {
    if (this.markersValue.length === 1) {

        const popup = new mapboxgl.Popup().setHTML(this.markersValue[0].map_marker_html)
        new mapboxgl.Marker()
          .setLngLat([this.markersValue[0].lng, this.markersValue[0].lat ])
          .setPopup(popup)
          .addTo(this.map)
        } else {
        this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.map_marker_html)
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }
}

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    if (this.markersValue.length === 1) {
      bounds.extend([ this.markersValue[0].lng, this.markersValue[0].lat ])
    } else {
      this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    }
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

}
