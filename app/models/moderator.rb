class Moderator < ActiveRecord::Base
	has_secure_password

	has_many :posts

	validates :fullname, presence: true
	validates :username, presence: true, format: {with: /\A[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+\z/, message: 'is not valid'}
	validates :password, presence: true

end
