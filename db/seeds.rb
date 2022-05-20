User.destroy_all
UserProfile.destroy_all

ch = Category.create!(name: 'Chinese')
fr = Category.create(name: 'French')
ind = Category.create(name: 'Indian')
us = Category.create(name: 'American')

a = User.create!(email: 'admin@admin.com', password: '123456')
a.add_role :admin
UserProfile.create!(name: 'administrator', phone_number: '0439200529', user: a)

y = User.create!(email: 'a@a.com', password: '123456')
y.add_role :seller
b = UserProfile.create!(name: 'ben', phone_number: '0493002937', user: y)

o = User.create!(email: 'buyer@buyer.com', password: '123456')
o.add_role :buyer
v = UserProfile.create!(name: 'charlie', phone_number: '0432545868', user: o)

c = b.listings.create!(title: "5555555", price: 100, listing_description: 'Founded in 2005, blah blah blah')
b.listings.create!(title: "Sam's borgirs", price: 333, listing_description: 'Lorem Ipsum')
c = b.listings.create!(title: "wok on wheels", price: 100, listing_description: 'Founded in 2005, blah blah blah')
b.listings.create!(title: "Sam's borgirs", price: 333, listing_description: 'Lorem Ipsum')
c = b.listings.create!(title: "wok on wheels", price: 100, listing_description: 'Founded in 2005, blah blah blah')
b.listings.create!(title: "Sam's borgirs", price: 333, listing_description: 'Lorem Ipsum')
c = b.listings.create!(title: "wok on wheels", price: 100, listing_description: 'Founded in 2005, blah blah blah')
b.listings.create!(title: "Sam's borgirs", price: 333, listing_description: 'Lorem Ipsum')
c = b.listings.create!(title: "wok on wheels", price: 100, listing_description: 'Founded in 2005, blah blah blah')
b.listings.create!(title: "Sam's borgirs", price: 333, listing_description: 'Lorem Ipsum')

menu1 = c.menus.create!(title: 'Mains')
menu2 = c.menus.create!(title: 'Drinks')

menu1.menu_items.create!(name: 'fried rice', description: 'its fried rice')
menu1.menu_items.create!(name: 'chow mein', description: 'its chow mein')
menu2.menu_items.create!(name: 'coke', description: 'blablabla')
menu2.menu_items.create!(name: 'coffee', description: 'xxxxdddddd')

ListingCategory.create!(listing: c, category: ch)

# item = MenuItem.create!(name: 'fried rice', description: 'its fried rice')





# Menu.create(


# menu = Menu.create! (menu_item: item, title: 'mains')
# menu.menu_items
# a = Listing.create!(name: "wok on wheels", user: a, menu: menu)



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
