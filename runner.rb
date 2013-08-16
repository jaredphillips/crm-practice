require_relative 'contact.rb'
require_relative 'database.rb'
require 'pry'

class Runner

		@db = Database.new

		loop do

			puts "Welcome to the awesome Contact Manager. I will try not to lose your shit"
			puts "What would you like to do?"
			puts "Add               - press 1"
			puts "Modify            - press 2"
			puts "Display All       - press 3"
			puts "Display Contact   - press 4"
			puts "Display Attribute - press 5"
			puts "Delete Contact    - press 6"
			puts "Exit              - press 7"

			input = gets.chomp.to_i

		  case input

		  when 1 # Create a new contact
		  	puts "Great, lets add a contact\n"
				puts "All fields are required."
				puts "Pick an ID number?"
				id = gets.chomp
				puts "First name: "
				firstname = gets.chomp
				puts "Last name: "
				lastname = gets.chomp
				puts "Email: "
				email = gets.chomp
				puts "Notes: "
				notes = gets.chomp
				
				contact = Contact.new(
					@id = id,
					@firstname = firstname,
					@lastname = lastname,
					@email = email,
					@notes = notes
				)
				
				if @db.add(contact)
					puts "Your contact has been saved"
				end

		  when 2 # Modify a contact
		  	# first find a contact
		  	puts "What contact are you looking for for?"
		  	search = gets.chomp
		  	contact = @db.find_contact(search)
		  	puts "Great, lets update #{contact.firstname}!"

		  	puts "What attribute do you want modify?"
		  	attribute = gets.chomp.downcase

		  	if attribute == 'first name'
		  		attribute = 'firstname'
		  	elsif attribute == 'last name'
		  		attribute = 'lastname'
		  	else
		  		attribute
		  	end

		  	puts "Ok, lets update #{attribute} to...?"
		  	new_value = gets.chomp
		  	@db.modify_contact(contact, attribute, new_value)
	      puts "Done, #{contact.firstname}'s #{attribute} has been updated to #{new_value}"

			when 3 # Display all contacts
				@db.display_all_contacts

			when 4 #display a contact
				puts "Search by id, first name, last name or email address?"
			  search = gets.chomp.downcase
			  puts "Yep, found them. Here you go."

	      contact = @db.find_contact(search)
	      contact.display(contact)

			when 5
			  puts 'You need help!!!'
			when 6
			  puts 'You need help!!!'
			when 7
			  break
			else
			  puts "Didn't catch that"
			end	
	end
end