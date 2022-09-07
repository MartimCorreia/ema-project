class MedicalReportsController < ApplicationController

  def index
    @medical_reports = MedicalReport.all
  end

  def new
    @treatment = Treatment.find(params[:treatment_id])
    @patient = Patient.find(params[:patient_id])
    @medical_report = MedicalReport.new
  end

  def create
    @treatment = Treatment.find(params[:treatment_id])
    @patient = Patient.find(params[:patient_id])
    @procedure = Procedure.find_by(user: current_user, treatment: @treatment)
    @medical_report = MedicalReport.new(medical_report_params)
    @medical_report.treatment = @treatment
    @medical_report.patient = @patient
    @medical_report.save
    @procedure.destroy
    redirect_to medical_report_path(@medical_report)
  end

  def show
    @medical_report = MedicalReport.find(params[:id])
  end

  private
  def medical_report_params
    params.require(:medical_report).permit(:hospital, :diagnosis)
  end
end
