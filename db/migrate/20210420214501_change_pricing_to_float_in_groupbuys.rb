class ChangePricingToFloatInGroupbuys < ActiveRecord::Migration[6.1]
  def change
    change_column :groupbuys, :pricing, :float
  end
end
