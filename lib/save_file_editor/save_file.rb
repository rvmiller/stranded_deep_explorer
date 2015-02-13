module SFE

  class SaveFile
    attr_accessor :file

    def initialize
      @file = nil
    end

    def data
      @data ||= SFE::Parser.parse(file)
    end

    def clear
      @data = Hash.new
    end

  end

end