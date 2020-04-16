class AddFormSubmissionsService
  def call
    rand(3..9).times do
      data = {
          first_name: FFaker::Name.first_name,
          last_name: FFaker::Name.last_name,
          email: FFaker::Internet.email,
          phone: FFaker::PhoneNumber.short_phone_number,
          company: FFaker::Company.name,
          job: FFaker::Job.title,
          country: FFaker::Address.country
      }
      Tt0413.create(data)
    end
    nil
  end
end
