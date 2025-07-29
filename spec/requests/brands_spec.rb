require 'swagger_helper'

RSpec.describe 'Brands API', type: :request do
  # Schema definitions as constants
  BRAND_SCHEMA = {
    type: :object,
    properties: {
      id: { type: :integer },
      name: { type: :string },
      rate: { type: :decimal, format: 'float' },
      headquarters: { type: :string },
      industry: { type: :string },
      founder: { type: :string },
      website: { type: :string },
      status: { type: :string, enum: ['active', 'inactive'] }
    },
    required: ['name', 'rate', 'headquarters', 'industry', 'founder', 'website', 'status']
  }

  BRAND_UPDATE_SCHEMA = {
type: :object,
properties: {
status: { type: :string, enum: ['active', 'inactive'] }
    }
  }

  BRAND_INPUT_SCHEMA = {
    type: :object,
    properties: {
      name: { type: :string },
      rate: { type: :decimal, minimum: 0 },
      headquarters: { type: :string },
      industry: { type: :string },
      founder: { type: :string },
      website: { type: :string },
      status: { type: :string, enum: ['active', 'inactive'], default: 'active' }
    },
    required: ['name', 'rate', 'headquarters', 'industry', 'founder', 'website']
  }

  ERROR_SCHEMA = {
    type: :object,
    properties: {
      error: { type: :array }
    }
  }

  let!(:user) { create(:user) }
  let(:token) { JWT.encode({ user_id: user.id }, Rails.application.secrets.secret_key_base) }
  let(:Authorization) { "Bearer #{token}" }

  path '/brands' do
    get 'Lists all brands' do
      tags 'Brands'
      security [bearer_auth: []]
      produces 'application/json'
      
      response '200', 'brands found' do
        schema type: :array,
          items: BRAND_SCHEMA

        let(:Authorization) { "Bearer #{token}" }
        
        run_test! do |response|
          expect(response).to have_http_status(:ok)
        end
      end

      response '401', 'unauthorized' do
        schema ERROR_SCHEMA
        let(:Authorization) { 'invalid_token' }
        
        run_test! do |response|
          expect(response).to have_http_status(:unauthorized)
        end
      end
    end

    post 'Creates a brand' do
      tags 'Brands'
      security [bearer_auth: []]
      consumes 'application/json'
      produces 'application/json'
      
      parameter name: :brand, in: :body, schema: BRAND_INPUT_SCHEMA

      response '201', 'brand created' do
        schema BRAND_SCHEMA
        let(:Authorization) { "Bearer #{token}" }
        let(:brand) { { name: 'Brand Name', rate: 5.0, headquarters: 'HQ', industry: 'Industry', founder: 'Founder', website: 'www.example.com', status: 'active' } }
        
        run_test! do |response|
          expect(response).to have_http_status(:created)
          expect(Brand.count).to eq(1)
        end
      end

      response '422', 'invalid request' do
        schema ERROR_SCHEMA
        let(:Authorization) { "Bearer #{token}" }
        let(:brand) { { name: '' } }
        
        run_test! do |response|
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  path '/brands/{id}' do
    parameter name: :id, in: :path, type: :integer, required: true

    get 'Retrieves a brand' do
      tags 'Brands'
      security [bearer_auth: []]
      produces 'application/json'
      
      response '200', 'brand found' do
        schema BRAND_SCHEMA
        let(:Authorization) { "Bearer #{token}" }
        let(:id) { create(:brand).id }
        
        run_test! do |response|
          expect(response).to have_http_status(:ok)
        end
      end

      response '404', 'brand not found' do
        schema ERROR_SCHEMA
        let(:Authorization) { "Bearer #{token}" }
        let(:id) { 'invalid' }
        
        run_test! do |response|
          expect(response).to have_http_status(:not_found)
        end
      end
    end

    patch 'Updates brand status' do
      tags 'Brands'
      security [bearer_auth: []]
      produces 'application/json'
      consumes 'application/json'
      parameter name: :update_brand, in: :body, schema: {
        type: :object,
        required: true
      }
      
      response '200', 'brand status updated' do
        let(:Authorization) { "Bearer #{token}" }
        let(:brand) { create(:brand, status: 'active') }
        let(:id) { brand.id }
        let(:update_brand) { { status: 'inactive' } }
        
        run_test! do |response|
          expect(Brand.find(id).status).to eq('inactive')
        end
      end

      response '404', 'brand not found' do
        schema ERROR_SCHEMA
        let(:Authorization) { "Bearer #{token}" }
        let(:brand) { create(:brand, status: 'active') }
        let(:id) { 'invalid' }
        let(:update_brand) { { status: 'inactive' } }
        
        run_test! do |response|
          expect(response).to have_http_status(:not_found)
        end
      end
    end

    delete 'Deletes a brand' do
      tags 'Brands'
      security [bearer_auth: []]
      produces 'application/json'
      
      response '200', 'brand deleted' do
        let(:Authorization) { "Bearer #{token}" }
        let!(:id) { create(:brand).id }
        
        run_test! do |response|
          expect(response).to have_http_status(:ok)
          expect(Brand.count).to eq(0)
        end
      end

      response '404', 'brand not found' do
        schema ERROR_SCHEMA
        let(:Authorization) { "Bearer #{token}" }
        let(:id) { 'invalid' }
        
        run_test! do |response|
          expect(response).to have_http_status(:not_found)
        end
      end

      response '401', 'unauthorized' do
        schema ERROR_SCHEMA
        let(:Authorization) { 'invalid_token' }
        let(:id) { create(:brand).id }
        
        run_test! do |response|
          expect(response).to have_http_status(:unauthorized)
        end
      end
    end
  end
end 
