class AddProjectToBlurb < ActiveRecord::Migration
  def change
    add_reference :blurbs, :project, index: true, foreign_key: true
  end
end
