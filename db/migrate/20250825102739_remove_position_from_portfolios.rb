class RemovePositionFromPortfolios < ActiveRecord::Migration[7.1]
  def change
    remove_column :portfolios, :position, :integer
  end
end
