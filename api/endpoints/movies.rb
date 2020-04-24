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
          movie = MoviesCreateService.new.call(params)

          if movie.success?
            movie.success.values
          else
            Api::Entities::ApiError.new({ code: movie.failure[:code], message: movie.failure[:message] })
          end
        end

        desc 'get all of movies in a day of the week (Insert name of the day)', is_array: true
        params do
          requires :week_day, type: String
        end
        get do
          movies = MoviesGetService.new.call(params)

          if movies.success?
            present movies.success.map { |movie| movie.values }
          else
            Api::Entities::ApiError.new({ code: movies.failure[:code], message: movies.failure[:message] })
          end
        end

        desc 'Get specific movie by ID'
        params do
          requires :id, type: Integer
        end
        get ':id' do
          present Models::Movies[params[:id]].values
        end
      end
    end
  end
end
