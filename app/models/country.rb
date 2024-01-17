# app/models/country.rb
class Country < ApplicationRecord
    # Add validations as needed, for example:
    validates :been, inclusion: { in: [true, false] }
    validates :notes, length: { maximum: 500 }
  end
  