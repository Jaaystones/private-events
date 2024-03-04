![homepage](https://github.com/Jaaystones/private-events/assets/111044396/7674c5e4-bb20-4240-8d68-1d83a757c214)


This is the Events Management App named private-events where a user can create and attends events

# User Authentication
```
bundle add devise
rails g devise:install
rails g devise User(model-name)
rails db:migrate
```

# Events Model
```
rails g model Event place:string time:string
rails db:migrate
```

# Adding Association between User and Event

A user can create as many events as possible. An event can be created by only one user. Both these model have one-manny relation

Foreign Key -> These play a vey vital role make assocation between the models. it makes use of the respective Id's to relate with multiple tables.
```rails g migration AddUserIdToEvents creator_id:integer```

```belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'```
Note : If your using the console every single time while creating the event you need to add the foreign key also

```has_many :through Association```

We call this relation as many-to-many relations to keep the track of both the user as well events model we introduce a new model/table/db so the name through

# Attendance model
```rails g migration Attendance references:event referecnes:attendee```

Add the association in User & Events Model Accordingly
user.rb For this I want to take a moment to explain clearly this is where I get stucked let's break it down
```
has_many :events foreign_key: 'creator_id'
You can be an attendee of as many events as you can
has_many: attended_events through: :event_attendees source: : event
has_many :event_attendee
```
An event has only one creator
```
belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
has_many: attendees, thought: :event_attendees, source: :attendess
has_many: event_attendees
```
# Collaborations
Collaborations are accepted!
A good client side design would be perfect
