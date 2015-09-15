# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

jared = User.create!(
  username: "Jared",
  password: "jelly",
  timezone: "pst",
)

jared.shows.create!(
  title: 'Rick and Morty',
  image: '',
  channel: "USA",
  pst_playtime: 4.minutes.from_now.in_time_zone("Pacific Time (US & Canada)"),
  est_playtime: 4.minutes.from_now.in_time_zone("Eastern Time (US & Canada)"),
)

jared.shows.create!(
  title: 'Suits',
  image: '',
  channel: "USA",
  pst_playtime: Time.parse("09/08/15 8:00pm PST"),
  est_playtime: Time.parse("09/08/15 8:00pm EST"),
)
