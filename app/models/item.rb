class Item < ActiveRecord::Base
  belongs_to :default
  belongs_to :favorite
  belongs_to :user
  has_and_belongs_to_many :category
end
