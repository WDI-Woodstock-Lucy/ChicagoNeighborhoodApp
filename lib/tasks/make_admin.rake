#require 'app/models/user'

namespace :make_admin do
  desc "Makes a new admin user"
  task admin1: :environment do
    user = User.create({
      email: "admin@admin.com",
      password: "1234567890abcdefg",
      is_admin: true
      })
    user.save!

    james = User.create({
      email: "jamespc167@gmail.com",
      password: "gachicago",
      is_admin: true
      })
    user.save!

    julia = User.create({
      email: "juliamchrusciel@gmail.com",
      password: "gachicago",
      is_admin: true
      })
    user.save!

    jake = User.create({
      email: "jlass6688@gmail.com",
      password: "gachicago",
      is_admin: true
      })
    user.save!
  end
end
