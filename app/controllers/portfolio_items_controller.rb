class PortfolioItemsController < ApplicationController
	before_action :set_portfolio_item, only: [:show, :edit, :update, :destroy]
	layout 'portfolio'
  access all: [:show, :index, :angular], user: {except: [:destroy, :create, :new, :update, :edit, :sort]}, site_admin: :all


	def index
		@portfolio_items = PortfolioItem.by_position
	end

	def sort
		params[:order].each do |k,v|
			PortfolioItem.find(v[:id]).update(position: v[:position])
		end

		render nothing: true
	end

	def angular_items
		@angular_items = PortfolioItem.angular_portfolio_items
	end

	def new
		@portfolio_item = PortfolioItem.new
		3.times { @portfolio_item.technologies.build }
	end

	def create
		@portfolio_item = PortfolioItem.new(portfolio_item_params)
		debugger

		respond_to do |format|
			if @portfolio_item.save
				format.html { redirect_to portfolio_items_path, notice: 'Item is live' }
			else
				format.html { render :new }
			end
		end
	end

	def edit
	end

	def update
  	respond_to do |format|
      if @portfolio_item.update(portfolio_item_params)
        format.html { redirect_to portfolio_items_path, notice: 'Item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
	end

	def show
	end

	def destroy
		@portfolio_item.destroy
		respond_to do |format|
			format.html { redirect_to portfolio_items_url, notice: "destroyed item" }
		end		
	end


	private

	def portfolio_item_params
		params.require(:portfolio_item).permit(:title, :subtitle, :thumb_image, :main_image, :body, technologies_attributes: [:name])
	end

	def set_portfolio_item
		@portfolio_item = PortfolioItem.find(params[:id])
	end

end





















