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

YEEE HA:COMPLETE


Tuesday

-Up on Heroku
* Math
-Login
-Validations
-Decide where time entries logically live

* hidden field for dev id on time entry
BLEHHH, SEVERAL UNDONE


Wednesday

-ASK: FRANKENSTEIN LOGIN METHOD...could have put 0 or 1 or any integer in there by the logout button, it just needs something
-FIX LOGIN TESTS, FIX TIME ENTRY TESTS
-Math
-hidden field for dev id on time entry
-Unit Tests
* Integration Tests
-Fix any disasters
* Styling
* CHECK for CLEAN and HAPPY code...i mean, kind of

YEEE BLEHH  almost there!

Thursday
-Is get root path necessary after redirected to??? do the follow_redirect ! or no?
-Break up giant test or not??? NOT

-Developers can create/edit/delete time entries for themselves, not for other developers.
-No one can delete a developer once that developer has made a time entry.
-No one can delete a project once that project has a time entry on it.

Errors seem to be clunky code, but they work...

-Integration test 2
* & 3
-TEST NEW 3 THINGS not sure if it's the greatest syntax for the can't deletes, but they seem to work
* styling
