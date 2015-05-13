class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  validates_presence_of :password, on: :create
  validates :password, length: {in: 6..20}
  validates :password, confirmation: true

  validates :email, confirmation: true

end


# <%= f.password_field :password %>
# <%= f.password_field :password_confirmation %>
# <%= f.text_field :email %>
# <%= f.text_field :email_confirmation %>
