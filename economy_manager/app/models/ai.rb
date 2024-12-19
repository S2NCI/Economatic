class AiTable < ApplicationRecord
   # Validation for acronym (must be exactly 3 characters and cannot be empty)
   validates :acronym, presence: true, length: { is: 3 }

   # Validation for name (must not exceed 255 characters)
   validates :name, :imgUrl, presence: true, length: { maximum: 255 }
 
   # Validation for general integer fields (must be non-negative)
   validates :gross, :trade, :expenditure, :reserve,
             numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
 
   # Validation for ideological fields (must be between 0 and 100)
   validates :co, :iso, :ant, :state, :ind,
             numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, allow_nil: true
end

#rails generate scaffold AiTable acronym:string name:string imgUrl:string gross:integer trade:integer co:integer iso:integer ant:integer state:integer ind:integer