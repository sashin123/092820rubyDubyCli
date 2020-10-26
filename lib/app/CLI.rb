class CLI


    def run
        puts "Hello and Welcome to New York Times App"
        sleep(1)
        puts "App is loading, just give it a sec... :)"
        Scraper.new.first_scrape
        puts "Finished!"
        sleep(1)
        puts "Now, what are you looking to view today?"
        sleep(1)
        puts "1. All Reviewa"
        puts "2. Reviews by Genre"
        puts " "
        puts "Enter 1 or 2 to make your selection please."
        user_input == gets.chomp
        if user_input == "1"
            Review.print_all_reviews__that_is_chosen
            puts "Please enter a number between 1-10 to view that specific review."
            review_select = gets.chomp
            selected_to_index = review_select.to_i - 1
            Review.all[selected_to_index].print_out_review__
        elsif user_input == "2"
            Genre.search_or_make_by_name
            puts "Please select a number between 1-10 to view that specific genre."
            genre_select = gets.chomp
            search_or_make_by_name = genre_select.to_i - 1
            Genre.all[search_or_make_by_name].resulted_genre
        end
    end
end







