class Hospital < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :doctors

end
