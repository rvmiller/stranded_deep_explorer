module SFE

  class AbstractObject

    def missing_string
      "unknown"
    end

    def no_data
      "no data"
    end

    def fetch(key, args)
      parse_value(key, args.fetch(:from, nil), args.fetch(:default, nil))
    end

    def parse_value(key, source, default)
      return no_data unless validate source
      rv = source.fetch(key, nil)
      rv ? rv : default
    end

    def validate(source)
      if (!source.nil? and source.is_a?(Hash))
        return true
      else
        return false
      end
    end

  end

end