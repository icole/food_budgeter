require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  before(:all) do
    @product = Product.create!(sku: '1234567', name: 'Chicken')
    @receipt = Receipt.create!(store: "Madison Co-op", base_amount: 30.00, tax_amount: 2.00, total_amount: 32.00, purchased_at: DateTime.now)
  end

  # This should return the minimal set of attributes required to create a valid
  # Item. As you add validations to Item, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { quantity: 1.5, unit: 'lbs', price: 12.0, product_id: @product.id, receipt_id: @receipt.id }
  }

  let(:invalid_attributes) {
    { quantity: 1.5, unit: 'lbs', price: 12.0, product_id: nil, receipt_id: nil }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ItemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      item = Item.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      item = Item.create! valid_attributes
      get :show, params: {id: item.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      item = Item.create! valid_attributes
      get :edit, params: {id: item.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Item" do
        expect {
          post :create, params: {item: valid_attributes}, session: valid_session
        }.to change(Item, :count).by(1)
      end

      it "redirects to the created item" do
        post :create, params: {item: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Item.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {item: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { quantity: 1.5, unit: 'lbs', price: 11.0, product_id: @product.id, receipt_id: @receipt.id }
      }

      it "updates the requested item" do
        item = Item.create! valid_attributes
        put :update, params: {id: item.to_param, item: new_attributes}, session: valid_session
        item.reload
        expect(item.price).to eq(11.0)
      end

      it "redirects to the item" do
        item = Item.create! valid_attributes
        put :update, params: {id: item.to_param, item: valid_attributes}, session: valid_session
        expect(response).to redirect_to(item)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        item = Item.create! valid_attributes
        put :update, params: {id: item.to_param, item: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested item" do
      item = Item.create! valid_attributes
      expect {
        delete :destroy, params: {id: item.to_param}, session: valid_session
      }.to change(Item, :count).by(-1)
    end

    it "redirects to the items list" do
      item = Item.create! valid_attributes
      delete :destroy, params: {id: item.to_param}, session: valid_session
      expect(response).to redirect_to(items_url)
    end
  end

end
