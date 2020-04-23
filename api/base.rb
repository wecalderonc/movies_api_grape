# frozen_string_literal: true

module Api
  class Base < Grape::API
    version 'v1', using: :path
    format :json

    mount Endpoints::Root
    mount Endpoints::Movies
    mount Endpoints::Reservations

    add_swagger_documentation format: :json,
                              info: {
                                title: 'Starter API'
                              },
                              mount_path: '/oapi',
                              models: [
                                Entities::ApiError
                              ]
  end
end
