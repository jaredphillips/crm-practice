class Database

	attr_accessor :contact, :contacts_array

	def initialize
		@contacts_array = []
	end

	def add(contact)
		@contacts_array.push contact
	end

	def find_contact(search)
    @contacts_array.each do |contact|
      if (contact.id      == search ||
      	contact.firstname == search ||
      	contact.lastname  == search ||
      	contact.email     == search)
	      return contact
	    end
    end
	end

	def modify_contact(contact, attribute, new_value)
    contact.send("#{attribute}=", new_value)
    return contact
	end

	def display_all_contacts
		@contacts_array.each do |contact|
			contact.display(contact)
		end
	end

	def display_info_by_attribute
	end

	def delete_contact
	end
end