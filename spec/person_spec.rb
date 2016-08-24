require 'spec_helper'

describe "Person class - entry in phonebook" do
  it "should store and return personal information" do
    person = Person.new("joe", "bloggs", "1 Jan 1996")

    # # Expected Outcomes
    expect(person.dob.to_s).to eq "1996-01-01"

    expect(person.first_name).to eq "Joe"
    expect(person.surname).to eq "Bloggs"
    expect(person.fullname).to eq "Joe Bloggs"
  end
end