module SFE

  class AbstractObject

    def missing_string
      "unknown"
    end

    def fetch(key, args)
      source  = args.fetch(:from)
      default = args.fetch(:default, nil)
      rv = source.fetch(key, nil)
      rv ? rv : default
    end

  end

end