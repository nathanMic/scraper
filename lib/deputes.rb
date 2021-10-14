require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(URI.open('https://www2.assemblee-nationale.fr/deputes/liste/tableau'))

def get_one_depute(pages)
array_deputes = pages.xpath('//*[@id="haut-contenu-page"]/article/div[2]/h1').text.split(" ")
hash_one_depute = {'first name' => array_deputes[1], 'name' => array_deputes[2], 'email' => pages.xpath('/html/body/div/div[2]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a').text}
return hash_one_depute
end

def get_deputes_url(page)
  link_depute = page.xpath('//tbody//a')
  link_depute_array = []
  link_depute.each do |link|
    link_depute_array << "https://www2.assemblee-nationale.fr" + link['href']
  end
  return link_depute_array
end
#puts get_deputes_urls(page)

def perform(page)
  result = []
  get_deputes_url(page).each do |url|
    pages = Nokogiri::HTML(URI.open(url))
    result << get_one_depute(pages)
  end
  return result
end

puts perform(page)