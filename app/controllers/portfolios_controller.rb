class PortfoliosController < ApplicationController
	before_action :set_portfolio_item, only: [:show, :edit, :update, :destroy]
	
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
				format.html { redirect_to @portfolio_item, notice: "Portfolio Item created successfully" }
			else
				format.html { render :new }
			end
		end
	end

	def show
	end

	def edit
	end

	def update
		respond_to do |format|
			if @portfolio_item.update
				format.html { redirect_to @portfolio_item, notice: "Portfolio Item updated successfully" }
			else
				format.html { render :edit }
			end
		end
	end

	def destroy
		@portfolio_item = Portfolio.find(params[:id])
		@portfolio_item.destroy
		respond_to do |format|
			format.html { redirect_to portfolios_url, notice: "Portfolio Item deleted successfully." }
		end
	end

	private
	def portfolio_params
		params.require(:portfolio).permit(:title, :subtitle, :body)
	end

	def set_portfolio_item
		@portfolio_item = Portfolio.find(params[:id])
	end

end
