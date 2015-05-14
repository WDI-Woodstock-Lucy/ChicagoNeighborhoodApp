#require 'app/models/user'

namespace :make_admin do
  desc "Makes a new admin user"
  task admin1: :environment do

    james = User.create({
      email: "jamespc167@gmail.com",
      password: "gachicago",
      is_admin: true
      })

    julia = User.create({
      email: "juchru@gmail.com",
      password: "gachicago",
      is_admin: true
      })

    jake = User.create({
      email: "jlass6688@gmail.com",
      password: "gachicago",
      is_admin: true
      })
  end
end
