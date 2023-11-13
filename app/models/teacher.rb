class Teacher < ApplicationRecord
  validates :name, presence: true
  attribute :age, :integer
  validates :age, numericality: { only_integer: true, allow_nil: false }
end
