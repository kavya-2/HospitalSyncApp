class DoctorsController < ApplicationController
  before_action :authenticate_doctor!
  before_action :set_doctor, only: [:show, :edit, :update]

  def index
    @doctors = Doctor.all
  end

  def show
  end

  def edit
  end

  def update
    if @doctor.update(doctor_params)
      redirect_to @doctor, notice: 'Doctor was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name, :email, :password, :password_confirmation)
  end
end
