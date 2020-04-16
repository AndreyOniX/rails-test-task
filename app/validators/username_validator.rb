class UsernameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A[a-zA-Z0-9]+\Z/
      record.errors[attribute] << (options[:message] || 'is not a valid username')
    end
  end
end