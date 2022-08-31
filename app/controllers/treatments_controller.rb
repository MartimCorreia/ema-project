class TreatmentsController < ApplicationController
  def index
    #get all injury locations
    @locations = InjuryLocation.all
    #get all injury types
    @types = InjuryType.all
    #get all conditions
    @conditions = Condition.all
    #get all treatments
    @treatments = Treatment.all
    #filter treatments by age_group
    @phase1 = @treatments.where(age_group: params[:age], injury_location_id: params[:location], injury_type_id: params[:type], condition_id: params[:condition] )
    #filter treatments by injury_location
    @phase2 = @phase1.where(injury_location_id: params[:location])
    #filter treatments by Medical condition or Trauma
    @phase3 = @phase2.where(injury_type_id: params[:type])
    #filter treatments by condition
    @phase4 = @phase3.where(condition_id: params[:condition])
    if !params[:age_group].nil?
      render "index_location"
    else
      render "index_age"
    end

  end

  def show

  end

  def new
  end

  def create
  end
end
