FactoryBot.define do
  factory :song do
    title { 'About Me' }
    length { 100000 }
    author { association(:person) }
  end
end

