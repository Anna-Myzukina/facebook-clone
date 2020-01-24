class User < ApplicationRecord
   attr_writer :login
   has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, 
          :rememberable,  :validatable,authentication_keys: [:login]
        def login
           @login || self.username || self.email
        end
end
