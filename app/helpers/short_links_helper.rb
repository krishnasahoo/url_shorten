require 'uri'
module ShortLinksHelper
  def uniq_key
    ## loop until unique key is generated
    key = ''
    loop do
      key = (5.times.map { [*'a'..'z',*'0'..'9'].sample }.join)
      sl = ShortLink.where(key: key).first
      if !sl.present?
        break
        
      end
    end ## loop end
    return key
  end


  
end
