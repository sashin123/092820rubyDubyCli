class Review 

    @@all = []

    attr_accessor :director, :movie_title, genre, review_url


    def initialize(director, movie_title, genre, review_url)
        @director = director
        @movie_title
        @genre = genre
        @review_url = review_url
        @@all << self
    end

    def self.all
        @@all
    end

    def print_out_review_director_and_title
        puts "#{@movie_title} by #{@director}"
    end

    def self.print_all_reviews__that_is_chosen
        @@all.each_with_index do |review, index|
            puts "Review #{index + 1}. == == == == == == =="
            review.print_out_review_director_and_title
            puts ""
            sleep(1)
        end
    end

    def print_out_review__
        check_for_review__
        puts "== === == === =="
        print_out_review_director_and_title
        puts "Genre: #{genre.name}"
        puts ""
        puts @review
    end

    def check_for_review__
        if @review === nil
            Scraper.new.second_scrape(self)
        end
    end


end 
