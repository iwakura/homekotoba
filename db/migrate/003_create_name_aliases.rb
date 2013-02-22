Sequel.migration do
  up do
    create_table :name_aliases do
      primary_key :id
      String :short, :null => false, :size => 30
      String :long,  :null => false, :size => 30
    end
  end

  down do
    drop_table :name_aliases
  end
end
