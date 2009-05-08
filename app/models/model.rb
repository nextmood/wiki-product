class Model < ActiveRecord::Base
  
  serialize :datas, Hash
  
  before_create { |model| model.datas = { 
    :incr_counter => 1, 
    :features => {0 => Feature.new(:key => 0, :parent_feature_key => nil)} } }
    
  def create_feature(type, parent_feature_key=0)
    feature = Feature.new(:key => incr_counter, :parent_feature_key => parent_feature_key)
    features[feature.key] = feature
    save
  end
  
  # attributes define the feature (numeric, min, max, etc...)
  def update_feature(feature_key, attributes)
    features[feature_key].update_attribute(attributes)
    save
  end
  
  def destroy_feature(feature_key)
    features[feature_key].delete
    save
  end
  
  # swap the order of those 2 features (should be from the same parent)
  def reorder_feature(feature_key_1, feature_key_2)
    f1 = features[key_1]
    f2 = features[key_2]
    raise "should have the same father" unless f1.parent_feature_key == f2.parent_feature_key
  end
  
  def add_value(product_key, value, feature_key = 0, author_key = nil, author_weight = 1.0)
    product = Product.find_by_key(product_key)
    features[feature_key].add_value(product, value, author_key, author_weight)
  end
  
  def remove_value(product_key, feature_key = 0, author_key = nil)
    product = Product.find_by_key(product_key)
    features[feature_key].remove_value(product, author_key)
  end
  

  
  private
  
  def features() datas[:features] end
  
  def incr_counter() datas[:incr_counter] += 1 end
    
end
