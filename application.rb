class Person
require 'date'
	attr_accessor :first_name, :surname, :dob
	attr_reader :fullname
	def initialize(name,sname,dob)
		@first_name = name.capitalize
		@surname = sname.capitalize
		@dob = Date.parse(dob)
		@fullname = @first_name + " " + @surname
	end


end