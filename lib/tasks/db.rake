namespace :db do
  desc "Clears the database."
  task :clear => :environment do
    [Comparison, Experiment, Gene, Promoter, RegulatoryElement, Page, TranscriptionFactor].each(&:destroy_all)
  end
end
