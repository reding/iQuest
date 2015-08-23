class Invite < ActiveRecord::Base
  belongs_to :user
  validates :invited_id, presence: true
end
