class Contact

	attr_accessor :id, :firstname, :lastname, :email, :notes

	def initialize(id, firstname, lastname, email, notes)
		@id = id,
		@firstname = firstname,
		@lastname = lastname,
		@email = email,
		@notes = notes
	end

	def display(contact)
		puts "Here is the info you've stored for this #{contact.firstname}"
		puts "-------------------------------------------------------------"
		puts "ID: #{contact.id}"
		puts "First Name: #{contact.firstname}"
		puts "Last Name:  #{contact.lastname}"
		puts "Email:      #{contact.email}"
		puts "Notes:      #{contact.notes}"
	end

end