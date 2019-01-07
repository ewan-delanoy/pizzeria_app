require 'test_helper'

class TrainMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end
  mailer = new TrainMailer;
  mailer.welcome_email 
end
