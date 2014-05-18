# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
	# Tells rails which variables are accessible outside and modified automatically by users (suchs as submitting a request with a browser)
	#attr_accessible :name, :email not used in rails 3.2.2 +

	#attr_accessor :name, :email, :password, :password_confirmation
	has_secure_password

	before_save() {|user| user.email = email.downcase}
	validates(:name, presence: true, length:{maximum:50})
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates(:email, presence: true, format:{ with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false})
	validates :password, presence: true, length: { minimum: 6 }
	validates :password_confirmation, presence: true
end
