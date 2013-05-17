module Soulmate

  class Base

    include Helpers

    attr_accessor :type

    def initialize(type)
      @type = normalize(type)
    end

    def app
      Rails.application.class.parent_name.parameterize
    end

    def namespace
      "#{app}:#{Rails.env}"
    end

    def base
      "#{namespace}:soulmate:index:#{type}"
    end

    def database
      "#{namespace}:soulmate:data:#{type}"
    end

    def cachebase
      "#{namespace}:soulmate:cache:#{type}"
    end
  end
end