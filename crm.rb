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
end

