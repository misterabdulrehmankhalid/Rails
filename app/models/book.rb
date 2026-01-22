class Book
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :description, type: String
  has_and_belongs_to_many :authors
end
