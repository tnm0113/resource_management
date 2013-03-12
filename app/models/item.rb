class Item
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  field :status, type: String, default: "Available" # Available, N/A
  # field :item_type
  # field :quantity, type: Integer
  field :item_image_uid
  field :code, type: String
  image_accessor :item_image

  attr_accessible :name, :description, :status, :item_type_id, :quantity, :item_image

  has_many :orders
  belongs_to :item_type
  belongs_to :borrower, class_name: "User"

  validates_presence_of :name, :item_type_id
end