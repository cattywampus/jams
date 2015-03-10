module FIRST
  module JudgeImporter
    def self.import_vms_report(file, event)
      spreadsheet = open_spreadsheet(file)
      header = spreadsheet.row(15)
      (16..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        person = Person.find_or_create_by(email: row["Email"]) do |person|
          person.first_name = row['First Name']
          person.last_name = row['Last Name']
          person.addresses << address_from(row)
          person.company = row['Company']
          person.position = row['Title']
          person.shirt_size = row['Shirt Size'].downcase
        end
        if person.new_record?
          judge = Judge.new
          judge.event = event
          judge.person = person
        else
          judge = Judge.find_or_initialize_by event_id: event.id, person_id: person.id
        end
        judge.status = :confirmed
        judge.role = role_from(row)
        judge.rookie = is_rookie?(row)
        judge.provided_consent = consent_status(row['Consent Status'])
        judge.completed_vims = true
        judge.needs_shirt = true if judge.rookie
        judge.save!
      end
    end
    
    def self.open_spreadsheet(file_or_path)
      if file_or_path.instance_of? String
        file = File.open file_or_path
      else
        file = file_or_path
      end
      
      if file.respond_to?(:original_filename)
        filename = file.original_filename
      else
        filename = file.path
      end
      
      case filename
      when /.csv$/ then Roo::CSV.new(file.path, file_warning: :ignore)
      when /.xls$/ then Roo::Excelx.new(file.path, file_warning: :ignore)
      when /.xlsx$/ then Roo::Excelx.new(file.path, file_warning: :ignore)
      else raise "Unknown file type: #{filename}"
      end
    end
    
    private
    
    def self.address_from(row)
      Address.new street1: row['Address'], city: row['City'], state: row['State/Province']
    end
    
    def self.consent_status(status)
      case status
      when 'Accepted'
        return true
      when 'Incomplete'
        return false
      else
        return nil
      end
    end
    
    def self.is_rookie?(row)
      row['Years of Service'].to_i == 0
    end
    
    def self.role_from(row)
      roles = row['Roles'].split(',').map(&:strip) & ['Judge', 'Judge Assistant', 'Judge Advisor']
      case roles.first
      when 'Judge'
        return :judge
      when 'Judge Assistant'
        return :assistant
      when 'Judge Advisor'
        return :advisor
      end
    end
  end
end
