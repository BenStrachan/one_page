class AddPhotoToBlogs < ActiveRecord::Migration[5.1]
  def up
    add_attachment :blogs, :photo
  end

  def down
    remove_attachment :blogs, :photo
  end
end
