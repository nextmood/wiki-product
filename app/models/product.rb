# describe a product
# store the model-feature-value
class Product < ActiveRecord::Base
  
  serialize :datas, Hash
  
  before_create { |product| product.datas = { :model_feature_values = {} } }
  
  def add_value(model, feature_key, value, author_key, author_weight)
    values(model)[:feature_key] ||= []
    values(model)[:feature_key] << [value, author_key, author_weight, Time.now]
    save
  end
  
  def remove_value(model, feature_key)
    values(model)[:feature_key].delete
    save
  end
  
  # check if the feature values have a matching feature otherwise delete
  def cleanup
    datas[:model_feature_values].each_pair { |model_key, feature_values| 
      model = Model.find(model_key)
      feature_keys = []
      model.features_list { |feature| feature_keys << feature.key }
      values(model).delete_if { |feature_key, value| !feature_keys.include?(feature_key)  }
    }
  end
  
  private 
  
  def values(model) 
    datas[:model_feature_values][model.key] ||= []
  end
      
end
