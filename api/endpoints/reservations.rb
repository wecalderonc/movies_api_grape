# frozen_string_literal: true

module Api
  module Endpoints
    class Reservations < Grape::API
      namespace :reservations do
        desc 'create reservation'
        params do
          # TODO: specify the parameters
        end
        post do
          # your code goes here
        end

        desc 'get all of reservations',
             is_array: true
        get do
          # your code goes here
        end

        desc 'get specific reservation'
        params do
          requires :id
        end
        get ':id' do
          # your code goes here
        end
      end
    end
  end
end
