#!/usr/bin/ruby

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    hind.rb                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ksonu <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/09 15:41:52 by ksonu             #+#    #+#              #
#    Updated: 2018/03/09 15:41:52 by ksonu            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

require "oauth2"

UID = "f4a8b5ca5d64741df95233ccebb248242061ec4c80a0668b37c7f65654884390"
SECRET = "6c5ae16836811c81d35eddd7851660a4255c28e7a041cb99f623021ce18bced1"

$client = OAuth2::Client.new(UID, SECRET, site: "https://api.intra.42.fr")

$token = $client.client_credentials.get_token

def ft_find(login)
	begin
		response = $token.get("/v2/users/#{login}/locations")
		while response.status != 200
			puts ("server are down 🤪 ")
			sleep(5)
			if responses.status == 200
				break
			end
		end
		if !response.parsed[0]["end_at"]
			puts (login.ljust(10, '😁') + ": " + response.parsed[0]["host"])
		else
			puts (login.ljust(10, '🤔') + ": not here rn")
			puts ("(last login -> " + response.parsed[0]["host"] + ")")
		end
	rescue
		puts (login.ljust(10) + ": who that 🧐")
	end
end

if ARGV[0]
	if File.file?(ARGV[0]) and File.extname(ARGV[0]) == ".txt"
		file = File.open(ARGV[0], "r").each_line do |line|
			line == "\n" ? next : login = line.strip
			ft_find(login)
		end
		file.close
	else
		puts "invalid file"
	end
else
	puts "✨ Please write : ruby " + $PROGRAM_NAME + " [.txt]✨"
end
