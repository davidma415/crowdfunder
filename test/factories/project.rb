FactoryBot.define do
  factory :project do
    sequence(:title) {|num| "Project #{num}"}
    sequence(:description) {|num| "Description #{num}"}
    goal {3000}
<<<<<<< HEAD
    start_date {Time.now.utc}
=======
    start_date {Time.now.est}
>>>>>>> f441e2f154c7f7db082cb1648127c5ed1520f61a
    end_date {Time.now + 1.month}
    user
  end
end
