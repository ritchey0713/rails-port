class PortfoliosController < ApplicationController
  layout 'portfolio'
  access all: [:show, :index, :react], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all
  # skip_before_action :verify_authenticity_token

  def index
    @portfolio_items = Portfolio.by_position
  end

  def sort 
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end 
    render body: nil
  end 
  
  def react 
    @react_items = Portfolio.react
  end 

  def new 
    @portfolio_item = Portfolio.new
    # @portfolio_item.technologies.build
  end 

  def create 
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'portfolio_item was successfully created.' }
        #format.json { render :show, status: :created, location: @portfolio_item }
      else
        format.html { render :new }
        #format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end 

  def show 
    @portfolio_item = Portfolio.find(params[:id])
  end 

  def edit 
    @portfolio_item = Portfolio.find(params[:id])
    # @portfolio_item.technologies.build
  end 

  def update 
    @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully updated.' }
        #format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        #format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end 

  def destroy 
    @portfolio_item = Portfolio.find(params[:id])
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Item was successfully destroyed.' }
      #format.json { head :no_content }
    end
  end

  private

    def portfolio_params
      params.require(:portfolio).permit(
        :title, 
        :subtitle, 
        :body, 
        :main_image, 
        :thumb_image,
        :url,
        :github_url, 
        technologies_attributes: [:id, :name, :_destroy]) #:_destroy for cocoon, to destroy items
    end
 
end
