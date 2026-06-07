# Users
alice = User.find_or_create_by!(email: "alice@example.com") do |u|
  u.name = "Alice Johnson"
  u.dob = Date.new(1990, 3, 15)
  u.phone_number = "555-0101"
  u.address = "123 Main St, Springfield"
end

bob = User.find_or_create_by!(email: "bob@example.com") do |u|
  u.name = "Bob Smith"
  u.dob = Date.new(1985, 7, 22)
  u.phone_number = "555-0102"
  u.address = "456 Oak Ave, Springfield"
end

carol = User.find_or_create_by!(email: "carol@example.com") do |u|
  u.name = "Carol Davis"
  u.dob = Date.new(1992, 11, 2)
  u.phone_number = "555-0103"
  u.address = "789 Pine Rd, Springfield"
end

# Posts (created by Users)
post1 = Post.find_or_create_by!(title: "Getting Started with Rails") do |p|
  p.content = "Ruby on Rails is a web application framework..."
  p.user = alice
end

post2 = Post.find_or_create_by!(title: "Understanding Associations") do |p|
  p.content = "Active Record associations make it easy to work with related models."
  p.user = alice
end

post3 = Post.find_or_create_by!(title: "Rails Routing Deep Dive") do |p|
  p.content = "Routes are the entry points to your application."
  p.user = bob
end

# Editors (assigned to Posts via the M2M join table)
dave = User.find_or_create_by!(email: "dave@example.com") do |u|
  u.name = "Dave Wilson"
  u.dob = Date.new(1988, 5, 10)
  u.phone_number = "555-0201"
  u.address = "321 Elm St, Springfield"
end

eve = User.find_or_create_by!(email: "eve@example.com") do |u|
  u.name = "Eve Turner"
  u.dob = Date.new(1991, 9, 18)
  u.phone_number = "555-0202"
  u.address = "654 Birch Ln, Springfield"
end

# Assign editors to posts (idempotent)
[post1, post2].each { |p| PostEditor.find_or_create_by!(post: p, editor: dave) }
[post2, post3].each { |p| PostEditor.find_or_create_by!(post: p, editor: eve) }
