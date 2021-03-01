class AddLenderNameToTable < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :lender_name, :string
  end
end
