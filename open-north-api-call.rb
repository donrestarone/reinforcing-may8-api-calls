require 'httparty'

open_north_response = HTTParty.get('https://represent.opennorth.ca/boundaries/toronto-wards/')
parsed_response = JSON.parse(open_north_response.body)

#p parsed_response.keys

parsed_response["objects"].each do |ward|
	p ward['name']
end





# parsed_response.each do |data|
# 	data['objects'].each do |ward|
# 		p ward
# 	end
# end