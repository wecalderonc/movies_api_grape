require "dry/transaction"

class MoviesGetService
  include Dry::Transaction

  step :search_movies

  private

  def search_movies(input)
    movies = Models::Movies.all.select do |movie|
      days = (movie.first_date..movie.last_date).map { |date| date.strftime("%A") }
      days.include?(input[:week_day].capitalize)
    end

    if movies.any?
      Success movies
    else
      response = { message: "No movie for that day of the week", code: 404}
      Failure response
    end
  end
end
