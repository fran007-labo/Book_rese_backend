user = User.create(
  name: 'user',
  uid: 'nrelkamklsdjafewfwel'
)

50.times do |n|
  Book.create(
    name:  Faker::Name.name, 
    user: user.id
  )

  Image.create( 
    src: 'https://picsum.photos/150',
    user: user.id 
  )
end

