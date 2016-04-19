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
    unless @computer.site_id == nil
      begin
        @site = Site.find(@computer.site_id)
      rescue ActiveRecord::RecordNotFound
        @site = Object.new
        def @site.name
          "Site not found!"
        end
        def @site.id
          nil
        end
      end
    end
  end

  def new
    @computer = Computer.new
    @users = User.all
    @sites = Site.all
  end

  def create
    @computer = Computer.new(name: params[:name],
                             user_id: params[:user_id],
                             site_id: params[:site_id],
                             os: params[:os],
                             notes: params[:notes],
                             deployment_date: params_to_date(params,:deployment_date),
                             verification_date: params_to_date(params,:verification_date),
                             warranty_date: params_to_date(params,:warranty_date))
    if @computer.save
      redirect_to action: "show", id: @computer.id
    else
      render "new"
    end
  end

  def edit
    @computer = Computer.find(params[:id])
    @users = User.all
    @sites = Site.all
  end

  def update
    @computer = Computer.find(params[:id])
    params_for_update = params.permit(:name, :user_id, :site_id, :os, :notes, :deployment_date, :verification_date)
    # Seriously? The only way to fix these dates before sending them to update action is to open my params_for_update hash back up?
    params_for_update["deployment_date"] = params_to_date(params,:deployment_date)
    params_for_update["verification_date"] = params_to_date(params,:verification_date)
    params_for_update["warranty_date"] = params_to_date(params,:warranty_date)
    @computer.update_attributes(params_for_update)
    redirect_to action: "show", id: @computer.id
  end

  def destroy
    @computer = Computer.find(params[:id])
    if @computer.destroy
      redirect_to action: "index"
    end
  end

  private
  #Takes a params hash and a symbol for the name of the key you want to pull a date value out of.
  def params_to_date(params,key)
    date = Date.civil(params[key][:year].to_i, params[key][:month].to_i, params[key][:day].to_i)
  end
end
