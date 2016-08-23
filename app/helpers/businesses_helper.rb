module BusinessesHelper

  def show_business_details(business)
    string = ""
    business.attributes.each do |attribute|
      unless attribute[0] == "location"
        string += "#{attribute[0]}: "
        string += " #{attribute[1]}<br>"
      end
    end
    content_tag :p, string.html_safe
  end

  def show_query_details(business)
    string = ""
    business.to_h.each do |attribute|
      unless attribute[0] == "location"
        string += "#{attribute[0]}: "
        string += " #{attribute[1]}<br>"
      end
    end
    content_tag :p, string.html_safe
  end

  def show_attribute_label(attribute)
  end

end
