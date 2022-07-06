FactoryBot.define do
	factory :user do
		name { Faker::Company.name }
		sequence(:email) { |n| "#{n}#{Faker::Internet.email}" }
		password { 'Foobar123' }
	end
end
