class AddPositionToPortfolioItems < ActiveRecord::Migration[5.0]
  def change
    add_column :portfolio_items, :position, :integer
  end
end
