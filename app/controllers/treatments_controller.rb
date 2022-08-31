class TreatmentsController < ApplicationController
  def index
    if !params[:age_group].nil? && !params[:location].nil? && !params[:type].nil? && !params[:condition].nil?

      @location = InjuryLocation.where(name: params[:location]).first
      @type = InjuryType.where(name: params[:type]).first
      @condition = Condition.where(name: params[:condition]).first
      @treatment = Treatment.where(age_group: params[:age_group], injury_location: @location, injury_type: @type, condition: @condition).first
      current_user.treatments << @treatment
      redirect_to treatment_path(@treatment)
    elsif !params[:age_group].nil? && !params[:location].nil? && !params[:type].nil?
      @conditions = Condition.all
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
    @treatment = Treatment.find(params[:id])
  end

  def new
  end

  def create
  end
end
