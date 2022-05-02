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
Movie.destroy_all
Actor.destroy_all
Role.destroy_all
Studio.destroy_all

# Generate models and tables, according to the domain model.
# TODO!
# - generate model and table for movies

# 1. in terminal, generated a model and table for Movie
# rails generate model Movie

# 2. opened newly generated files
# - app/models/movie.rb
# - db/migrate/*_create_movies.rb

# 3. in the db/migrate file, added relevant columns matching our domain model
# see code in db/migrate/*_create_movies.rb

# 4. in terminal, executed the migration file
# rails db:migrate

# 5. checked the schema to confirm the change
# - db/schema.rb

# - generate model and table for actors

# 1. in terminal, generated a model and table for Actor
# rails generate model Actor

# 2. opened newly generated files
# - app/models/actor.rb
# - db/migrate/*_create_actors.rb

# 3. in the db/migrate file, added relevant columns matching our domain model
# see code in db/migrate/*_create_actors.rb

# 4. in terminal, executed the migration file
# rails db:migrate

# 5. checked the schema to confirm the change
# - db/schema.rb

# - generate model and table for roles

# 1. in terminal, generated a model and table for Role
# rails generate model Role

# 2. opened newly generated files
# - app/models/role.rb
# - db/migrate/*_create_roles.rb

# 3. in the db/migrate file, added relevant columns matching our domain model
# see code in db/migrate/*_create_roles.rb

# 4. in terminal, executed the migration file
# rails db:migrate

# 5. checked the schema to confirm the change
# - db/schema.rb

# - generate model and table for studios

# 1. in terminal, generated a model and table for Studio
# rails generate model Studio

# 2. opened newly generated files
# - app/models/studio.rb
# - db/migrate/*_create_studios.rb

# 3. in the db/migrate file, added relevant columns matching our domain model
# see code in db/migrate/*_create_studios.rb

# 4. in terminal, executed the migration file

# rails db:migrate

# 5. checked the schema to confirm the change
# - db/schema.rb

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

studio = Studio.new
studio["name"] = "Warner Brothers"
studio.save

BB = Movie.new
BB["title"] = "Batman Begins"
BB["year_released"] = 2005
BB["rated"] = "PG-13"
BB["studio_id"] = studio["id"]
BB.save

TDK = Movie.new
TDK["title"] = "The Dark Knight"
TDK["year_released"] = 2008
TDK["rated"] = "PG-13"
TDK["studio_id"] = studio["id"]
TDK.save

TDKR = Movie.new
TDKR["title"] = "The Dark Knight Rises"
TDKR["year_released"] = 2012
TDKR["rated"] = "PG-13"
TDKR["studio_id"] = studio["id"]
TDKR.save

CB = Actor.new
CB["name"] = "Christian Bale"
CB.save

MC = Actor.new
MC["name"] = "Michael Caine"
MC.save

LN = Actor.new
LN["name"] = "Liam Neeson"
LN.save

KH = Actor.new
KH["name"] = "Katie Holmes"
KH.save

GO = Actor.new
GO["name"] = "Gary Oldman"
GO.save

HL = Actor.new
HL["name"] = "Heath Ledger"
HL.save

AE = Actor.new
AE["name"] = "Aaron Eckhart"
AE.save

MG = Actor.new
MG["name"] = "Maggie Gyllenhaal"
MG.save

TH = Actor.new
TH["name"] = "Tom Hardy"
TH.save

JGL = Actor.new
JGL["name"] = "Joseph Gordon-Levitt"
JGL.save

AH = Actor.new
AH["name"] = "Anne Hathaway"
AH.save

role = Role.new
role["movie_id"] = BB["id"]
role["actor_id"] = CB["id"]
role["character_name"] = "Bruce Wayne"
role.save

role = Role.new
role["movie_id"] = BB["id"]
role["actor_id"] = MC["id"]
role["character_name"] = "Alfred"
role.save

role = Role.new
role["movie_id"] = BB["id"]
role["actor_id"] = LN["id"]
role["character_name"] = "Ra's Al Ghul"
role.save

role = Role.new
role["movie_id"] = BB["id"]
role["actor_id"] = KH["id"]
role["character_name"] = "Rachel Dawes"
role.save

role = Role.new
role["movie_id"] = BB["id"]
role["actor_id"] = GO["id"]
role["character_name"] = "Commissioner Gordon"
role.save

role = Role.new
role["movie_id"] = TDK["id"]
role["actor_id"] = CB["id"]
role["character_name"] = "Bruce Wayne"
role.save

role = Role.new
role["movie_id"] = TDK["id"]
role["actor_id"] = HL["id"]
role["character_name"] = "Joker"
role.save

role = Role.new
role["movie_id"] = TDK["id"]
role["actor_id"] = AE["id"]
role["character_name"] = "Harvey Dent"
role.save

role = Role.new
role["movie_id"] = TDK["id"]
role["actor_id"] = MC["id"]
role["character_name"] = "Alfred"
role.save

role = Role.new
role["movie_id"] = TDK["id"]
role["actor_id"] = MG["id"]
role["character_name"] = "Rachel Dawes"
role.save

role = Role.new
role["movie_id"] = TDKR["id"]
role["actor_id"] = CB["id"]
role["character_name"] = "Bruce Wayne"
role.save

role = Role.new
role["movie_id"] = TDKR["id"]
role["actor_id"] = GO["id"]
role["character_name"] = "Commissioner Gordon"
role.save

role = Role.new
role["movie_id"] = TDKR["id"]
role["actor_id"] = TH["id"]
role["character_name"] = "Bane"
role.save

role = Role.new
role["movie_id"] = TDKR["id"]
role["actor_id"] = JGL["id"]
role["character_name"] = "John Blake"
role.save

role = Role.new
role["movie_id"] = TDKR["id"]
role["actor_id"] = AH["id"]
role["character_name"] = "Selina Kyle"
role.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!
movies_all = Movie.all

for movie in movies_all
    title = movie["title"]
    year_released = movie["year_released"]
    rated = movie["rated"]
    studio_movie = Studio.find_by({"id" => movie["studio_id"]})
    # puts studio_movie.inspect
    puts"#{movie["title"]} #{movie["year_released"]} #{movie["rated"]} #{studio_movie["name"]}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

roles_all = Role.all

for roles in roles_all
    movie_title = Movie.find_by({"id" => roles["movie_id"]})
    actor_name = Actor.find_by({"id" => roles["actor_id"]})
    # puts movie_title.inspect
    # puts actor_name.inspect
    puts "#{movie_title["title"]} #{actor_name["name"]} #{roles["character_name"]}"
end   
