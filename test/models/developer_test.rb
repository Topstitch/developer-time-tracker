require 'test_helper'

class DeveloperTest < ActiveSupport::TestCase

  test "check if developer has name" do
    developer = Developer.new(email: "fred@dev.com", password: "potato")
    assert_not developer.save
  end

  test "check if developer has unique email" do
    developer = Developer.new(name:"Sarah Jessica", email: "sj@dev.com", password: "potato")
    assert_not developer.save
  end
end
