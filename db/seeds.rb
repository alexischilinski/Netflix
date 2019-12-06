MovieUser.destroy_all
Movie.destroy_all
Genre.destroy_all
User.destroy_all


#melissa = User.create(name: "Melissa", username: "melissa1993")

action = Genre.create(name: "Action")
comedy = Genre.create(name: "Comedy")
documentary = Genre.create(name: "Documentary")
horror = Genre.create(name: "Horror")

action1 = Movie.create(name: "Raiders of the Lost Ark", genre: action, rating: "PG", year: 1981, cast: "Harrison Ford, Karen Allen", star_rating: 8.4)
action2 = Movie.create(name: "Avengers: Infinity War", genre: action, rating: "PG-13", year: 2018, cast: "Robert Downey Jr., Chris Evans", star_rating: 8.5)
action3 = Movie.create(name: "The Matrix", genre: action, rating: "R", year: 1999, cast: "Keanu Reeves, Laurence Fishburne", star_rating: 8.7)
action4 = Movie.create(name: "Solo", genre: action, rating: "PG-13", year: 2018, cast: "Alden Ehrenreich, Woody Harrelson", star_rating: 6.9)

comedy1 = Movie.create(name: "Stepbrothers", genre: comedy, rating: "R", year: 2008, cast: "Will Ferrell, John C. Reilly", star_rating: 6.9)
comedy2 = Movie.create(name: "Get Smart", genre: comedy, rating: "PG-13", year: 2008, cast: "Steve Carell, Anne Hathaway", star_rating: 6.5)
comedy3 = Movie.create(name: "John Mulaney: The Comeback Kid", genre: comedy, rating: "TV-MA", year: 2015, cast: "John Mulaney", star_rating: 7.9)
comedy4 = Movie.create(name: "Hot Rod", genre: comedy, rating: "PG-13", year: 2007, cast: "Andy Samberg, Isla Fisher", star_rating: 6.7)

documentary1 = Movie.create(name: "Fyre", genre: documentary, rating: "TV-MA", year: 2019, cast: "Billy McFarland, Jason Bell", star_rating: 7.2)
documentary2 = Movie.create(name: "Minimalism", genre: documentary, rating: "Not Rated", year: 2015, cast: "Dan Harris, Ryan Nicodemus", star_rating: 6.7)
documentary3 = Movie.create(name: "The Pixar Story", genre: documentary, rating: "G", year: 2007, cast: "John Lasseter, Brad Bird", star_rating: 7.8)
documentary4 = Movie.create(name: "Disneynature: Oceans", genre: documentary, rating: "G", year: 2010, cast: "Pierce Brosnan, Jacques Perrin", star_rating: 7.8)

horror1 = Movie.create(name: "The Conjuring", genre: horror, rating: "R", year: 2013, cast: "Patrick Wilson, Vera Farmiga", star_rating: 7.5)
horror2 = Movie.create(name: "Insidious", genre: horror, rating: "PG-13", year: 2010, cast: "Patrick Wilson, Rose Byrne", star_rating: 6.8)
horror3 = Movie.create(name: "Rosemary's Baby", genre: horror, rating: "R", year: 1968, cast: "Mia Farrow, John Cassavetes", star_rating: 8.0)
horror4 = Movie.create(name: "The Witch", genre: horror, rating: "R", year: 2015, cast: "Anya Taylor-Joy, Ralph Ineson", star_rating: 6.8)

# MovieUser.create(user: melissa, movie: action1)
# MovieUser.create(user: melissa, movie: action2)
