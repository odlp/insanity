require 'fileutils'

module Insanity
  class FileWriter

    def initialize(output_dir:)
      return if output_dir.nil?
      @write_path = check_or_create_output_dir(output_dir)
    end

    def save(iteration:, status:, output:)
      return if no_path?

      file_name = File.join(write_path, "i#{iteration}-exit#{status.exitstatus}.txt")
      File.write(file_name, output)
    end

    private

    attr_reader :write_path

    def no_path?
      write_path.nil?
    end

    def check_or_create_output_dir(output_dir)
      dir = File.expand_path(output_dir)
      unless File.directory? dir
        FileUtils.mkdir_p dir
      end
      dir
    end
  end
end
