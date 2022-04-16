FactoryBot.define do
  factory :session do
  end

  factory :user do
    name { Faker::Name.name }
    email_address { Faker::Internet.free_email }
  end

  factory :library do
    name { Faker::Lorem.word }
    notes { Faker::Lorem.paragraph }
    user
    factory :library_with_drills do
      transient do
        drills_count { 5 }
      end
      after(:create) do |library, e|
        create_list(:drill, e.libraries_count, library: library)
      end
    end
    factory :library_with_plays do
      transient do
        plays_count { 5 }
      end
      after(:create) do |library, e|
        create_list(:play, e.plays_count, library: library)
      end
    end
    factory :library_with_plays_and_drills do
      transient do
        count { 5 }
      end
      after(:create) do |library, e|
        create_list(:play, e.count, library: library)
        create_list(:drill, e.count, library: library)
      end
    end
  end

  factory :drill do
    name { Faker::Team.name }
    body { Faker::Lorem.paragraph }
    duration_minutes { [5, 10, 20, 30, 45, 60, 90].sample }
    number_of_players { rand(5) }
    variations { Faker::Lorem.sentences }
    keys { Faker::Lorem.sentences }
    goals { Faker::Lorem.sentences }
    library
  end

  factory :play do
    name { Faker::Team.name }
    notes { Faker::Lorem.paragraph }
    court { ["full", "half"].sample }
    library
  end

  factory :player do
    name { Faker::Name.name }
    squad
  end

  factory :practice do
    practice_at { rand(7).weeks.from_now }
    review { Faker::Lorem.paragraph }
    squad
    trait :past do
      practice_at { rand(7).weeks.ago }
    end
    factory :practice_with_drills do
      transient do
        drills_count { 5 }
      end
      after(:create) do |practice, e|
        create_list(:practice_drills, 5, practice: practice)
      end
    end
  end

  factory :practice_drill do
    practice
    drill
    rating { rand(5) }
    run_at { practice.practice_at }
    variation { drill.variations.sample }
  end

  factory :squad do
    name { %w( u8 u10 u12 u14 u16 u18 u23 ).sample }
    active { [true, false].sample }
    competition { Faker::Lorem.word }
    season { [%w( summer autumn winter spring ).sample, (-3 + rand(6)).years.from_now.strftime("%Y")].join(" ") }
    user
    factory :squad_with_libraries do
      transient do
        libraries_count { 5 }
      end
      after(:create) do |squad, e|
        create_list(:library, e.libraries_count, squad: squad)
      end
    end
  end

  factory :team do
    name { Faker::Team.name }
    squad
  end
end
