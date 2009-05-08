class Feature
    
  attr_accessor :key, :name, :parent_key, :datas
  
  def initialize(options)
    self.key = options[:key]
    self.name = options[:name]
    self.parent_key = options[:parent_key]
    self.datas = {}
  end
  
  def add(type, item, rawvalue, author_key, weight)
    item.add(type, key, rawvalue2store(rawvalue), author_key, weight )
  end
  
  def remove(type, item, author_key)
    item.remove(type, key, author_key)
  end

  def to_s() "feature ##{key} #{name} (#{datas[:values].size} values, #{datas[:ratings].size} ratings)"

  def rawvalue2store(rawvalue) rawvalue end
    
end
