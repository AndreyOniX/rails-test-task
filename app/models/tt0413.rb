class Tt0413 < ApplicationRecord
  # HACK - bad practice
  self.table_name = 'tt-0413'

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :first_name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :email, presence: true, format: { with: EMAIL_REGEX }
  validates :phone, presence: true, length: { minimum: 3, maximum: 100 }
  validates :company, presence: true, length: { minimum: 2, maximum: 100 }
  validates :job, presence: true, length: { minimum: 2, maximum: 100 }
  validates :country, presence: true, length: { minimum: 2, maximum: 100 }

end
