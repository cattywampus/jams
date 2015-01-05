class EnumSelectInput < SimpleForm::Inputs::CollectionSelectInput
  def input(wrapper_options = nil)
    label_method, value_method = detect_collection_methods
    
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

    options[:include_blank?] = enums.allows_nil? if options[:include_blank].nil?
    
    @builder.collection_select(
           attribute_name, collection, value_method, label_method,
           input_options, merged_input_options
         )
  end
  
  private

  def collection
    @collection ||= begin
      collection = enums ? enums.select_options : []
    end
  end
  
  def enums
    if @builder.object.respond_to?(:enums)
      @builder.object.enums(attribute_name)
    end
  end
  
end
