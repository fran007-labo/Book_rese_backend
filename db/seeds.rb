user = User.create(
  name: 'user',
  uid: 'nrelkamklsdjafewfwel'
)

50.times do |n|
  Book.create(
    name:  Faker::Name.name, 
    user: user.id
  )

  2.times do 
    Image.create( 
      src: 'https://picsum.photos/150',
      book_id: n + 1
    )
  end
end

