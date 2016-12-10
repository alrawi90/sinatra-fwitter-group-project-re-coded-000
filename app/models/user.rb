class User < ActiveRecord::Base
   has_many :tweets
   has_secure_password

  def slug
    self.username.downcase.gsub(" ","-")
  end
  def authenticate(pass)
  	  pass.length > 3 ? self : false
  end
  def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
  end
end