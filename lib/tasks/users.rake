namespace :users do
  task load: :environment do
    PASSWORD = 'pwd12345'

    puts 'Adding users...'
    email_address = 'chris.bartling@gmail.com'
    found = User.find_by_email(email_address)
    unless found
      user = User.new email: email_address,
                      password: PASSWORD,
                      first_name: 'Christopher',
                      last_name: 'Bartling'
      user.save!
      puts "   Added '#{user.email}' with password of '#{PASSWORD}'."
    end
  end
end
