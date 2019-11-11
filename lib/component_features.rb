module ComponentFeatures
  def enable(key)
    @features ||= {}
    @features[key] = true
  end

  def [](key)
    !@features.nil? && @features[key]
  end

  module_function :[], :enable
end
