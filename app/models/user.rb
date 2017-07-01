class User < ApplicationRecord
  include Clearance::User

  # validates :email, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, uniqueness: true
  validates :country_code, presence: true
  validates :phone, presence: true

  def full_name
    [first_name.capitalize, last_name.capitalize].join(" ")
  end
end
