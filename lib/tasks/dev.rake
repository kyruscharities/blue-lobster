namespace :dev do
  desc 'Sets the app up for development'
  task :setup => :environment do
    admin = User.find_or_create_by! email: 'admin@foo.com' do |u|
      u.password = 'password'
      u.password_confirmation = 'password'
      u.zip = '12345'
    end

    admin.update! confirmed_at: Time.now
    admin.add_role :admin

    make_skills
    make_job_types
    make_questions
    make_programs

    make_user 'user@foo.com'
    make_user 'user@bar.com'

    p "#{Skill.count} Skills"
    p "#{JobType.count} Job Types"
    p "#{Question.count} Questions"
    p "#{Answer.count} Answers"
    p "#{JobProgram.count} Programs"
    p "#{User.count} Users"
  end

  def make_user(email)
    user = User.find_or_create_by! email: email do |u|
      u.password = 'password'
      u.password_confirmation = 'password'
      u.zip = '12345'
    end
    p "Created user #{user.inspect}"

    user.update! confirmed_at: Time.now
    user.add_role :veteran

    Question.all.shuffle[0..(Question.count - 10)].each do |question|
      question.answer_for! user, score: (1..5).to_a.sample
    end
  end

  def make_questions
    50.times do
      q = Question.find_or_create_by! question: "Would you like a #{Faker::Hacker.noun}?"
      p "Created question: #{q.inspect}"

      (rand(2) + 1).times do
        q.skill_values.find_or_create_by! skill: Skill.all.sample, weight: rand(50) + 1 rescue nil
      end
    end
  end

  def make_skills
    50.times do
      Skill.find_or_create_by! name: Faker::Company.catch_phrase.split.first
    end
  end

  def make_job_types
    50.times do
      JobType.find_or_create_by! name: Faker::Name.title do |job_type|
        job_type.description = Faker::Company.bs
        Skill.all.shuffle[0..4].each do |skill|
          job_type.skills << skill
        end
      end
    end
  end

  def make_programs
    50.times do
      JobProgram.find_or_create_by! name: Faker::Company.name do |p|
        p.description = Faker::Company.bs
        5.times do
          p.job_types << JobType.all.sample
        end
      end
    end
  end
end
