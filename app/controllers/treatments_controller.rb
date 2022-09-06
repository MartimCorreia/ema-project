class TreatmentsController < ApplicationController

  def index
    if !params[:age_group].nil? && !params[:location].nil? && !params[:type].nil? && !params[:condition].nil?
      @location = InjuryLocation.where(name: params[:location]).first
      @type = InjuryType.where(name: params[:type]).first
      @condition = Condition.where(name: params[:condition]).first
      @treatment = Treatment.where(age_group: params[:age_group], injury_location: @location, injury_type: @type, condition: @condition).first
      @procedure = Procedure.new(treatment_id: @treatment.id, user_id: current_user.id)
      @procedure.save
      redirect_to treatment_path(@procedure.treatment.id, completed: "true")
    elsif !params[:age_group].nil? && !params[:location].nil? && !params[:type].nil?
      @treatments = Treatment.joins(:injury_location, :injury_type).where(age_group: params[:age_group], injury_location: { name: params[:location] }, injury_type: { name: params[:type] })
      render "index_condition"
    elsif !params[:age_group].nil? && !params[:location].nil?
      render "index_type"
    elsif !params[:age_group].nil?
      render "index_location"
    else
      render "index_age"
    end
  end



  def show
    # if completed true then
    # create a record on the history tabel
    # else
    # just display
    # end
    @treatment = Treatment.find(params[:id])
    @patient = Patient.new
  end

  def new
  end

  def create
  end
end
