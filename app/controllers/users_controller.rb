class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(first_name: params[:first_name],
                     last_name: params[:last_name],
                     email: params[:email])
    if @user.save
      redirect_to action: "show", id: @user.id
    else
      render "new"
    end
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    params_for_update = params.permit(:first_name, :last_name, :email)
    @user.update_attributes(params_for_update)
    redirect_to action: "show", id: @user.id
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to action: "index"
    end
  end
end
