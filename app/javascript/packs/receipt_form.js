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

document.addEventListener('turbolinks:load', () => {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  var element = document.getElementById("receipt-form");
  if (element != null) {
    var id = element.dataset.id;
    var receipt = JSON.parse(element.dataset.receipt);
    var receipt_items_attributes = JSON.parse(element.dataset.receiptItemsAttributes);
    receipt_items_attributes.forEach(function(item) { item._destroy = null });
    receipt.receipt_items_attributes = receipt_items_attributes;

    const app = new Vue({
      el: element,
      data: function() {
        return { id: id, receipt: receipt }
      },
      methods: {
        addItem: function() {
          this.receipt.receipt_items_attributes.push({
            id: null,
            name: "",
            quantity: "",
            unit: "",
            price: "",
            _destroy: null
          })
        },
        removeItem: function(index) {
          var item = this.receipt.receipt_items_attributes[index];

          if (item.id == null) {
            this.receipt.receipt_items_attributes.splice(index, 1);
          } else {
            this.receipt.receipt_items_attributes[index]._destroy = "1";
          }
        },
        undoRemove: function(index) {
          if (this.id == null) {
            this.receipt.receipt_items_attributes.splice(index, 1);
          } else {
            this.receipt.receipt_items_attributes[index]._destroy = null;
          }
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
});
