class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :author, class_name: User
  
  scope :sorted, -> { order("updated_at DESC") }
end
