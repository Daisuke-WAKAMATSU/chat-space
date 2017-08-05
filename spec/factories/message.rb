FactoryGirl.define do

  factory :message do
    body                  { Faker::Name.name }
    image                 { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/image/neko.jpg')) }
    user
    group
  end
end
