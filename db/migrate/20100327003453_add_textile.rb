class AddTextile < ActiveRecord::Migration
  def self.up
    add_column :posts, :content_textile, :text
  end

  def self.down
    remove_column :posts, :content_textile
  end
end
