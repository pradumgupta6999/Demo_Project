class Doctor < ApplicationRecord
  belongs_to :user
  # has_and_belongs_to_many :patients
  has_many :appointments
  has_many :patients, through: :appointments
  has_and_belongs_to_many :hospitals

end
