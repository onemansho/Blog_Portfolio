class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: %i[ show edit update destroy]
  layout 'portfolio'
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit,:sort]}, site_admin: :all

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
    3.times { @portfolio.technologies.build }
  end
  def create
    @portfolio = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio.save
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
        format.html { redirect_to portfolios_path, notice: "Your portfolio item is now updated"}
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

  def sort
    params[:order].each_with_index do |id, index|
      Portfolio.find(id).update(position: index + 1)
    end
    head :ok
  end
  
  private 

  def portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body,
                                      :main_image,
                                      :thumb_image, 
                                      technologies_attributes: [:id, :name, :_destroy])
  end
  def set_portfolio_item
    @portfolio = Portfolio.find(params[:id])

  end

  
  
  
  
end
