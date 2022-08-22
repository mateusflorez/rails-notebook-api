namespace :dev do
  desc "Configure the development environment"
  task setup: :environment do

    puts 'Generating contact kinds...'
    kinds = %w(Friend Comercial Acquaintance)
    kinds.each  do |kind|
      Kind.create!(
        description: kind
      )
    end
    puts 'Kinds successfuly generated'

    #########################################################################

    puts 'Generating contacts...'
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts 'Contacts successfuly generated'
  end

end
