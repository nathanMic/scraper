require_relative '../lib/mailing'

describe "mailing method" do
  it "should scrap mairie du 17 and their emails" do
    expect(perform(page)).not_to be_nil
  end
  it "should return an array of" do
    expect(perform.length(page)).to be == 157
  end
end