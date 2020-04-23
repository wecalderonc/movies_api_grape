# frozen_string_literal: true

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
          binding.pry
          if Models::Movies[name: params[:movie_name]]
            reservation = Models::Reservations.create({date: params[:date],name_client: params[:name_client]})
            return reservation.values
          end

        end

        desc 'get all of reservations',
             is_array: true
        get do
          ::Models::Reservations.all.map { |reservation| reservation.values }
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
