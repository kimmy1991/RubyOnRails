class User
	#creates getters and setters for instance variables name and email
	attr_accessor :name, :email

	#constructor called doing classname.new
	def initialize(attributes = {}) 
		@name = attributes[:name] 
		@email = attributes[:email]
	end
	def formatted_email 
		"#{@name} <#{@email}>"
	end 
end