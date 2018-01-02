module ApplicationHelper

def dynamic_title(page_title)
  first_part = 'Travel Hipe'
  if page_title.empty?
    first_part
  else
    "#{first_part} | #{page_title}"
  end
end
      
end
