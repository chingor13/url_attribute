class User < ActiveRecord::Base

  url_attribute :website, :facebook
  url_attribute :stem, normalize: false

  validates :website, presence: true, url: { allow_blank: true }
  validates :facebook, url: { allow_blank: true }

end