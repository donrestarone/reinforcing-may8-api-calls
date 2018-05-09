require 'httparty'



open_north_ward_response = HTTParty.get('https://represent.opennorth.ca/boundaries/toronto-wards/')
parsed_response = JSON.parse(open_north_ward_response.body)

# p parsed_response.keys

# 	parsed_response["objects"].each do |ward|
# 		p ward['name']
# 	end

open_north_representatives_response = HTTParty.get('https://represent.opennorth.ca/representatives')
parsed_rep_response = JSON.parse(open_north_representatives_response.body)

p parsed_rep_response.keys
	

	parsed_rep_response['objects'].each do |representative|
		representative['offices'].each do |contact_detail|
			if fax = contact_detail['fax']
				p "#{representative['name']} is the #{representative['elected_office']} of #{representative['district_name']} and their fax contact is #{fax}"
			elsif postal = contact_detail['tel']
				p "#{representative['name']} is the #{representative['elected_office']} of #{representative['district_name']} and their personal contact is #{postal}"
			end
		end	
	end


