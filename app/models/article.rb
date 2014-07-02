class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, as: :voteable, dependent: :destroy

  validates :title, presence: true
  validates :url, format: { with: /\Ahttp/ }
  # validates! :user_id, presence: true
end
