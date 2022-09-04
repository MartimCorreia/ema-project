class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :authenticate_user!, except: :intro

  def intro
  end

  def dashboard
    # get current user
    @user = current_user
    @procedures = @user.procedures
  end
end
