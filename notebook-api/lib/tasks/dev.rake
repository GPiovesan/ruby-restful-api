namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do

    puts "Cadastrando os tipos de contatos..."
    
    kinds = %w(Amigo Comercial Conhecido)
    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    puts "Tipos de contatos cadastrados com sucesso!"

    #Deve cadastrar os kinds antes dos contatos#

    puts "Cadastrando os contatos..."
    100.times do |i|
      Contact.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 2.days.ago, to: Date.today),
        kind: Kind.all.sample
      )
    end
    puts "Contatos cadastrados com sucesso!"
  end
end
