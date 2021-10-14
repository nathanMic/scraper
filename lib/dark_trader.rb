require 'nokogiri'
require 'open-uri'

B=[]  #mon premier array dans lequel je stock tout ce que je scrap

def crypto_scrapper ()
  url = "https://coinmarketcap.com/all/views/all/"
  page_inspect = URI.open(url)
  page_inspected = Nokogiri::HTML(page_inspect)
  page_inspected.xpath('//a[contains(@href, "/currencies")]').each do |crypto|
    
   crypto = crypto.text
    B << crypto
    end
    #puts B.to_s
end
crypto_scrapper


# Le tri que j'effectue dans mon array pour avoir 'mon_scrap' final
abrev = []
name = []
price = []
volume = []

20.times do |i|
abrev << B[0]
B.shift
name << B[0]
B.shift
price << B[0]
B.shift
volume << B[0]
B.shift
end

mon_scrap = Hash[name.zip(price)]
 
puts mon_scrap
#puts name.to_s
#puts price.to_s
