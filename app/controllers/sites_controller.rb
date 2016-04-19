class SitesController < ApplicationController
   def index
     @sites = Site.all
   end

   def show
     @site = Site.find(params[:id])
   end

   def new
     @site = Site.new
   end

   def create
     @site = Site.new(name: params[:name], poc_name: params[:poc_name], poc_phone: params[:poc_phone])
     @site.save
     redirect_to action: "show", id: @site.id
   end

   def edit
     @site = Site.find(params[:id])
   end

   def update
     @site = Site.find(params[:id])
     params_for_update = params.permit(:name, :poc_name, :poc_phone)
     @site.update_attributes(params_for_update)
     redirect_to action: "show", id: @site.id
   end

   def destroy
     @site = Site.find(params[:id])
     @site.destroy
     redirect_to action: "index"
   end
end
