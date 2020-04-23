# frozen_string_literal: true

module Api
  module Endpoints
    class Movies < Grape::API
      include Models
      namespace :movies do
        desc 'create movie'
        params do
          requires :name, type: String
          requires :description, type: String
          requires :url, type: String
          requires :first_date, type: Date
          requires :last_date, type: Date
        end
        post do
          movie = Models::Movies.create({name: params[:name],description: params[:description],first_date: params[:first_date],last_date: params[:last_date]})
          movie.values
        end

        desc 'get all of movies',
             is_array: true
        get do
          ::Models::Movies.all.map { |movie| movie.values }
        end

        desc 'get specific movie'
        params do
          requires :id
        end
        get ':id' do
          Models::Movies[params[:id]].values
        end
      end
    end
  end
end
