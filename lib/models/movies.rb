# frozen_string_literal: true

module Models
  class Movies < Sequel::Model(:movies)
    one_to_many :reservations
  end
end
