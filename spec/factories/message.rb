FactoryGirl.define do

  factory :message do
    body                  "test"
    image                  Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/image/neko.jpg'))
    user_id               "1"
    group_id              "1"
  end
end
