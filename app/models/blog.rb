class Blog < ApplicationRecord
  enum status: {draft: 0, published: 1}
  extend FriendlyId 
    friendly_id :title, use: :slugged

    validates_presence_of :title, :body, :topic_id
    belongs_to :topic
    has_many :comments, dependent: :destroy

    scope :featured_blogs, -> {order(created_at: :desc).limit(3)}

    scope :desc_blogs, -> {order(updated_at: :desc)}

    
end
