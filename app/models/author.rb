class Author
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :dob, type: Date
  has_and_belongs_to_many :books
end
