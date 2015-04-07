class Band
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  has_and_belongs_to_many :instruments, inverse_of: nil
  accepts_nested_attributes_for :instruments, allow_destroy: true
end


