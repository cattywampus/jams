namespace :first do
  desc 'Creates or updates events from data downloaded from FIRST'
  task :events, [:year] => :environment do |t, args|
    game = Game.find_by season: args.year
    
    unless game
      puts "Cannot generate events until you create a game for #{args.year}"
      return
    end
    
    events = FIRST::Scraper.frc_events args.year
    events.each do |id, attributes|
      event = Event.find_or_initialize_by first_event_id: id do |event|
        event.attributes = attributes
        event.game ||= game
        event.save!
      end
    end
  end
end