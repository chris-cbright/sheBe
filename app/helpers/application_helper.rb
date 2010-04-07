# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def is_admin?
    cookies[:admin] == APP_CONFIG[:admin_cookie]
  end
  
  def tag_link_list(post = nil)
    output = ""
    tags = post.nil? ? Post.tag_counts_on(:tags) : post.tags
    tags.each do |tag|
      output += "<a href='#{posts_path}?tag=#{tag.name}'>#{tag.name}</a> "
    end
    output
  end
  
end
