# global namespace so you can use the rails 3 "validate :field, email: [options]"
class UrlValidator < ActiveModel::EachValidator
  def validate_each(record,attribute,value)
    return if value.blank? && options[:allow_blank]

    case value
    when UrlAttribute::Url
      record.errors.add(attribute, options.fetch(:message, :invalid)) unless value.valid?
    when String
      record.errors.add(attribute, options.fetch(:message, :invalid)) unless UrlAttribute::Url.load(value).valid?
    end
  end

end
