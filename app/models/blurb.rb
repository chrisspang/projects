class Blurb < ActiveRecord::Base
  validates :description, presence: true, length: { minimum: 2, maximum: 200 }

  scope :for_project, ->(project_id){ where('project_id = ?', project_id) if (project_id) }

  has_many :images, dependent: :destroy

  belongs_to :project
  belongs_to :datasource
end
