## CRM Ruby App

class Contact

attr_reader :id
attr_accessor :first_name, :last_name, :email, :notes

@@contacts = []  # store all contacts in an array
@@id = 1  # unique identifier for each contact

  def initialize(first_name, last_name, options = {})
    @first_name = first_name
    @last_name = last_name
    @email = options[:email]
    @notes = options[:notes]

    @id = @@id
    @@id += 1
  end

  # def find_first_open_id
  #   @@contacts.each_with_index do |id, i|
  #     return i if id == nil
  #   end
  # end

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

  def self.find(id)
    @@contacts.each do |contact|
      return contact if id == contact.id  # returns the contact object
    end
    return nil  # no contact was found so nil
  end

  def modify(category, change_field_to)
    case category
    when 2 then @first_name = change_field_to
    when 3 then @last_name = change_field_to
    when 4 then @email = change_field_to
    when 5 then @notes = change_field_to
    else
      nil
    end
  end

  def display
    ">> ID: #{@id}, First Name: #{@first_name}, Last Name: #{@last_name}, Email: #{@email}, Notes: #{@notes}"
  end

  def display_attribute(category)
    case category
    when 1 then "#{@id}"
    when 2 then "#{@first_name}"
    when 3 then "#{@last_name}"
    when 4 then "#{@email}"
    when 5 then "#{@notes}"
    else
      nil
    end

    ## this might work better in a web interface where the input is less restricted
    ## Thanks, Natalie Black!

    # if [:id, :first_name, :last_name].include?(category)
    #   send(category.to_sym)  # little nugget of pride
    # else
    #   nil
    # end
  end

  def delete
    @@contacts.delete_at(@id - 1)
  end


end
