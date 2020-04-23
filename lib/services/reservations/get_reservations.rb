require "dry/transaction"

class ReservationsGetService
  include Dry::Transaction

  step :search_reservations

  private

  def search_reservations(input)
    range = input[:first_date]..input[:last_date]
    reservations = range.map { |date| Models::Reservations.filter(date: date.to_date).all }

    if reservations
      Success reservations.flatten
    else
      response = { message: "No movie for that day of the week", code: 404}
      Failure response
    end
  end
end
