def certification(target_release_date,movie_id)
    require 'uri'
    require 'net/http'
    require 'json'

    url = URI("https://api.themoviedb.org/3/movie/#{movie_id}/release_dates")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'
    request["Authorization"] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNzdhYTdkYzYzZDVmZmJhZTk0NTYxYjVkZTM4N2U4MSIsInN1YiI6IjY0ZWUyYmVmZTBjYTdmMDEyZWIxNWI2MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CXT0Ur_v4PJuWh-5gsGYex6Y-sxJ8qZXMaLuHZKZVag'

    response = http.request(request)

    if response.is_a?(Net::HTTPOK)
        response_data = response.body
    
        # Parse the JSON response
        parsed_response = JSON.parse(response_data)
    
        # target_release_date = "1989-10-13T00:00:00.000Z"  # Replace with the release date you're interested in

    # Iterate through the results
    parsed_response['results'].each do |result|
        release_dates = result['release_dates']

        # Find the release date entry with the target date
        target_entry = release_dates.find { |entry| entry['release_date'] == target_release_date }

        if target_entry
        certification = target_entry['certification']
        iso_3166_1 = result['iso_3166_1']

        # Print the certification linked to the target release date
        puts "ISO 3166-1: #{iso_3166_1}, Release Date: #{target_release_date}, Certification: #{certification}"
        end
    end
    else
    puts "Error: #{response.code} - #{response.message}"
    end

end