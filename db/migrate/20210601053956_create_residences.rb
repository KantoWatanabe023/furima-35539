class CreateResidences < ActiveRecord::Migration[6.0]
  def change
    create_table :residences do |t|
      t.string       :post_num,   null: false
      t.integer      :place_id,   null: false
      t.string       :city,       null: false
      t.string       :address,    null: false
      t.string       :building
      t.string       :phone_num,  null: false
      t.references   :order,      foreign_key:true

      t.timestamps
    end
  end
end
