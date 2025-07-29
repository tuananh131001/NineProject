# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  config.openapi_root = Rails.root.join("swagger").to_s
  config.rswag_dry_run = false
  config.openapi_specs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'Nine Project API V1',
        version: 'v1',
        description: 'API documentation for Nine Project'
      },
      components: {
        securitySchemes: {
          bearer_auth: {
            type: :http,
            scheme: :bearer,
            bearerFormat: 'JWT'
          }
        }
      },
      paths: {},
      servers: [
        {
          url: '{protocol}://{defaultHost}',
          variables: {
            protocol: {
              default: :http
            },
            defaultHost: {
              default: 'localhost:3000'
            }
          }
        }
      ]
    }
  }
end
