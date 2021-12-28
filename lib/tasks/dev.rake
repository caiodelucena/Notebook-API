namespace :dev do
  desc "Configure the development environment"
  task setup: :environment do

    puts "Resetando banco de dados"
    # %x(rails db:drop db:create db:migrate)

    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    50.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts "Cadastrando os telefones"
    Contact.all.each do |contact|
      Random.rand(3).times do |i|
        phone = Phone.create!(number: Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end
    puts "telefones cadastrados"

    puts "Cadastrando endereços"
    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact_id: contact.id
      )
    end
    puts "Endereços cadastrados"
  end
end
