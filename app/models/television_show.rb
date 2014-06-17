class TelevisionShow < ActiveRecord::Base
  has_many :characters
  has_many :actors, through: :characters
  validates :title,
    presence: true,
    uniqueness: { scope: :network }
end
