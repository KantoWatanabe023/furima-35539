class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :day
  belongs_to :place
  belongs_to :shipping
  belongs_to :status
  has_one_attached :image

  with_options presence: true do
  validates :items_name
  validates :items_about
  validates :price
  end

  with_options numericality: { other_than: 1 } do 
    with_options presence: true do
      validates :category_id
      validates :day_id
      validates :place_id
      validates :shipping_id
      validates :status_id
    end
  end

end
