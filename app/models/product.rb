class Product < ActiveRecord::Base
  
  serialize :datas, Hash
  
  before_create { |product| product.datas = { :values => {} } }
  
  def add_value(feature_key, value, author_key, author_weight)
    values[:feature_key] ||= []
    values[:feature_key] << [value, author_key, author_weight, Time.now]
    save
  end
  
  def remove_value(feature_key, from_author_key)
    values[:feature_key].delete_if { |value, author_key, weight, timestamp| from_author_key == author_key }
    save
  end
  
  private 
  
  def values() data[:values] end
      
end
