class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :details_category
  belongs_to :details_status
  belongs_to :shipping_area
  belongs_to :shipping_charges
  belongs_to :shipping_days
  belongs_to :user

  has_one_attached :image

  with_options presence: true do
    validates  :image
    validates :name
    validates :description
    validates :selling_price, numericality: true
    validates_inclusion_of :selling_price, in: 300..9_999_999
    with_options numericality: { other_than: 1 } do
      validates :details_category_id
      validates :details_status_id
      validates :shipping_charges_id
      validates :shipping_area_id
      validates :shipping_days_id
    end
  end
end
