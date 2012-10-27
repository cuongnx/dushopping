namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_products
  end
end

def make_products
  99.times do |n|
    title  = Faker::Lorem.words(3).map { |w| w.capitalize! }.join(" ")
    description = Faker::Lorem.sentences(5).join(". ")
    img_url = "rails.png"
    price = rand(10..1000)
    Product.create!(title: title, description: description, img_url: img_url, price: price)
  end
end