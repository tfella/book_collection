# db/seeds.rb
require 'csv'

file_path = Rails.root.join('lib', 'seeds', 'countries.csv')
country_names = CSV.read(file_path).flatten

rank = 1
country_names.each do |name|
  # Find or create the country by name
  country = Country.find_or_initialize_by(name: name)

  # Only set the rank and save if it's a new record
  if country.new_record?
    country.rank = rank
    country.been = false
    country.save
    rank += 1
  end
end
