class Tt0413 < ApplicationRecord
  # HACK - bad practice
  self.table_name = 'tt-0413'

  default_scope -> { order(:created_at) }

  validates :first_name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :email, presence: true, email: true
  validates :phone, presence: true, length: { minimum: 3, maximum: 100 }
  validates :company, presence: true, length: { minimum: 2, maximum: 100 }
  validates :job, presence: true, length: { minimum: 2, maximum: 100 }
  validates :country, presence: true, length: { minimum: 2, maximum: 100 }

  def self.to_csv
    attributes = column_names
    options = {headers: true}
    CSV.generate(options) do |csv|
      csv << attributes
      all.each do |item|
        csv << attributes.map{ |attr| item.send(attr) }
      end
    end
  end

end
