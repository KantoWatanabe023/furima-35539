class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps

      t.string     :items_name,   null: false
      t.text       :items_about,  null: false
      t.integer    :category_id,  null: false
      t.integer    :status_id,    null: false
      t.integer    :shipping_id,  null: false
      t.integer    :place_id,     null: false
      t.integer    :day_id,       null: false
      t.integer    :price,        null: false
      t.references :user,         foreign_key: true

    end
  end
end
