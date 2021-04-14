module ApplicationHelper
  def method_missing(name, *args, &block)
    if name =~ /^hidden_(\w+?)_if$/
      tag_name = $1
      self.class.define_method name do |condition, attributes = {}, &block|
        attributes['style'] = "display: none" if condition
        content_tag(tag_name, attributes, &block)
      end
      send(name, args[0], args[1], &block)
    else
      super
    end
  end
end
