class HomesController < ApplicationController
    def index
        @current_user = current_user
        @doctor = Doctor.all
        @patient = Patient.all
    end
end
