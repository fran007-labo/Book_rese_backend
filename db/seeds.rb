user = User.create!(
  name: 'user',
  uid: 'nrelkamklsdjafewfwel'
)

50.times do |n|
  Book.create!(
    title:     Faker::Book.title, 
    author:    Faker::Book.author, 
    publisher: Faker::Book.publisher,
    body:      Faker::Books::Lovecraft.sentence,
    user_id:   user.id
  )

  2.times do 
    Image.create!(
      src: 'https://picsum.photos/150',
      book_id: n + 1
    )
  end
end

