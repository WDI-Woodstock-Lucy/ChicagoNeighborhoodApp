#require 'app/models/user'

namespace :make_admin do
  desc "Makes a new admin user"
  task admin1: :environment do
    user = User.create({
      username: "SecretAdmin",
      email: "admin@admin.com",
      password: "1234567890abcdefg",
      is_admin: true
      })
    user.save!
  end
end
