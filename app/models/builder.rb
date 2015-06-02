class Builder < ActiveRecord::Base
  validates :name, :title, presence: true, length: { minimum: 2, maximum: 20 }
  validates_uniqueness_of :name
end
