require 'rails_helper'

RSpec.describe ReceiptsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Receipt. As you add validations to Receipt, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {store: "Madison Co-op", base_amount: 30.00, tax_amount: 2.00, total_amount: 32.00, purchased_at: DateTime.now}
  }

  let(:invalid_attributes) {
    {store: "", base_amount: nil, tax_amount: nil, total_amount: nil, purchased_at: DateTime.now}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ReceiptsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      receipt = Receipt.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      receipt = Receipt.create! valid_attributes
      get :show, params: {id: receipt.to_param}, session: valid_session
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
      receipt = Receipt.create! valid_attributes
      get :edit, params: {id: receipt.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Receipt" do
        expect {
          post :create, params: {receipt: valid_attributes}, session: valid_session
        }.to change(Receipt, :count).by(1)
      end

      it "redirects to the created receipt" do
        post :create, params: {receipt: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Receipt.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {receipt: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {store: "QFC", base_amount: 31.00, tax_amount: 2.00, total_amount: 33.00, purchased_at: DateTime.now}
      }

      it "updates the requested receipt" do
        receipt = Receipt.create! valid_attributes
        put :update, params: {id: receipt.to_param, receipt: new_attributes}, session: valid_session
        receipt.reload
        expect(receipt.store).to eq('QFC')
      end

      it "redirects to the receipt" do
        receipt = Receipt.create! valid_attributes
        put :update, params: {id: receipt.to_param, receipt: valid_attributes}, session: valid_session
        expect(response).to redirect_to(receipt)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        receipt = Receipt.create! valid_attributes
        put :update, params: {id: receipt.to_param, receipt: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested receipt" do
      receipt = Receipt.create! valid_attributes
      expect {
        delete :destroy, params: {id: receipt.to_param}, session: valid_session
      }.to change(Receipt, :count).by(-1)
    end

    it "redirects to the receipts list" do
      receipt = Receipt.create! valid_attributes
      delete :destroy, params: {id: receipt.to_param}, session: valid_session
      expect(response).to redirect_to(receipts_url)
    end
  end

end
