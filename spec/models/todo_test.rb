require File.dirname(__FILE__) + '/../spec_helper'

describe Todo do
  fixtures :todos

  it "should be valid" do
    Comment.new.should be_valid
  end
end
