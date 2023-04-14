class Patient < ApplicationRecord
  belongs_to :user
  has_one :record
  # has_and_belongs_to_many :doctors
  has_many :appointments
  has_many :patients, through: :appointments


end
