

Must render at least one index page (index resource - 'list of things') via JavaScript and an Active Model Serialization JSON Backend.
  - Can we render all cars on the initial page (with a cool picture), then user can select cars?
    - User can click 'Book Now' and 'Show Details' buttons right on the initial page.

  Need to:
    - Need to look at Active Model Serialization again.
    - What endpoints should I establish as far as car data?

Must render at least one show page (show resource - 'one specific thing') via JavaScript and an Active Model Serialization JSON Backend.
  Borrowing from the previous blog domain example, you might allow a user to sift through the posts by clicking a 'Next' button on the posts show page, with the next post being fetched via AJAX and rendered through JavaScript.
    - The 'Show Details' would show the car's details using AJAX on the same page.

Your Rails application must dynamically render on the page at least one 'has-many' relationship through JSON using JavaScript.
  In the previous blog domain example, if each of the posts has many comments, you could render those comments as well on that post's show page.

    - So currently, user has many cars and cars have many bookings.
    - This would show the user's many bookings.

--- The below seems like specifications about the above ---

Must use your Rails application and JavaScript to render a form for creating a resource that submits dynamically.
    - Creating a booking?

    Need to understand:
      - serialization, submitting via AJAX POST request.

    In the blog domain example, a user might be able to add a comment to a post, and the comment would be serialized, and submitted via an AJAX POST request, with the response being the new object in JSON and then appending that new comment to the DOM using JavaScript (ES6 Template Literals can help out a lot with this).


Must translate the JSON responses into JavaScript Model Objects using either ES6 class or constructor syntax. The Model Objects must have at least one method on the prototype. Formatters work really well for this.

  Borrowing from the blog domain example, instead of plainly taking the JSON response of the newly created comment and appending it to the DOM, you would create a Comment prototype object and add a function to that prototype to perhaps concatenate (format) the comments authors first and last name. You would then use the object to append the comment information to the DOM.

Other:
  Can't unfortunately find an API that doles out car specs in the format I want. If I do find one that is a) free and b) available to use, then I can always add it in later.

-----
Official JS requirements:
  - Must have a Rails Backend and new requirements implemented through JavaScript.
      This is essentially done. The rails project was built earlier.

  - Makes use of ES6 features as much as possible(e.g Arrow functions, Let & Const, Constructor Functions)
      What are constructor functions??

  Must translate the JSON responses into Javascript Model Objects using either ES6 class or constructor syntax.
      What are JSON responses - assuming this has to do with the Active Model Serialization
      What are Javascript Model Objects?

  Must render at least one index page (index resource - 'list of things') via JavaScript and an Active Model Serialization JSON Backend.
      See above.

  Must render at least one show page (show resource - 'one specific thing') via JavaScript and an Active Model Serialization JSON Backend.
      See above.

  Your Rails application must reveal at least one `has-many` relationship through JSON that is then rendered to the page.
      See above.

  Must use your Rails application to render a form for creating a resource that is submitted dynamically through JavaScript.
  At least one of the JS Model Objects must have a method on the prototype.
      See above.

  Things I've got kind of a good idea about
    - HTML.
    - The id/class attributes for a particular HTML object.
    - CSS and how to attach styles to different HTML objects.
    - Using script to call JS on different HTML objects
    - Using JQuery in JS files to more efficiently select Javascript objects.
    - JS
      - functions, the basics of them.
    - Gray areas in my brain

  Things to review:

    - Serialization
        - Helps convert data to JSON, essentially. Will have to build this into the backend basically.
          Add this in a route where data is procured to get the object data in JSON format to the front-end.
        - So what are my current data end points in my application?
            - cars, which have basic car attributes
            - bookings, which have a start date and end date
            - users, which really have username and password.

    - Constructor Functions
        - This is analogous to classes in Ruby.
        - Don't know how this comes into play in the app yet.


    - Javascript Model Objects
        - Aren't these just regular objects?
        - Don't know how this comes into play in the app yet.

    - Handlebars,
        - When do I use them? This would be for forms/templates. Would it be helpful for AJAX front-end stuff?

Current To-Do list

  The way I'm having success now is by being able to figure out what I want my current program to do and then finding the analogy of said process in the lesson.

  1. Starting with the backend, I want to serialize car and booking data into JSON export. (E)
      - Run serialize for car and booking. [DONE]

  2. In DIY JSON Serializer, there appear to be analogous logic to consume and build JSON asynchronously (ie. via AJAX).
      - Tried adding has_many relationship between car and booking so that the car show's up in the booking JSON object, but didn't work. Though this isn't a priority now.
      - The main goal is to show the index of cars after the user logs in.
        - Change the current format of users/show page after login?
          - Going down this road.
          - Just show a car index under the current users/show page.[DONE]
          - New Thought:
            - Make the main page a revolving carousel of all the cars, using the 'Next' and 'Back' buttons on the same page.
              - We need a car show page that will have to be summoned with each click of the 'Next' or 'Back' button.
              - Use AJAX to make this happen!
              - The relevant example is in ActiveModelSerializer Lab.

            -

      - Then each car will have a 'Book Now' and 'Car Details' buttons below a picture that they can do on the same page.

  3. Add functions for front-end (need to explore this more.

  4.
