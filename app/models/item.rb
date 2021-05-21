class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :details_category
  belongs_to :details_status
  belongs_to :shipping_area
  belongs_to :shipping_charges
  belongs_to :shipping_days

  belongs_to :user
  with_options presence: true do
    validates :name
    validates :description
    validates :details_category_id, numericality: { other_than: 1 } 
    validates :details_status_id, numericality: { other_than: 1 } 
    validates :shipping_charges_id, numericality: { other_than: 1 } 
    validates :shipping_area_id, numericality: { other_than: 1 } 
    validates :shipping_days_id, numericality: { other_than: 1 } 
    validates :selling_price
  
  end
end
