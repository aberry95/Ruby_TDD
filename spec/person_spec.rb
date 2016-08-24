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

