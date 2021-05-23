
Admin.create(email: "admin@studio.com", password: "12345678", password_confirmation: "12345678")

100.times do |n|
    first = Faker::Name.first_name
    last = Faker::Name.last_name
    email = "trainee+#{n}@studio.com"
    phone = rand.to_s[2..11]
    Trainee.create!(email: email, first: first, last: last, phone: phone)
    end


10.times do |n|
    first = Faker::Name.first_name
    last = Faker::Name.last_name
    email = "test+#{n}@studio.com"
    speciality = Faker::Fantasy::Tolkien.location
    description = Faker::Fantasy::Tolkien.poem 
    color = '#' + SecureRandom.hex(3)
    phone = rand.to_s[2..11]
    Instructor.create!(email: email, first: first, last: last,
                         speciality: speciality, description: description, phone: phone, color: color, password: "12345678", password_confirmation: "12345678")
    end

Instructor.all.each do |instructor|
    name = instructor.speciality + ' ' + rand(10).to_s
    duration = 60
    capacity = 15
    Activity.create!(name: name, duration: duration, capacity: capacity, instructor_id: instructor.id)
end

Activity.all.each do |activity|
    3.times do 
    TimeSlot.create(activity_id: activity.id, start_time: rand(1.month).seconds.from_now)
    end
end





