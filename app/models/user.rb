class User < ActiveRecord::Base

	#downcase email prior to saving to DB
	before_save { self.email = email.downcase }

	#requires name cant be blank, max length assigned
	validates :name, presence: true, length: { maximum: 64 }

	#source of email regex: https://www.railstutorial.org/book/modeling_users
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	#requires email: 
		#cant be blank
		#max length assigned
		#must be valid format
		#must be unique: true, case_sensitive: false
	validates :email, presence: true, length: { maximum: 255 },
				format: { with: VALID_EMAIL_REGEX },
				uniqueness: { case_sensitive: false }

	#has_secure_password, provides: 
		#ability to save a securely hashed password_digest attribute to db
		#a pair of virtual attributes (password and password_confirmation), 
			#including presence validations upon object creation and a validation 
			#requiring that they match
		#An authenticate method that returns the user when the password is correct 
			#(and false otherwise)
	has_secure_password
	#password must be present, and minimum of 8 chars
	validates :password, presence: true, length: { minimum: 8 }

end
