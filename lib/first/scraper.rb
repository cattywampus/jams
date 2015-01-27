require 'mechanize'
require 'open-uri'

module FIRST
  module Scraper
    FIRST_URL = 'https://my.usfirst.org/myarea/index.lasso'
    EVENT_LIST_URL = 'https://my.usfirst.org/myarea/index.lasso?event_type=%{program}&year=%{year}'
    EVENT_DETAILS_QUERY = '?page=event_details&eid=%{id}'
  
    def self.frc_events(year)
      url = EVENT_LIST_URL % { program: 'FRC', year: year }
      agent = Mechanize.new
      list_page = agent.get(url)
    
      event_nodes = list_page.search("//table/tr[@bgcolor='#FFFFFF']")
      events = event_nodes.each_with_object({}) do |node, memo|      
        first_id = node.search('a[@href]').first["href"].match(/&eid=(\d+)/)[1].to_i
        memo.merge! event_details(list_page, first_id)
      end
    end
  
    def self.event(id, year)
      url = EVENT_LIST_URL % { program: 'FRC', year: year }
      agent = Mechanize.new
      list_page = agent.get(url)
      
      event_details(list_page, id)
    end
    
    def self.event_details(page, id)
      query_string = EVENT_DETAILS_QUERY % { id: id }
      details_page = page.link_with(href: query_string).click
      detail_table = details_page.search(".//table[@bgcolor='#a7a9ac']")
      
      name = detail_table.xpath('.//tr[2]/td[2]').text.strip
      (start_date, end_date) = parse_dates(extract_detail(detail_table, 'When').strip)
      where = extract_detail(detail_table, 'Where').lines.map(&:strip).reject(&:empty?)
      venue = where.first.strip
      address = where[1..-1].join "\n"
      
      {
        id => {
          name: name,
          event_type: extract_detail(detail_table, 'Event Subtype').downcase.tr(' ', '_'),
          begins_on: start_date,
          ends_on: end_date,
          venue: venue,
          address: address,
          registered_teams: extract_detail(detail_table, 'Registered Teams').to_i,
          open_capacity: extract_detail(detail_table, 'Open Capacity').to_i
        }
      }
      
    end
    
    def self.extract_detail(node, key)
      node.xpath("tr[td//text()[contains(.,'#{key}')]]").children.map { 
        |child| child.text.strip 
      }.reject(&:empty?)[1]
    end
  
    def self.parse_dates(range)
      (starts, _, ends) = range.partition(' - ')
      year = ends.split('-').last
      format = '%d-%b-%Y'
      [
        Date.strptime("#{starts}-#{year}", format), 
        Date.strptime(ends, format)
      ]
    end

    def self.strip_whitespace(string)
      string.gsub("\r", '').gsub("\t", '').strip
    end
  end
end