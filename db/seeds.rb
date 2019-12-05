MovieUser.destroy_all
Movie.destroy_all
Genre.destroy_all
User.destroy_all


melissa = User.create(name: "Melissa", username: "melissa1993")

action = Genre.create(name: "Action")
comedy = Genre.create(name: "Comedy")
documentary = Genre.create(name: "Documentary")
horror = Genre.create(name: "Horror")

action1 = Movie.create(name: "Raiders of the Lost Ark", genre: action, rating: "PG", year: 1981, cast: "Harrison Ford, Karen Allen", star_rating: 8.4)
action2 = Movie.create(name: "Avengers: Infinity War", genre: action, rating: "PG-13", year: 2018, cast: "Robert Downey Jr., Chris Evans", star_rating: 8.5)
comedy1 = Movie.create(name: "Stepbrothers", genre: comedy, rating: "R", year: 2008, cast: "Will Ferrell, John C. Reilly", star_rating: 6.9)
comedy2 = Movie.create(name: "Get Smart", genre: comedy, rating: "PG-13", year: 2008, cast: "Steve Carell, Anne Hathaway", star_rating: 6.5)
documentary1 = Movie.create(name: "Fyre", genre: documentary, rating: "TV-MA", year: 2019, cast: "Billy McFarland, Jason Bell", star_rating: 7.2)
documentary2 = Movie.create(name: "Minimalism", genre: documentary, rating: "Not Rated", year: 2015, cast: "Dan Harris, Ryan Nicodemus", star_rating: 6.7)
horror1 = Movie.create(name: "The Conjuring", genre: horror, rating: "R", year: 2013, cast: "Patrick Wilson, Vera Farmiga", star_rating: 7.5)
horror2 = Movie.create(name: "Insidious", genre: horror, rating: "PG-13", year: 2010, cast: "Patrick Wilson, Rose Byrne", star_rating: 6.8)

MovieUser.create(user: melissa, movie: action1)
MovieUser.create(user: melissa, movie: action2)
