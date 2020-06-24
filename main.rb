require 'active_support/all'
require 'active_record'
require 'pp'

Time.zone_default = Time.find_zone! 'Tokyo'
ActiveRecord::Base.default_timezone = :local

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./myapp.db"
)

class User < ActiveRecord::Base
end


# insert
User.delete_all
User.create(name: "tanaka", age: 19)
User.create(name: "takahasi", age: 25)
User.create(name: "hayashi", age: 31)
User.create(name: "mizutani", age: 28)
User.create(name: "otsuka", age: 35)

# where

# pp User.select("id, name, age").where(age: 20..29)
# pp User.select("id, name, age").where(age: [19, 31])
# pp User.select("id, name, age").where("age >= 20 and age < 30")


# OR

# pp User.select("id, name, age").where("age <= 20 or age >= 30")
# pp User.select("id, name, age").where("age <= 20").or(User.select("id, name, age").where("age >= 30"))
# pp User.where("age <= 20").or(User.where("age >= 30")).select("id, name, age")


#NOT

pp User.select("id, name, age").where.not(id: 3)

