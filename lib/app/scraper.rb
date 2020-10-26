class Scraper

    def initialize
        @base_url = "https://www.nytimes.com"
    end
      
    def first_scrape
        html = open(@base_url + "/reviews/movies")
        html_parsed_to_elements = Nokogiri::HTML(html)
        review_elements = html_parsed_to_elements.css('.css-1hks1bt')


    review_elements.each do |review_element|
        movie_title = review_element.css("h2")[0].text
        director = review_element.css("li")[2].text
        genre_name = review_element.css("li")[1].text
        review_url = review_element.css("a")[0].attr("href")

        review_html = open(review_url)
        review_html_parsed_to_elements = Nokogiri::HTML(review_html)
        review = review_html_parsed_to_elements.css(".css-1smgwul").text

        binding.pry
    
        # one has many relationship will incorporate a genre having many reviews and a director having many reviews
        genre = Genre.search_or_make_by_name(genre_name)
        Review.new(movie_title, director, genre, review)
    end
    end

    def second_scrape
        review_html = open(@base_url + review.review_url)
        review_html_parsed_to_elements = Nokogiri::HTML(review_html)
        review = review_html_parsed_to_elements.css(".css-1smgwul").text
    end


    # binding.pry

end 


# puts "====================="
        # puts "Movie Title: #{movie_title}"
        # puts "Director: #{director}"
        # puts "Movie Genre: #{genre}"
        # puts ""
        # puts "Review: #{review}"
        # puts ""