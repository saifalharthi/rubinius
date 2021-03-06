require File.expand_path('../../../../spec_helper', __FILE__)

describe "File::Stat#ctime" do
  before :each do
    @file = tmp('i_exist')
    touch(@file) { |f| f.write "rubinius" }
  end

  after :each do
    rm_r @file
  end
  
  it "should be able to determine the ctime on a File::Stat object" do
    st = File.stat(@file)
    st.ctime.should be_kind_of(Time)
    st.ctime.should <= Time.now
  end
end
