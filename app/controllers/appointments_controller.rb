class AppointmentsController < ApplicationController
  before_action :set_doctor
  
  def index
  @users = current_user.appointments.all
  @doctors = @doctor.appointments.all
  end

  def show
  end

  def new
    @users = User.all
    @appointments = @doctor.appointments.new 
  end

  def create
  @appointment = @doctor.appointments.new(appointment_params)
  if @appointment.save
    redirect_to doctor_appointments_path(@doctor)
  else
    render :new
  end
  end

  private 
  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end
 
  def appointment_params
    params.require(:appointment).permit(:role, :date, :time, :user_id)
  end

end


