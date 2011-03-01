module ApplicationHelper
    
  def logo
    image_tag("logo.png", :alt => "LaunchBox logo", :class => "round", :size => "200x50")
  end
  
end
