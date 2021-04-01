class User < ActiveRecord::Base
    has_many :photos  #class methods in macros they give the method .photos.
    has_secure_password 
    validates :username, presence: true, uniqueness: true
end