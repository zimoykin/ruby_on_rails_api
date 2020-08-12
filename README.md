create RAILS API
=

#1 - create template api:


rails new my_api --api

#2 -  Create models


rails generate model City title:string people:integer
rails generate model People name:string age:integer city:references

#3 - Create controllers

.

rails generate controller Cities
rails generate controller People

#4 - Create DB

.

rails db:migrate

#5 - Set links city and People
.

add this to model city "has_many :people, dependent: :destroy"

#6 - add function "index" in city controllers

.

    def index
      @cities = City.all
      render(json: @cities)
    end

#7 - change address (optional)

.

-> config\puma
comment port and add bind
bind        'tcp://10.0.1.7:3000'

#8 - Create user (use console) and get Token
.
rails c
User.create!(email: 'name@pochta.ru' , password: '111' , password_confirmation: '111')
$ curl -H "Content-Type: application/json" -X POST -d '{"email":"name@pochta.ru","password":"111"}' http://10.0.1.7:3000/authenticate

#99 - Start server
.
rails server
