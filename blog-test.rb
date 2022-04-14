require "selenium-webdriver"
require "rspec"

describe "Blog application" do
  describe "signup to the blog application" do
    it "confirm that a user can successfully signup" do
      timestamp = Time.now.to_i

      driver = Selenium::WebDriver.for :chrome
      driver.navigate.to "https://selenium-blog.herokuapp.com/signup"

      username_field = driver.find_element(id: 'user_username')
      username_field.send_keys("user #{timestamp}")

      email_field = driver.find_element(id: 'user_email')
      email_field.send_keys("user#{timestamp}@test.com")

      password_field = driver.find_element(id: 'user_password')
      password_field.send_keys("password")

      sign_up_button = driver.find_element(id: 'submit')
      sign_up_button.click

      banner = driver.find_element(id: "flash_success")
      banner_text = banner.text
      expect(banner_text).to eq("Welcome to the alpha blog user #{timestamp}")

      driver.quit
    end
  end
end