
class BlurbValidator < ActiveModel::Validator

  ## Check that we only have one blurb per datasource for this project
  def validate(record)

    if Blurb.for_project(record.id).collect(&:datasource_id).count(record.datasource_id) > 1
      record.errors[:blurb] << 'Already exists for datasource'
    end
  end

end
