namespace :categories do
  desc "Load default categories"
  task set_categories: :environment do
    names = %w[ Administration Work Learn Marketing ]
    puts "Creating default categories"

    ActiveRecord::Base.transaction do
      names.each do |name|
        Category.create!(name: name)
        print "."
      end
    end

    puts "Done."
  end
end
