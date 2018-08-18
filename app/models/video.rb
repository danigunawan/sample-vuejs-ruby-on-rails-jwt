class Video < ApplicationRecord
  belongs_to :user

  def self.video_find_by_user_id(user_id)
    Video.where(user_id: user_id)
  end
end
