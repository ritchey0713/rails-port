User.create!(
  email: "ritchey0713@gmail.com",
  password: ENV.fetch('ADMIN_PASSWORD'),
  password_confirmation: ENV.fetch('ADMIN_PASSWORD'),
  user_name: "Dj Ritchey",
  roles: "site_admin"
)
puts "Admin user created!"

User.create!(
  email: "test@test.com",
  password: "asdasdasd",
  password_confirmation: "asdasdasd",
  user_name: "Test User",
)

puts "test user created"

3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
  )
end 

puts "create topics"


35.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    topic_id: Topic.last.id
    )
end

puts "10 blogs created"

5.times do |skill|
  Skill.create(
    title: "Rails #{skill}",
    percent_utilized: 15
  )
end 

puts "5 skills created"

8.times do |project|
Portfolio.create(
  title: "portfolio title #{project}",
  subtitle: "Ruby on Rails",
  body: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
  main_image: "https://via.placeholder.com/600X400", 
  thumb_image: "https://via.placeholder.com/350X200"
)
end 

2.times do |project|
  Portfolio.create(
    title: "portfolio title #{project}",
    subtitle: "React",
    body: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
    main_image: "https://via.placeholder.com/600X400", 
    thumb_image: "https://via.placeholder.com/350X200"
  )
  end 

puts "9 portfolio projects created"

3.times do |tech|
  Portfolio.last.technologies.create(
    name: "Technology #{tech}"
  )
end 

puts "3 technologies created"