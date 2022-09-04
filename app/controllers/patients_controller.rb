class PatientsController < ApplicationController

  def new

    @treatment = Treatment.find(params[:treatment_id])
    @patient = Patient.new

  end

  def create
    @treatment = Treatment.find(params[:treatment_id])
    @patient = Patient.new(patient_params)
    @patient.treatment = @treatment
    @patient.user = current_user
    @patient.save
    redirect_to patient_path(@patient)
  end

  def show
    @patient = Patient.find(params[:id])
  end



  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :age, :weight, :medical_history)
  end

end
