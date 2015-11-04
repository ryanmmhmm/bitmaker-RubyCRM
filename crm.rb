require_relative './contact.rb'

class CRM
  def initialize(name)
    @name = name
  end

  def print_main_menu
    puts "******************************"
    puts "==========Main Menu==========="
    puts "******************************"
    puts "1. Add a contact"
    puts "2. Modify a contact"
    puts "3. Display all contacts"
    puts "4. Display a contact"
    puts "5. Display contact attribute"
    puts "6. Delete a contact"
    puts "7. Exit"
    puts "******************************"
  end

  def main_menu
    while true
      print_main_menu
      print "Choose an option: "
      user_input = gets.chomp.to_i
      break if user_input == 7
      choose_option(user_input)
    end
  end

  def choose_option(user_input)
    case user_input
    when 1 then add_contact
    when 2 then modify_contact
    when 3 then display_all_contacts
    when 4 then display_contact
    when 5 then display_contact_attr
    when 6 then delete_contact
    else
        puts "I'm sorry Dave, I'm afraid you can't do that."
    end
  end

  def add_contact
    print "First Name: "
    first_name = gets.chomp.to_s

    print "Last Name: "
    last_name = gets.chomp.to_s

    print "Email: "
    email = gets.chomp.to_s

    print "Notes: "
    notes = gets.chomp.to_s

    Contact.create(first_name, last_name, email: email, notes: notes)
  end

  def ask_for_id  # find a contact by ID number
    while true
      print "What Contact ID are you looking for?: "
      id = gets.chomp.to_i
      break if id.integer? == true
      puts "That ID isn't in our records..."
    end
    Contact.find(id) # => returns contact object
  end

  def modify_contact
    contact = ask_for_id
    category = choose_available_attr("modify")
    print "What would you like to change it to?: "
    change_field_to = gets.chomp
    contact.modify(category, change_field_to)
    puts "Contact ID: #{contact.id} has been updated."
    puts contact.display
  end

  def display_all_contacts
    Contact.all.each do |value|
      puts value.display
    end
  end

  def print_available_attr
    puts "***********************"
    puts "==Available Atributes=="
    puts "***********************"
    puts "1. ID"
    puts "2. First Name"
    puts "3. Last Name"
    puts "4. Email"
    puts "5. Notes"
    puts "6. Exit"
    puts "***********************"
  end

  def choose_available_attr(typify)
    while true
      print_available_attr
      print "What would you like to #{typify}?: "
      user_input = gets.chomp.to_i
      break if user_input <=6
      puts "That's not a valid attribute!"
    end
    return user_input
  end

  def display_contact_attr
    contact = ask_for_id
    user_input = choose_available_attr("see")
    puts "Here is what you're looking for: #{contact.display_attribute(user_input)}"
  end

  def delete_contact
    contact = ask_for_id
    print "Are you sure you want to delete this contact? (Y = yes): "
    user_input = gets.chomp
    contact.delete if user_input == "Y"
  end

end

my_awesome_crm = CRM.new('Bitmaker CRM')
my_awesome_crm.main_menu
