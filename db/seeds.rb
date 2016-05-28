require 'pp'

pp User.create_with(password: 'password').find_or_create_by(email: 'user@mail.com')
