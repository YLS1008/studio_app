100.times do |n|
    first = Faker::Name.first_name
    last = Faker::Name.last_name
    email = "test+#{n+1}@studio.com"
    phone = rand.to_s[2..11]
    Trainee.create!(email: email, first: first, last: last, phone: phone)
    end


10.times do |n|
    first = Faker::Name.first_name
    last = Faker::Name.last_name
    email = "test+#{n+1}@studio.com"
    speciality = Faker::Fantasy::Tolkien.location
    description = Faker::Fantasy::Tolkien.poem 
    color = '#' + SecureRandom.hex(3)
    phone = rand.to_s[2..11]
    Instructor.create!(email: email, first: first, last: last,
                         speciality: speciality, description: description, phone: phone, color: color, password: "10081990", password_confirmation: "10081990")
    end

Instructor.all.each do |instructor|
    name = instructor.speciality + ' ' + rand(10).to_s
    duration = 60
    capacity = 15
    payment = "entry"
    Activity.create!(name: name, duration: duration, capacity: capacity, payment: payment, instructor_id: instructor.id)
end

Activity.all.each do |activity|
    activity.build_contract(rate_type: rand(0..4), rate: "50")
end





