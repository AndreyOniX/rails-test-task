class CreateAdminService
  def call
    User.find_or_create_by!(login: Rails.application.secrets.admin_login) do |user|
      user.name = Rails.application.secrets.admin_name
      user.password = Rails.application.secrets.admin_password
      user.password_confirmation = Rails.application.secrets.admin_password
    end
  end
end
