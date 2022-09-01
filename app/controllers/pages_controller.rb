class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def dashboard
    # get current user
    @user = current_user
    @procedures = @user.procedures
  end
end
