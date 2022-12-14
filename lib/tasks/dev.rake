namespace :dev do
  desc "Configure the development environment"
  task setup: :environment do
    puts 'Reseting database...'
    %x(rails db:drop db:create db:migrate)

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

    #########################################################################

    puts 'Generating phones...'
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = contact.phones.create!(number:Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end
    puts 'Phones successfuly generated'

    #########################################################################

    puts 'Generating addresses...'
    Contact.all.each do |contact|
      address = Address.create(
        street:Faker::Address.street_address ,
        city:Faker::Address.city ,
        contact: contact
      )
    end
    puts 'Addresses successfuly generated'
  end

end
