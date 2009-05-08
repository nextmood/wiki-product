class Model < ActiveRecord::Base
  
  serialize :datas, Hash
  
  before_create { |model| model.datas = { :incr_counter => 1, :features => {:all => Feature.new(:key => 0, :parent_feature_key => nil)} } }
    
  def create_feature(type, parent_feature_key=0)
    feature = Feature.new(:key => incr_counter, :parent_feature_key => parent_feature_key)
    features[feature.key] = feature
    save
  end
  
  def update_feature(feature_key, attributes)
    features[feature_key].update_attribute(attributes)
    save
  end
  
  def destroy_feature(feature_key)
    features[feature_key].delete
    save
  end
  
  def reorder_feature(feature_key_1, feature_key_2)
    f1 = features[key_1]
    f2 = features[key_2]
    raise "should have the same father" unless f1.parent_feature_key == f2.parent_feature_key
  end
  
  def add_value(item_key, value, feature_key = :all, author_key = nil, weight = 1.0)
    item = Item.find_by_key(item_key)
    features[feature_key].add(:values, item, value, author_key, weight)
  end
  
  def remove_value(item_key, feature_key = :all, author_key = nil)
    item = Item.find_by_key(item_key)
    features[feature_key].remove(:values, item, author_key)
  end
  
  def add_rating(item_key, value, feature_key = :all, author_key = nil, weight = 1.0)
    item = Item.find_by_key(item_key)
    features[feature_key].add(:ratings, item, value, author_key, weight)
  end
  
  def remove_rating(item_key, feature_key = :all, author_key = nil)
    item = Item.find_by_key(item_key)
    features[feature_key].remove(:ratings, item, author_key)
  end
  
  private
  
  def features() datas[:features] end
  
  def incr_counter() datas[:incr_counter] += 1 end
    
end
