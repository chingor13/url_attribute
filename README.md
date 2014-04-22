# UrlAttribute [![Build Status](https://travis-ci.org/chingor13/url_attribute.png)](https://travis-ci.org/chingor13/url_attribute)

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

user.url.class
=> UrlAttribute::NormalizedUrl

user.url.to_s
=> "http://chingr.com"

user.url = nil
user.url
=> nil

```

You can also specify a column to ignore url normalization.

```
class User < ActiveRecord::Base
  url_attribute :stem, normalize: false
end

user = User.create({
  name: "Jeff",
  stem: "chingr.com"
})
user.stem.to_s
=> "chingr.com"

```

## Validating

`UrlAttribute` provides validation to `ActiveModel`.  To use:

```
class User < ActiveRecord::Base
  url_attribute :url
  validates :url, url: { 
    allow_blank: true,
    message: "is invalid"
  }
end

user = User.new({
  name: "Jeff",
  url: "some invalid url"
})

user.save
=> false

user.errors.full_messages
=> ["Url is invalid"]

```

## License

This project rocks and uses MIT-LICENSE.
