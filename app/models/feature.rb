class Feature
    
  attr_accessor :key, :name, :parent_key, :datas
  
  def initialize(options)
    self.key = options[:key]
    self.name = options[:name]
    self.parent_key = options[:parent_key]
    self.datas = {}
  end
  
  def add_value(product, rawvalue, author_key, weight)
    product.add_value(key, rawvalue2store(rawvalue), author_key, weight )
  end
  
  def remove_value(product, author_key)
    product.remove_value(key, author_key)
  end

  def to_s() "feature ##{key} #{name} (#{datas[:values].size} values, #{datas[:ratings].size} ratings)"

  def rawvalue2store(rawvalue) rawvalue end
    
end
