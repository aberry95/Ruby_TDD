class Person
require 'date'
	attr_accessor :first_name, :surname, :dob
	attr_reader :fullname,:emails,:phone_numbers

	def initialize(name,sname,dob)
		@first_name = name.capitalize
		@surname = sname.capitalize
		@dob = Date.parse(dob)
		@fullname = @first_name + " " + @surname
		@emails = []
		@phone_numbers = []
	end
	def add_emails(input_email)
		@emails.push(input_email)
	end

	def add_phones(input_phone_number)
		@phone_numbers.push(input_phone_number)
	end

	def remove_emails(index)
		@emails.delete_at(index)
	end
end

class FamilyMember < Person
	attr_reader :relationship
	def initialize(name,sname,dob,relationship)
		super(name,sname,dob)
		@relationship = relationship
	end
end

class PhoneBook < Person	
	attr_reader :list
	def initialize
		@list = []
	end
	def add(person)
		person.is_a?(Person) || person.is_a?(FamilyMember) ? @list.push(person.fullname) : "Not family member or person" 
	end
end

class Imposter
	attr_accessor :thing
end
