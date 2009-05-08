class Feature
    
  attr_accessor :key, :name, :parent_key, :datas
  
  def initialize(options)
    self.key = options[:key]
    self.name = options[:name]
    self.parent_key = options[:parent_key]
    self.datas = {}
  end
  
  def add_value(model, product, rawvalue, author_key, weight)
    product.add_value(model, key, rawvalue2store(rawvalue), author_key, weight )
  end
  
  def remove_value(model, product, author_key)
    product.remove_value(model, key, author_key)
  end

  def to_s() "feature ##{key} #{name} (#{datas[:values].size} values)"

  def rawvalue2store(rawvalue) rawvalue end
    
end
