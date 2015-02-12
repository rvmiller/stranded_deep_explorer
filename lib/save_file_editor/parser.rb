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
      def parse
        get_persistent_world
      end

      # TODO: nullsafe
      def get_persistent_world
        parse_sample_save_file.fetch("Persistent")
      end

      def parse_sample_save_file
        JSON.parse(sample_save_file)
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