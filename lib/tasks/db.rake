namespace :db do
  desc "Clears the database."
  task :clear => :environment do
    [Comparison, Experiment, Gene, Promoter, RegulatoryElement, Page, TranscriptionFactor].each(&:delete_all)
  end
end
