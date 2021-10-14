require_relative '../lib/dark_trader'

describe "crypto_scrapper method" do
  it "should scrap crypto & their prices" do
    expect(crypto_scrapper).not_to be_nil
  end
 
end