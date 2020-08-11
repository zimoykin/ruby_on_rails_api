Create API

1 - create api:
rails new my_api --api

2 -  Create models
rails generate model City title:string people:integer
rails generate model People name:string age:integer city:references

3 - Create controllers
rails generate controller Cities
rails generate controller People

4 - Create DB
rails db:migrate

5 - Set links city and People
add this to model city "has_many :people, dependent: :destroy" 

99 - Start server
rails server
