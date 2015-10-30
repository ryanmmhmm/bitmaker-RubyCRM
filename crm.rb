require_relative 'contact.rb'

class CRM
	def initialize(name)
		@name = name
	end

	def print_main_menu
		puts "1. Add a contact"
		puts "2. Modify a contact"
		puts "3. Display all contacts"
		puts "4. Display a contact"
		puts "5. Display contact attribute"
		puts "6. Delete a contact"
		puts "7. Exit"
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
end

my_awesome_crm = CRM.new('Bitmaker CRM')
my_awesome_crm.main_menu