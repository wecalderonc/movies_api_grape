Sequel.migration do
  change do
    create_table :movies do
      primary_key :id

      String :name
      String :description
      String :url
      Date :first_date
      Date :last_date
    end
  end
end
