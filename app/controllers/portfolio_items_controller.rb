class PortfolioItemsController < ApplicationController
	def index
		@portfolio_items = PortfolioItem.all
	end

	def new
		@portfolio_item = PortfolioItem.new
	end

	def create
		@portfolio_item = PortfolioItem.new(params.require(:portfolio_item).permit(:title, :subtitle, :body))

		respond_to do |format|
			if @portfolio_item.save
				format.html { redirect_to portfolio_items_path, notice: 'Item is live' }
			else
				format.html { render :new }
			end
		end
	end

	def edit
		@portfolio_item = PortfolioItem.find(params[:id])
	end

	def update
		@portfolio_item = PortfolioItem.find(params[:id])

    	respond_to do |format|
	      if @portfolio_item.update(params.require(:portfolio_item).permit(:title, :subtitle, :body))
	        format.html { redirect_to portfolio_items_path, notice: 'Item was successfully updated.' }
	      else
	        format.html { render :edit }
	      end
	    end
	end

	def show
		@portfolio_item = PortfolioItem.find(params[:id])
	end

	def destroy
		@portfolio_item = PortfolioItem.find(params[:id])

		@portfolio_item.destroy
		respond_to do |format|
			format.html { redirect_to portfolio_items_url, notice: "destroyed item" }
		end		
	end


end





















