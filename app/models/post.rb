class Post < ActiveRecord::Base
  acts_as_taggable_on :tags 
  default_scope :order => 'created_at DESC'
  before_save :convert_to_html
  
  validates_presence_of :title, :content_textile, :tag_list
  
  def summary
    self.content.split("</summary>").first 
  end
  
  def more?
    self.content.include?("</summary>")
  end
  
  private
    def convert_to_html
      self.content = RedCloth.new(self.content_textile).to_html
    end
end
