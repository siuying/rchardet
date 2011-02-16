require 'spec_helper'

describe CharDet do
  before(:each) do
    @unknown = CharDet.detect("a random string")
  end
  
  it "should have two accessor methods" do
    lambda {
      @unknown.encoding
      @unknown.confidence
    }.should_not raise_error(NoMethodError)
  end
  
  it "should return the right content" do
    @unknown.encoding.should eq("ascii")
    @unknown.confidence.should be_instance_of(Float)
  end
  
  it "should return a nice message if nil is being passed" do
    lambda {
      CharDet.detect(nil)
    }.should raise_error(Exception, "Sorry, we can't guess the encoding on a nil object")
  end
  
  it "should not raise an exception when passing an empty string" do
    lambda {
      CharDet.detect("")
    }.should_not raise_error(Exception)
  end
end