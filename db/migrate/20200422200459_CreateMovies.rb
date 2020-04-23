Sequel.migration do
  change do
    create_table :movies do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      String :name
      String :description
      String :url
      String :days
    end
  end
end
