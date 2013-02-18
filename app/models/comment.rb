class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :author, class_name: User
  attr_accessible :author_id, :body, :commentable_id, :commentable_type

  default_scope order("updated_at DESC")
end
