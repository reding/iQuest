class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :content, presence: true, length: { maximum: 3000 }
  validate :question_id, presence: true
end
