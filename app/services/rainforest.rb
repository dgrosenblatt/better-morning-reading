class Rainforest
  BASE_URL = 'https://api.rainforestapi.com/request'

  def self.search_books(query)
    response = RestClient.get(BASE_URL, {
      params: {
        search_term: query,
        api_key: RAINFOREST_API_KEY,
        associate_id: AMAZON_ASSOCIATE_ID,
        type: 'search',
        amazon_domain: 'amazon.com',
        category_id: 'books'
      }
    })

    json = JSON.parse(response.body)
    json['search_results']
  end

  def self.product(asin)
    response = RestClient.get(BASE_URL, {
      params: {
        asin: asin,
        api_key: RAINFOREST_API_KEY,
        associate_id: AMAZON_ASSOCIATE_ID,
        type: 'product',
        amazon_domain: 'amazon.com'
      }
    })

    json = JSON.parse(response.body)
    json['product']
  end
end
