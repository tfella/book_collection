class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    drop_table :countries if table_exists?(:countries)
    
    create_table :countries do |t|
      t.string :name
      t.integer :rank

      t.timestamps
    end
  end
end
