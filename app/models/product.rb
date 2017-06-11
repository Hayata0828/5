class Product < ApplicationRecord
  belongs_to :manager
  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images
  # accepts_attachments_for :product_images, attachment: :image
end
