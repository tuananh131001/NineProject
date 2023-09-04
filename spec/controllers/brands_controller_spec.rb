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
    subject { get :index }

    it { is_expected.to have_http_status(:ok) }
  end

  describe 'GET #show' do
    subject { get :show, params: { id: brand.id } }

    let(:brand) { create(:brand) }

    it { is_expected.to have_http_status(:ok) }
  end

  describe 'POST #create' do
    subject { post :create, params: valid_attributes }

    context 'when the request is valid' do
      let(:valid_attributes) { { name: 'Brand Name', rate: 5, headquarters: 'HQ', industry: 'Industry', founder: 'Founder', website: 'www.example.com', status: 'active' } }

      it 'creates a new brand' do
        expect(subject).to have_http_status(:created)
        expect(Brand.count).to eq(1)
      end
    end

    context 'when the request is invalid' do
      let(:valid_attributes) { { brand: { name: '' } } }

      it { is_expected.to have_http_status(:unprocessable_entity) }
    end
  end

  describe 'PATCH #status' do
    subject { patch :status, params: { id: brand.id } }

    let(:brand) { create(:brand) }

    context 'when the request is valid' do

      it 'toggles the brand status' do
        expect(subject).to have_http_status(:created)
        brand.reload
        expect(brand.status).to eq('inactive')
      end
    end
    # Add more tests for the status action if needed
  end

  describe 'DELETE #destroy' do
    subject { delete :destroy, params: { id: brand.id } }

    let!(:brand) { create(:brand) }

    context 'when the request is valid' do
      it 'deletes the brand' do
        expect(subject).to have_http_status(:ok)
        expect(Brand.count).to eq(0)
      end
    end
  end
end
