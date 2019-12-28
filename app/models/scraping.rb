class Scraping
    def self.product_urls
      
      links = []
      
      agent = Mechanize.new
      current_page = agent.get("https://ramendb.supleks.jp/rank/recent")
      urls = current_page.search(".name a")
      urls.each do |url|
        links << url.get_attribute("href")
      end
      
      links.each do |link|
        get_product("https://ramendb.supleks.jp/" + link)
      end
      
    end
    
    def self.get_product(link)
      agent = Mechanize.new
      page = agent.get(link)
      title = page.at("table tr:first-child td").inner_text if page.at("table tr:first-child td")
      image_url = page.at(".comment img").get_attribute("src") if page.at(".comment img")
      address = page.at("table tr:nth-child(2) td").inner_text if page.at("table tr:nth-child(2) td")
      
      product = Product.where(title: title, image_url: image_url, address: address).first_or_initialize
      product.save
    end
end