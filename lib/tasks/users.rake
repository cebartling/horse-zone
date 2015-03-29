namespace :users do

  task :load => :environment do
    PASSWORD = 'pwd12345'

    puts 'Adding users...'
    email_address = 'chris.bartling@gmail.com'
    found = User.find_by_email_address(email_address)
    unless found
      user = User.new email_address: email_address,
                      password: PASSWORD
      user.save!
      puts "   Added '#{user.email_address}' with password of '#{PASSWORD}'."
    end
  end

end
