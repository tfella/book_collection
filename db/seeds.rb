# db/seeds.rb
require 'json'

file_path = Rails.root.join('lib', 'seeds', 'countries.json')
countries_data = JSON.parse(File.read(file_path))

rank = 1
countries_data.each do |code, name|
  # Find or create the country by name and code
  country = Country.find_or_initialize_by(name: name, code: code)

  # Only set the rank and save if it's a new record
  if country.new_record?
    country.rank = rank
    country.been = false
    country.save
    rank += 1
  end
end
