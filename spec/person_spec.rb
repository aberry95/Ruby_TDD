require 'spec_helper'

describe "Person class - entry in phonebook" do
	before(:each) do 
		@person = Person.new("joe", "bloggs", "1 Jan 1996")
	end
	it "should store and return personal information" do
		expect(@person.dob.to_s).to eq "1996-01-01"
		expect(@person.first_name).to eq "Joe"
		expect(@person.surname).to eq "Bloggs"
		expect(@person.fullname).to eq "Joe Bloggs"
	end
	it "should store mutiple emails and phone numbers" do 

		@person.add_emails ("joe@foo.com")
		@person.add_emails ("joe.bloggs@work.com")
		@person.add_phones ("07712345678")
		@person.add_phones ("02012345678")
		expect(@person.emails).to eq ["joe@foo.com", "joe.bloggs@work.com"]
		expect(@person.phone_numbers).to eq ["07712345678", "02012345678"]
		@person.remove_emails(0)
		expect(@person.emails).to eq ["joe.bloggs@work.com"]
	end
end

describe "FamilyMember class - entry in phonebook" do
	it "should store and return personal information of relative" do
		family = FamilyMember.new("bo","derek","6 Jun 1995", "Uncle")
		expect(family.dob.to_s).to eq "1995-06-06"
		expect(family.first_name).to eq "Bo"
		expect(family.surname).to eq "Derek"
		expect(family.fullname).to eq "Bo Derek"
		expect(family.relationship).to eq "Uncle"
	end
end

describe "PhoneBook class -  adding contents in phonebook" do
	it "should store and return personal information of relative" do
		book = PhoneBook.new
		person1 = Person.new("joe", "bloggs", "1 Jan 1990")
		person2 = Person.new("andy", "nother", "2 Jan 1995")
		family = FamilyMember.new("bo","derek","6 Jun 1995", "Uncle")
		book.add(person1)
		book.add(person2)
		book.add(family)
		expect(book.list).to eq ["Joe Bloggs", "Andy Nother", "Bo Derek"]
		imposter = Imposter.new
		expect(book.add(imposter)).to eq "Not family member or person"
	end
end




