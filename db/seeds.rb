# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin

# Build FIRST Programs
puts 'FIRST PROGRAMS'
programs = [
  {
    name: "FIRST Robotics Competition",
    abbr: "FRC",
    icon: "app/assets/images/FIRSTRobotics_IconVert_RGB.png",
    logo: "app/assets/images/FIRSTRobotics_iconHorz_RGB.png"
  },
  {
    name: "FIRST Tech Challenge",
    abbr: "FTC",
    icon: "app/assets/images/FIRSTTech_IconVert_RGB.png",
    logo: "app/assets/images/FIRSTTech_iconHorz_RGB.png"
  },
  {
    name: "FIRST Lego League",
    abbr: "FLL",
    icon: "app/assets/images/FIRSTLego_IconVert_RGB.png",
    logo: "app/assets/images/FIRSTLego_iconHorz_RGB.png"
  },
  {
    name: "FIRST Lego League Jr.",
    abbr: "JrFLL",
    icon: "app/assets/images/FIRSTLegoJR_IconVert_RGB.png",
    logo: "app/assets/images/FIRSTLegoJr_iconHorz_RGB.png"
  }
]
programs.each do |program|
  p = Program.find_or_create_by_abbr(program[:abbr])
  p.name = program[:name]
  p.logo.store!(File.open(File.join(Rails.root, program[:logo])))
  p.icon.store!(File.open(File.join(Rails.root, program[:icon])))
  p.save!
  puts 'program: ' << p.name
end
