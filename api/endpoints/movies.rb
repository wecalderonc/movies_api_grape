# frozen_string_literal: true

module Api
  module Endpoints
    class Movies < Grape::API
      include Models
      namespace :movies do
        desc 'create movie'
        params do
          # TODO: specify the parameters
        end
        post do
          # your code goes here
        end

        desc 'get all of movies',
             is_array: true
        get do
          # your code goes here
          ::Models::Movies.all.map { |movie| movie.values }
        end

        desc 'get specific movie'
        params do
          requires :id
        end
        get ':id' do
          # your code goes here
          Models::Movies[params[:id]].values
        end
      end
    end
  end
end
