class Appointment < ApplicationRecord
    validates :start_time, uniqueness: true
end
