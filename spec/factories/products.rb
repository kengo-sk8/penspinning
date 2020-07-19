FactoryBot.define do
  factory :product do
    id                {1}
    title             {"tadashi"}
    text              {"落ちろよおおおおおおおおおおお"}
    image             { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    category_id       {10}
    pen_history_id    {3}
  end
end


