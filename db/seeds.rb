
a = User.create!(email: 'a@a.com', password: 'hudson')
b = UserProfile.create!(name: 'ben', phone_number: '33333', user: a)

ch = Category.create!(name: 'Chinese')

b.listings.create!(name: "wok on wheels", price: 100, listing_description: 'Founded in 2005, blah blah blah')

menu = Menu.create!(title: 'Mains')

menu.menu_items.create!(name: 'fried rice', description: 'its fried rice')

# item = MenuItem.create!(name: 'fried rice', description: 'its fried rice')





# Menu.create(


# menu = Menu.create! (menu_item: item, title: 'mains')
# menu.menu_items
# a = Listing.create!(name: "wok on wheels", user: a, menu: menu)


# fr = Category.create(name: 'French')
# ind = Category.create(name: 'Indian')
# us = Category.create(name: 'American')
# jp = Category.create(name: 'Japanese')
# th = Category.create(name: 'Thai')
# it = Category.create(name: 'Italian')
# tk = Category.create(name: 'Turkish')
# kr = Category.create(name: 'Korean')
# vn = Category.create(name: 'Vietnamese')
# gk = Category.create(name: 'Greek')


puts "UsersProfile: #{UserProfile.count}"
puts "Users: #{User.count}"
puts "MenuItem: #{MenuItem.count}"
puts "Menu: #{Menu.count}"
puts "categories: #{Category.count}"
puts "listings: #{Listing.count}"
