class Cat < ApplicationRecord
  validates :name, presence: true

  belongs_to :owner
end
