class User < ActiveRecord::Base
    has_many :photos
    has_secure_password 
    validates :username, presence: true, uniqueness: true
end