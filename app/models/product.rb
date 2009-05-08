class Product < ActiveRecord::Base
  
  serialize :datas, Hash
  
  before_create { |product| product.datas = {:ratings => {}, :values => {} } }
  
  def add(type, feature_key, value, author_key, weight )
    datas[type][:feature_key] ||= []
    datas[type][:feature_key] << [value, author_key, weight, Time.now]
    save
  end
  
  def remove(type, feature_key, from_author_key)
    datas[type][:feature_key].delete_if { |value, author_key, weight, timestamp| from_author_key == author_key }
    save
  end
  
  
end
