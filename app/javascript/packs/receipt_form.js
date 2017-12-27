/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> and
// <%= stylesheet_pack_tag 'hello_vue' %> to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue/dist/vue.esm'
import VueResource from 'vue-resource'
import TurbolinksAdapter from 'vue-turbolinks'

Vue.use(VueResource);
Vue.use(TurbolinksAdapter);

document.addEventListener('DOMContentLoaded', () => {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  var element = document.getElementById("receipt-form")
  if (element != null) {
    var receipt = JSON.parse(element.dataset.receipt)
    var items_attributes = JSON.parse(element.dataset.itemsAttributes)
    items_attributes.forEach(function(item) { item._destroy = null })
    receipt.items_attributes = items_attributes

    const app = new Vue({
      el: element,
      data: function() {
        return { receipt: receipt }
      },
      methods: {
        addItem: function() {
          this.receipt.items_attributes.push({
            id: null,
            name: "",
            quantity: "",
            unit: "",
            price: "",
            _destroy: null
          })
        },
        saveReceipt: function() {
          // Create Receipt
          if (this.id == null) {
            this.$http.post('/receipts', { receipt: this.receipt }).then(response => {
              Turbolinks.visit(`/receipts/${response.body.id}`)
            }, response => {
              console.log(response)
            })

          // Update Receipt
          } else {
            this.$http.put(`/receipts/${this.id}`, { receipt: this.receipt }).then(response => {
              Turbolinks.visit(`/receipts/${response.body.id}`)
            }, response => {
              console.log(response)
            })
          }
        }
      }
    })
  }
})
