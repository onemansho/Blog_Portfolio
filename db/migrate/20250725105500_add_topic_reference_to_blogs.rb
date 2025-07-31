class AddTopicReferenceToBlogs < ActiveRecord::Migration[8.0]
  def change
    add_reference :blogs, :topic, foreign_key: true
  end
end
