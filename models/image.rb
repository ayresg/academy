# models/image.rb
class Image < ActiveRecord::Base
  @@license_links = {
      'CC0' => 'https://creativecommons.org/publicdomain/zero/1.0/',
      'CC BY-SA 2.0' => 'https://creativecommons.org/licenses/by-sa/2.0/'
      }
  def attribution
    title = name && !name.empty? ? "<cite>#{name}</cite>" : "Photo"
    licensing_info = 
      if license
        ", licensed under <a href='#{@@license_links[license]}'>#{license}</a>"
      else
        nil
      end
    "<a href='#{image_address}'>#{title}</a> by 
    <a href='#{author_address}'>#{author_name}</a>#{licensing_info}</a>"
  end
end