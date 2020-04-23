require "dry/transaction"

class ReservationsService
  include Dry::Transaction

  step :search_movie
  step :verify_capacity
  step :create

  private

  def search_movie(input)
    movie_name = input[:movie_name]
    date = input[:date].to_date
    movie = Models::Movies.filter(name: movie_name, date => :first_date..:last_date).first

    if movie.present?
      Success input.merge(movie: movie)
    else
      response = { message: "Movie doesn't exist or does not appear on that date", code: 404 }
      Failure response
    end
  end

  def verify_capacity(input)
    date = input[:date].to_date
    movie = input[:movie]

    if Models::Reservations.filter(movie_id: movie.id, date: date).count < 10
      Success input
    else
      response = { message: "Event is full", code: 500 }
      Failure response
    end
  end

  def create(input)
    movie = input[:movie]
    reservation = Models::Reservations.create({date: input[:date], name_client: input[:name_client],movie_id: movie.id})

    if reservation
      Success reservation.values
    else
      response = { message: "Error saving reservation", code: 500 }
      Failure response
    end
  end
end
