require 'pp'

pp user = User.create_with(password: 'password').find_or_create_by(email: 'user@mail.com')

languages = [
  { name: "Ruby", image_url: "http://nicholasjohnson.com/images/sections/ruby.png" },
  { name: "Ruby on Rails", image_url: "https://upload.wikimedia.org/wikipedia/en/thumb/e/e9/Ruby_on_Rails.svg/791px-Ruby_on_Rails.svg.png" },
  { name: "JavaScript", image_url: "https://www.codementor.io/assets/page_img/learn-javascript.png" },
  { name: "CofeeScript", image_url: "https://pbs.twimg.com/profile_images/557241144392708096/slQydAMv.png" },
  { name: "Html", image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/2000px-HTML5_logo_and_wordmark.svg.png" },
  { name: "Css", image_url: "http://vignette2.wikia.nocookie.net/howtoprogram/images/a/a9/CSS3.png/revision/latest?cb=20130422012035" },
  { name: "Sass", image_url: "http://sass-lang.com/assets/img/logos/logo-b6e1ef6e.svg" },
  { name: "Bash", image_url: "http://www.unixstickers.com/image/cache/data/stickers/binbash/Bash-new.sh-600x600.png" }
]

languages.each { |language| pp Language.find_or_create_by(language) }
