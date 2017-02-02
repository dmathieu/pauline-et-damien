FactoryGirl.define do
  factory :present do
    title "Present"
    description "Please give me this"
    price_cent 5
    photo { File.open("spec/fixtures/image.png") }
  end
end
