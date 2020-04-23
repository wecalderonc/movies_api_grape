Sequel.migration do
  change do
    create_table :reservations do
      primary_key :id

      Date :date
      String :name_client
      foreign_key :movie_id, :movies
    end
  end
end
