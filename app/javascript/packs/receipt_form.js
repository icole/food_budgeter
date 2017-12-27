/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> and
// <%= stylesheet_pack_tag 'hello_vue' %> to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue/dist/vue.esm'
import VueResource from 'vue-resource'

Vue.use(VueResource)

document.addEventListener('DOMContentLoaded', () => {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  var element = document.getElementById("receipt-form")
  if (element != null) {
    var receipt = JSON.parse(element.dataset.receipt)
    var item_attributes = JSON.parse(element.dataset.itemsAttributes)
    item_attributes.forEach(function(item) { item._destroy = null })
    receipt.item_attributes = item_attributes
    const app = new Vue({
      el: element,
      data: function() {
        return { receipt: receipt }
      }
    })
  }
})
