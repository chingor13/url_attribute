# UrllAttribute [![Build Status](https://travis-ci.org/chingor13/url_attribute.png)](https://travis-ci.org/chingor13/url_attribute)

ActiveModel attribute serialization for urls.

## Usage

Assuming you have a column named `url` on the `users` table, you can easily add url handling with:

```
class User < ActiveRecord::Base
  url_attribute :url
end

user = User.new({
  url: "chingr.com"
})

email.address
=> "Jeff Ching <ching.jeff@gmail.com>"

email.address = "ching.jeff@gmail.com"
email.address
=> "ching.jeff@gmail.com"

email.address = "some bad email address"
email.address
=> "some bad email address"
```

You can also specify a column as a email address list type, which is a serialized array of email addresses.

```
class Email < ActiveRecord::Base
  email_address_list_attribute :to
end

email = Email.new({
  to: "Jeff Ching <ching.jeff@gmail.com>; email@foo.com"
})
email.to
=> "Jeff Ching <ching.jeff@gmail.com>; email@foo.com"

email.to.length 
=> 2

```

## Validating

`EmailAttribute` provides validation to `ActiveModel`.  To use:

```
class EmailAddresses < ActiveRecord::Base
  email_address_attribute :address
  validates :address, email: { 
    allow_blank: true,
    message: "is invalid"
  }
end

email = EmailAddress.new({
  address: "some bad email address"
})
email.save
=> false

email.errors.full_messages
=> ["Address is invalid"]
```

## Formatting

`PhonyAttribute` comes built with a few named formats. You can add your own by adding to the `PhonyAttribute::PhoneNumber.named_formats` hash.  The value can be either an options hash (passed directly to Phony's format) or a callable Proc/lambda that yields the phone number object.


## License

This project rocks and uses MIT-LICENSE.
