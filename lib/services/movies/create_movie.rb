require "dry/transaction"

class MoviesCreateService
  include Dry::Transaction

  step :validate_existence
  step :create

  private

  def validate_existence(input)
    movie = Models::Movies[name: input[:name]]

    if movie.nil?
      Success input
    else
      response = { message: "Movie already exist in db", code: 500}
      Failure response
    end
  end

  def create(input)
    movie = Models::Movies.create({name: input[:name],description: input[:description], url: input[:url], first_date: input[:first_date],last_date: input[:last_date]})

    if movie
      Success movie.values
    else
      response = { message: "Error saving movie", code: 500}
      Failure response
    end
  end
end
