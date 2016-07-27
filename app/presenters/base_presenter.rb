class BasePresenter
  extend Forwardable

  def initialize(object)
    @object = object
    class_eval do
      object_methods = object.attribute_names.map(&:to_sym) + [:to_param]
      def_delegators :@object, *object_methods
    end
  end

  class << self
    def decorate(object)
      new(object)
    end

    def decorate_all(objects)
      objects.map { |o| new(o) }
    end
  end

  attr_reader :object
end
