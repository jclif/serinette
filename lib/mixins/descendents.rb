module Descendents
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def descendents
      ObjectSpace.each_object(Class).select { |klass| klass < self }
    end
  end
end
