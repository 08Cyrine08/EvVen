import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
   }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: 'mapbox://styles/mapbox/streets-v12', // style URL
    });
    this.#addMarkersToMap()
  }

  #addMarkersToMap() {
    this,markersValue.forEach((marker) => {
      popup.setLngLat([-122.4194, 37.7749]);
    })
  }
}
