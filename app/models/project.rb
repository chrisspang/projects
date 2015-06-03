class Project < ActiveRecord::Base
  validates :name, :title, presence: true, length: { minimum: 2, maximum: 20 }
  validates :latitude, :longitude, presence: true
  validates_uniqueness_of :name

  has_many :blurb, dependent: :destroy
  
  belongs_to :builder

  scope :search, ->(keyword){ where('title LIKE ?', "%#{keyword.downcase}%") if keyword.present? }

  scope :for_builder, ->(builder_id){ where('builder_id = ?', builder_id) if (builder_id) }
  
end
