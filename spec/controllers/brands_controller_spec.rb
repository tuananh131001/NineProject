require "rails_helper"
require 'jwt_token'
SECRET_KEY = Rails.application.secrets.secret_key_base

RSpec.describe BrandsController do
  let!(:user) { create(:user) }
  let(:token) { JWT.encode({ user_id: user.id }, SECRET_KEY) }

  before do
    request.headers['Authorization'] = "Bearer #{token}"
  end

  describe 'GET #index' do
    it 'returns a successful response' do

      get :index

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    let(:brand) { create(:brand) }

    context 'when the request is valid' do
      it 'returns a successful response' do

        get :show, params: { id: brand.id }
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) { { name: 'Brand Name', rate: 5, headquarters: 'HQ', industry: 'Industry', founder: 'Founder', website: 'www.example.com', status: 'active' } }

    context 'when the request is valid' do
      it 'creates a new brand' do
        post :create, params: valid_attributes
        expect(response).to have_http_status(:created)
        expect(Brand.count).to eq(1)
      end

      it 'returns errors for invalid brand data' do
        post :create, params: { brand: { name: '' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH #status' do
    let(:brand) { create(:brand) }

    context 'when the request is valid' do

      it 'toggles the brand status' do
        patch :status, params: { id: brand.id }
        expect(response).to have_http_status(:created)
        brand.reload
        expect(brand.status).to eq('inactive')
      end
    end
    # Add more tests for the status action if needed
  end

  describe 'DELETE #destroy' do
    let!(:brand) { create(:brand) }

    context 'when the request is valid' do

      it 'deletes the brand' do
        delete :destroy, params: { id: brand.id }
        expect(response).to have_http_status(:ok)
        expect(Brand.count).to eq(0)
      end
    end
  end
end
