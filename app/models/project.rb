class Project < ActiveRecord::Base
  validates :name, :title, presence: true, length: { minimum: 2, maximum: 20 }
  validates :latitude, :longitude, presence: true, numericality: { only_integer: false }

  ## This ensures we refer to a valid builder_id
  validates :builder, presence: true

  validates_uniqueness_of :name, :title

  has_many :blurbs, dependent: :destroy

  belongs_to :builder

  scope :search, ->(keyword){ where('title LIKE ?', "%#{keyword.downcase}%") if keyword.present? }

  scope :unverified, ->(unverified) { where(verified: false) if unverified.present? }

  scope :for_builder, ->(builder_id){ where('builder_id = ?', builder_id) if (builder_id) }
end
