class PortfoliosController < ApplicationController

  def index
    @portfolio_items = Portfolio.all 
  end 

  def new 
    @portfolio_item = Portfolio.new
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
  end 

  def edit 
  end 

  def update 
  end 

  def destroy 
  end

  private

    def portfolio_params
      params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image)
    end
 
end
