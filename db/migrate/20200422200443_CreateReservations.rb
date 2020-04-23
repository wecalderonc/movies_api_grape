Sequel.migration do
  change do
    create_table :reservations do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :date
      foreign_key :movie_id, :movies
    end
  end
end
