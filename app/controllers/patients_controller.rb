class PatientsController < ApplicationController

  def index
    @patients = current_user.patients
  end

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
    redirect_to  new_treatment_patient_medical_report_path(@treatment, @patient)
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def select
    @treatment = Treatment.find(params[:treatment_id])
    @patients = Patient.all
  end



  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :age, :weight, :occupation, :address, :medical_history, :photo)
  end

end
