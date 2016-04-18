class DashboardController < ApplicationController
  def index
    @computers = Computer.all
    @users = User.all
  end
end
