# Controllers:

* login_controller.rb
  * new
  * create
  * destroy
* developer_controller.rb
  * index
  * new
  * create
  * show
  * edit
  * update
  * destroy
* project_controller.rb
  * index
  * new
  * create
  * show
  * edit
  * update
  * destroy
* time_entry_controller.rb
  * index
  * new
  * create
  * show
  * edit
  * update
  * destroy

# Models:

* developers.rb
  * def overtime?
* projects.rb
  * def total_hours
  * def maxed_out_time_budget?
* time_entries.rb

# Views:

developers folder

* index.html.erb
* new.html.erb
* edit.html.erb
* _form.html.erb

projects folder

* index.html.erb
* new.html.erb
* edit.html.erb
* _form.html.erb

time entries folder

* new.html.erb
* edit.html.erb
* _form.html.erb

login folder

* login.html.erb
* new.html.erb
* root: dashboard.html.erb: links to developer index and projects index
* _form.html.erb

# Tests:


* controller test for every method
* unit tests for every method, also test for validations
* integration tests*************how much to separate out vs. one long chain of doing stuff?

  * developer can try to go to dashboard, get redirected, login, create a new developer, logs out, and then the new developer can log in
  * developer logs in, and creates a new project, and then adds a time entry to that project
  * developer can login, make three time entries, and goes on overtime.  Sees them reflected on the project list page



# MVP phases:
Monday
-set up gems(bcrypt)
-Data structures in place
-TDD!!!!!! (controller tests)
-Basic app running



Tuesday

* Up on Heroku
* Math
* Login
* Validations
* Decide where time entries logically live, possibly with hidden field for dev. id....where do you even see them to edit them?
* Unit and Integration Tests



Wednesday

* Fix any disasters
* Styling
