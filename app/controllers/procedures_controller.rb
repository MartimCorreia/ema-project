class ProceduresController < ApplicationController
  def index
    @procedures = current_user.procedures
  end
end
