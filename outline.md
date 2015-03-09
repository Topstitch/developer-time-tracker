# Controllers:

* login_controller.rb
  * index MAYBE...WHAT ELSE GOES HERE....**************RESTFUL LOGINS????
  * login
  * logout
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
  * def maxed_out_time_budget?*******where do these methods go???
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

login folder

* login.html.erb
* root: dashboard.html.erb: links to developer index and projects index

# Tests:

* controller test for every method**********really feel like creating the databases before I test; also, not doing these one at a time....
* umm, are my models actually doing anything?***************
* unit tests for every method
* integration tests*************how much to separate out vs. one long chain of doing stuff?

  * developer can try to go to dashboard, get redirected, login, create a new developer, and create a new project
  * developer can login, make three time entries, and see them reflected on the project list page


# MVP phases:
Monday
* setup gems(bcrypt)
* Data structures in place
* Basic app running
* TDD!!!!!!


Tuesday

* Up on Heroku
* Math
* Login

Wednesday

* Fix any disasters
* Styling
