## CRM Ruby App

class Contact

attr_reader = :id
attr_accessor :first_name, :last_name, :email, :notes

@@contacts = []  # store all contacts in an array
@@id = 1  # unique identifier for each contact

  def initialize(first_name, last_name, options = {})
    @id = @@id
    @first_name = first_name
    @last_name = last_name
    @email = options[:email]
    @notes = options[:notes]

    @@id += 1
  end

  # this method was created because we are tracking all contacts in an array
  def self.create(first_name, last_name, options)
    new_contact = self.new(first_name, last_name, options)  # same as Contact.new()
    @@contacts << new_contact
  end

  def self.all
    @@contacts
  end

  def self.sort
    @@contacts.sort
  end

  def self.modify

  end

  def display
    "#id: {@id}, first name: #{@first_name}, last name: #{@last_name}, email: #{@email}, notes: #{@notes}"
  end

  def self.display_attribute

  end

  def self.delete
  end

end
