class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: %i[ show edit update destroy]
  layout 'portfolio'
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

  def index
    #@portfolios= Portfolio.all#where(subtitle:"Angular")
    #@portfolios= Portfolio.order(:position)#where(subtitle:"Angular")
    @portfolios= Portfolio.by_position#where(subtitle:"Angular")
  end
  def angular
    @angular_portfolio_items=Portfolio.angular
  end
  
  def new
    @portfolio = Portfolio.new
    3.times {@portfolio.technologies.build
  }
    
  end
  def create
    @portfolios = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolios.save
        format.html { redirect_to portfolios_path, notice: "portfolio created successfully ." }

      else
        format.html { render :new }
      end
    end
  end
  def edit
  end
  def update 
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to portfolios_path, notices: "Your portfolio item is now updated"}
      else
        format.html {render :edit}
      end
    end
  end
  def show
  end
  def destroy

    @portfolio.destroy

    respond_to do |format|
      format.html {redirect_to portfolios_url,notice:'Record was removed'}
    end
  end

  private 

  def portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body,
                                      technologies_attributes: [:name])
  end
  def set_portfolio_item
    @portfolio = Portfolio.find(params[:id])

  end
  
end
