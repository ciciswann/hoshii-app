class CreateGroupbuys < ActiveRecord::Migration[6.1]
  def change
    create_table :groupbuys do |t|
      t.string :type
      t.string :name
      t.string :start_date
      t.string :end_date
      t.string :pricing
      t.string :sale_type
      t.string :vendor
      t.string :image

      t.timestamps
    end
  end
end
