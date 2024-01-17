class AddNotesToCountries < ActiveRecord::Migration[7.0]
  def change
    add_column :countries, :notes, :text
  end
end
