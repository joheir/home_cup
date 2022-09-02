module ApplicationHelper

  def conditional_p(value)
    return if value.nil?

    content_tag(:p, value.capitalize, {})
  end

  def show_all_packing_items(packing)
    attributes = packing.attributes
    item_count = attributes.keys.grep(/item/).count
    result = (1..item_count).map do |i|
      conditional_p(attributes["item#{i}"])
    end
    result.compact.join.html_safe
  end
end
