require File.dirname(__FILE__) + '/../spec_helper'

describe Item do
  fixtures :items

  it "should be valid" do
    Comment.new.should be_valid
  end
end
