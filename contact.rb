# Build a contact list
# Create a menu that allows a user to select 1) Create a contact 2) View All Contacts 3) Exit
# The menu should loop until the user exits

@contacts = [{ name: "Du", number: "385-216-9376" },
{ name: "Ruby", number: "801-111-1111" },
{ name: "Sapphire", number: "801-222-2222" }]

def menu
  puts "1) View all contacts"
  puts "2) Add a contact"
  puts "3) Exit"
  puts "4) Delete a contact"
end

def menu_choice
  menu
  choice = gets.to_i
  case choice
  when 1
    view_all
  when 2
    add_contact
  when 3
    delete_contact
  when 4
    puts "Goodbye"
    exit
  else
    puts "Invalid selection, please try again"
  end
  menu_choice
end

def view_all
  @contacts.each_with_index do |disp, i|
    puts "#{i+1} --- #{disp[:name]} #{disp[:number]}"
  end
end

def add_contact
  puts "Add new contact: "
  print "name: "
  name = gets.chomp.to_s
  print "Add new number: "
  print "number: "
  number = gets.chomp.to_s
  new_contact = { name: "#{name}", number: "#{number}" }
  @contacts << new_contact
end

def delete_contact
  puts "Select a contact to remove: "
  view_all
  choice = gets.to_i
  @contacts.delete_at(choice - 1)
end

menu_choice
