module SFE

  class Parser

    class << self
      def root_path
        Dir.pwd
      end

      def data_path
        '/lib/sample_data'
      end

      def sample_save_file_name
        'Save.json'
      end

      # TODO: take save file as input
      def parse(file)
        # I don't love this kind of type ambiguity. Should refactor.
        #if file.nil? or file == :sample
        #  get_persistent_world(sample_save_file)
        #else
        #  get_persistent_world(file)
        #end
        get_persistent_world(file)
      end

      # TODO: nullsafe
      def get_persistent_world(save_file)
        return Hash.new if save_file.nil?
        parse_save_file(save_file).fetch("Persistent")
      end

      def parse_save_file(save_file)
        JSON.parse(save_file.read)
      end

      def sample_save_file
        File.read(File.join(sample_data_path, sample_save_file_name))
      end

      def sample_data_path
        File.join(root_path, data_path)
      end

    end
  end

end