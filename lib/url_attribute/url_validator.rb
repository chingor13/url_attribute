# global namespace so you can use the rails 3 "validate :field, email: [options]"
class UrlValidator < ActiveModel::EachValidator
  def validate_each(record,attribute,value)
    return if value.blank? && options[:allow_blank]

    case value
    when UrlAttribute::Url

    when String
    end
  end

end
