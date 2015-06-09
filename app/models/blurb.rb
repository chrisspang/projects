class Blurb < ActiveRecord::Base
  validates :description, presence: true, length: { minimum: 2, maximum: 2000 }

  ## Ensure we refer to a valid datasource_id
  validates :datasource, presence: true

  ## Ensure we refer to a valid project
  validates :project, presence: true

  validates_associated :images

  validates_with BlurbValidator
  
  scope :for_project, ->(project_id){ where('project_id = ?', project_id) if (project_id) }

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, :reject_if => ->(a) { a[:url].blank? }

  belongs_to :project
  belongs_to :datasource

end
