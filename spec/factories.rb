FactoryBot.define do
  factory :access_control do
    user { nil }
    access_controlled { nil }
  end

  factory :appearance do
    player { nil }
    match { nil }
  end

  factory :team do
    name { Faker::Team.name.titlecase }
    squad
    factory :team_with_players do
      after(:create) do |team, e|
        create_list(:player, 7, team: team)
      end
    end
  end

  factory :match do
    played_at { rand(12).weeks.ago }
    opposition { Faker::Team.name.titlecase }
    home_team { [true, false].sample }
    team
  end

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
    name { [Faker::Team.state, rand(99)].join(" ") }
    body { Faker::Lorem.paragraph }
    duration_minutes { [5, 10, 20, 30, 45, 60, 90].sample }
    number_of_players { rand(5) }
    variations { Faker::Lorem.sentences }
    keys { Faker::Lorem.sentences }
    goals { Faker::Lorem.sentences }
    library
  end

  factory :play do
    name { [Faker::Science.element, rand(99)].join(" ") }
    notes { Faker::Lorem.paragraph }
    court { ["full", "half"].sample }
    library
  end

  factory :player do
    name { Faker::Name.name }
    team
  end

  factory :practice do
    practice_at { rand(7).weeks.from_now }
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
    name { %w( u8 u10 u12 u14 u16 u18 u23 ).sample.upcase }
    active { [true, false].sample }
    competition { Faker::Lorem.word.titlecase }
    season { [%w( summer autumn winter spring ).sample.titlecase, (-3 + rand(6)).years.from_now.strftime("%Y")].join(" ") }
    user
    factory :squad_with_teams do
      transient do
        teams_count { 5 }
      end
      after(:create) do |squad, e|
        create_list(:team_with_players, 5, squad: squad)
      end
    end
    factory :squad_with_libraries do
      transient do
        libraries_count { 5 }
      end
      after(:create) do |squad, e|
        create_list(:library, e.libraries_count, squad: squad)
      end
    end
  end
end
