class Blurb < ActiveRecord::Base
  validates :description, presence: true, length: { minimum: 2, maximum: 200 }

  has_many :images, dependent: :destroy

  belongs_to :datasource
end
