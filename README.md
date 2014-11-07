## Objectives

For this challenge, you'll be adding some new functionality to a very basic Sinatra+ActiveRecord application. The application in its current form includes:

- a `User` model (along with sign-in and sign-up functionality)
- a `Destination` model (representing a destination that a user might travel to)

Your task is to add the notion of "trips" to the application. A user can have many destinations, and a destination can belong to many users. A "trip" is an association between `User` and `Destination`, and has the following additional *required* attributes:

- duration of the trip (in days)
- a flag tracking whether or not the user has completed the trip or if it is planned for the future

You'll need to provide an interface in the application for users to select the destinations that they would like to visit. How you choose to provide this interface is up to you, but a user should only be able to edit her own trips, not the trips of other users.

Also, the home page of your application should show, for **all users**:
* their destinations
* how long she has spent at the given destination
* whether or not this trip has happened or is still being planned.

For example:

<table>
  <tr>
    <th>Name</th><th>Destination</th><th>Duration of Trip</th><th>Completed?</th>
  </tr>
  <tr class="new-user">
    <td>Marie Curie</td><td>Rio de Janeiro (urban)</td><td>6 days</td><td>yes</td>
  </tr>
  <tr>
    <td></td><td>Berlin (urban)</td><td>10 days</td><td>no</td>
  </tr>
  <tr class="new-user">
    <td>Max Born</td><td>Great Barrier Reef (rural)</td><td>5 days</td><td>no</td>
  </tr>
  <tr>
    <td></td><td>Hong Kong (urban)</td><td>3 days</td><td>no</td>
  </tr>
</table>

## Important
**Please run `rake db:drop` before you begin to flush any old databases**  
**Do not add additional functionality. Get the requirements completed, then move on to the next challenge.**

## Useful Notes / Tidbits

- What's the [right kind of association](http://guides.rubyonrails.org/association_basics.html#the-has_many-through-association) between `User` and `Destination`?
- Validations on boolean fields [can be tricky](http://stackoverflow.com/questions/10506575/rails-database-defaults-and-model-validation-for-boolean-fields).
- Before implementing a manual way to add new trips for a user, you might try adding some through your `seeds.rb` file.
