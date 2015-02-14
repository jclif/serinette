# Gives mixed in classes a method for returning an array of their descendents
module Descendents
  def self.included(base)
    base.extend(ClassMethods)
  end

  # required for inheritance
  module ClassMethods
    def descendents
      ObjectSpace.each_object(Class).select { |klass| klass < self }
    end
  end
end
