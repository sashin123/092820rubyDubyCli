class Genre 

    @@all = []

    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def reviews
        Review.all.select {|review| review.genre == self}
    end

    def self.search_or_make_by_name(name)
        resulted_genre = self.all.find {|genre| genre.name == name}
        if resulted_genre
            return resulted_genre
        else
            return self.new(name)
        end
    end

    def self.all
        @@all
    end

end

