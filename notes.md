

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
    - Constructor Functions
        - This is analogous to classes in Ruby.
    - Javascript Model Objects
