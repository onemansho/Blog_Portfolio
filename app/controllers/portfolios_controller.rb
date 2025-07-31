class PortfoliosController < ApplicationController
  def index
    @portfolios= Portfolio.all#where(subtitle:"Angular")
  end
  def angular
    @angular_portfolio_items=Portfolio.angular
  end
  
  def new
    @portfolio_item = Portfolio.new
    3.times {@portfolio_item.technologies.build
  }
    
  end
  def create
    @portfolios = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name]))

    respond_to do |format|
      if @portfolios.save
        format.html { redirect_to portfolios_path, notice: "portfolio created successfully ." }

      else
        format.html { render :new }
      end
    end
  end
  def edit
    @portfolios=Portfolio.find(params[:id])
  end
  def show
    @portfolio_item=Portfolio.find(params[:id])
  end
  def destroy
    @portfolio = Portfolio.find(params[:id])

    @portfolio.destroy

    respond_to do |format|
      format.html {redirect_to portfolios_url,notice:'Record was removed'}
    end
  end
  
end
