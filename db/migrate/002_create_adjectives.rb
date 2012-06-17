Sequel.migration do
  up do
    create_table :adjectives do
      primary_key :id
      String :word
      Boolean :checked
    end
  end

  down do
    drop_table :adjectives
  end
end
