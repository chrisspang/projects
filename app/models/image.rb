class Image < ActiveRecord::Base
  validates :url, presence: true

  belongs_to :blurb

  scope :for_blurb, ->(blurb_id){ where('blurb_id = ?', blurb_id) if (blurb_id) }
end
