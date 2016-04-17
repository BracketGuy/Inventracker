class ComputersController < ApplicationController
  def index
    @computers = Computer.all
  end

  def show
    @computer = Computer.find(params[:id])
    unless @computer.user_id == nil
      begin
        @user = User.find(@computer.user_id)
      rescue ActiveRecord::RecordNotFound
        @user = Object.new
        def @user.full_name
          "User not found!" # Wow this is hackish. I need to find a way to do this that doesn't involve creating a mock object and putting methods on it!
        end
        def @user.id
          nil
        end
      end
    end
  end

  def new
    @computer = Computer.new
    @users = User.all
  end

  def create
    @computer = Computer.new(name: params[:name],
                             user_id: params[:user_id],
                             os: params[:os],
                             notes: params[:notes],
                             deployment_date: Date.civil(params[:deployment_date][:year].to_i, params[:deployment_date][:month].to_i, params[:deployment_date][:day].to_i),
                             verification_date: Date.civil(params[:verification_date][:year].to_i, params[:verification_date][:month].to_i, params[:verification_date][:day].to_i))
    if @computer.save
      redirect_to action: "show", id: @computer.id
    else
      render "new"
    end
  end

  def edit
    @computer = Computer.find(params[:id])
    @users = User.all
  end

  def update
    @computer = Computer.find(params[:id])
    params_for_update = params.permit(:name, :user_id, :os, :notes, :deployment_date, :verification_date)
    # Seriously? The only way to fix these dates before sending them to update action is to open my params_for_update hash back up?
    params_for_update["deployment_date"] = Date.civil(params[:deployment_date][:year].to_i, params[:deployment_date][:month].to_i, params[:deployment_date][:day].to_i)
    params_for_update["verification_date"] = Date.civil(params[:verification_date][:year].to_i, params[:verification_date][:month].to_i, params[:verification_date][:day].to_i)
    @computer.update_attributes(params_for_update)
    redirect_to action: "show", id: @computer.id
  end

  def destroy
    @computer = Computer.find(params[:id])
    if @computer.destroy
      redirect_to action: "index"
    end
  end
end
