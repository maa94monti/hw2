# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!
#code generate by using rails generate model Modelname, and adding column names under migrate,
#and running rails db:migrate

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

#studios
new_studio = Studio.new
new_studio["name"] = "Warner Bros."
new_studio.save

#movies
warner = Studio.find_by({"name" => "Warner Bros."})

batman_begins = Movie.new
batman_begins["title"] = "Batman Begins"
batman_begins["year_released"] = 2005
batman_begins["rated"] = "PG-13"
batman_begins["studio_id"] = warner["id"]
batman_begins.save

dark_knight = Movie.new
dark_knight["title"] = "The Dark Knight"
dark_knight["year_released"] = 2008
dark_knight["rated"] = "PG-13"
dark_knight["studio_id"] = warner["id"]
dark_knight.save

dark_knight_returns = Movie.new
dark_knight_returns["title"] = "The Dark Knight Rises"
dark_knight_returns["year_released"] = 2012
dark_knight_returns["rated"] = "PG-13"
dark_knight_returns["studio_id"] = warner["id"]
dark_knight_returns.save

#info on batman begins - actors

bale = Actor.new
bale["name"] = "Christian Bale"
bale.save

caine = Actor.new
caine["name"] = "Michael Caine"
caine.save

neeson = Actor.new
neeson["name"] = "Liam Neeson"
neeson.save

holmes = Actor.new
holmes["name"] = "Katie Holmes"
holmes.save

oldman = Actor.new
oldman["name"] = "Gary Oldman"
oldman.save

#info on batman begins - roles

batman_begins_id = Movie.find_by({"title" => "Batman Begins"})
bale_id = Actor.find_by({"name" => "Christian Bale"})
caine_id = Actor.find_by({"name" => "Michael Caine"})
neeson_id = Actor.find_by({"name" => "Liam Neeson"})
holmes_id = Actor.find_by({"name" => "Katie Holmes"})
oldman_id = Actor.find_by({"name" => "Gary Oldman"})

role_1 = Role.new
role_1["movie_id"] = batman_begins_id["id"]
role_1["actor_id"] = bale_id["id"]
role_1["character_name"] = "Bruce Wayne"
role_1.save

role_2 = Role.new
role_2["movie_id"] = batman_begins_id["id"]
role_2["actor_id"] = caine_id["id"]
role_2["character_name"] = "Alfred"
role_2.save

role_3 = Role.new
role_3["movie_id"] = batman_begins_id["id"]
role_3["actor_id"] = neeson_id["id"]
role_3["character_name"] = "Ra's Al Ghul"
role_3.save

role_4 = Role.new
role_4["movie_id"] = batman_begins_id["id"]
role_4["actor_id"] = holmes_id["id"]
role_4["character_name"] = "Rachel Dawes"
role_4.save

role_5 = Role.new
role_5["movie_id"] = batman_begins_id["id"]
role_5["actor_id"] = oldman_id["id"]
role_5["character_name"] = "Commissioner Gordon"
role_5.save

#info on batman begins - roles
dark_knight_id = Movie.find_by({"title" => "The Dark Knight"})








# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
