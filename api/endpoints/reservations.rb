# frozen_string_literal: true

require 'entities/api_error'

module Api
  module Endpoints
    class Reservations < Grape::API
      namespace :reservations do
        desc 'create reservation'
        params do
          requires :movie_name, type: String
          requires :date, type: String
          requires :name_client, type: String
        end
        post do
          reservation = ReservationsService.new.call(params)

          if reservation.success?
            present reservation.success
          else
            Api::Entities::ApiError.new({ code: reservation.failure[:code], message: reservation.failure[:message] })
          end

        end

        desc 'get all of reservations in a date range', is_array: true
        params do
          requires :first_date, type: Date
          requires :last_date, type: Date
        end
        get do
          reservations = ReservationsGetService.new.call(params)

          if reservations.success?
            present reservations.success.map { |reservation| reservation.values }
          else
            Api::Entities::ApiError.new({ code: reservations.failure[:code], message: reservations.failure[:message] })
          end
        end

        desc 'get specific reservation'
        params do
          requires :id
        end
        get ':id' do
          Models::Reservations[params[:id]].values
        end
      end
    end
  end
end
