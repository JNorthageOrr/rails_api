require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  #Test for whether User is a valid model object using @user setup
  def setup 
  	@user = User.new(name: "Test User", email: "user@example.com",
  					 password: "foobaraa", password_confirmation: "foobaraa")
  end

  #Default case is valid, with both fields filled?
  test "should be valid" do
  	assert @user.valid?
  end

  #Name is not blank?
  test "name should be present" do
  	@user.name = "  "
  	assert_not @user.valid?
  end

  #Email is not blank?
  test "email should be present" do	
  	@user.email = "  "
  	assert_not @user.valid?
  end

  #name is less than 65 chars? (my arbitrary max is 64)
  test "name should be less than 65 chars" do
  	@user.name = "a" * 65
  	assert_not @user.valid?
  end

  #email is less than 256 chars?
  test "email should be less than 256 chars" do
  	@user.email = "a" * 244 + "@example.com"
  	assert_not @user.valid?
  end

  #Email address validation tests:
  # %w makes array of strings, loops through array and checks that each passes
  test "email validation should accept valid addresses" do
  	valid_addresses = %w[user@example.com user@foo.COM A_US-ER@foo.bar.org 
  						first.last@foo.jp alice+bob@baz.cn]
	valid_addresses.each do |valid_address|
		@user.email = valid_address
		assert @user.valid?, "#{valid_address.inspect} should be valid"
	end
  end

  #test for invalid addresses:
  test "email validation should reject invalid addresses" do 
  	invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. 
  		foo@bar_baz.com foo@bar+baz.com]
  	invalid_addresses.each do |invalid_address|
  		@user.email = invalid_address
  		assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
  	end
  end

  #test that email addresses are unique (not already in DB)
  test "email addresses should be unique" do
  	duplicate_user = @user.dup
  	duplicate_user.email = @user.email.upcase
  	@user.save
  	assert_not duplicate_user.valid?
  end

  #password is not blank
  test "password should be present (nonblank)" do
  	@user.password = @user.password_confirmation = " " * 8
  	assert_not @user.valid?
  end

  #password should have minimum length of 8
  test "password should have a minimum length" do
  	@user.password = @user.password_confirmation = "a" * 7
  	assert_not @user.valid?
  end

end
