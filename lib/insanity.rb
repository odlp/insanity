require 'insanity/version'
require 'insanity/screen_printer'
require 'insanity/file_writer'
require 'open3'

module Insanity
  class Runner

    def initialize(command:, options:, printer: ScreenPrinter.new, persistence_klass: FileWriter)
      @command = command
      @iterations = options[:iterations]
      @printer = printer
      @persistence = persistence_klass.new(output_dir: options[:output_dir])
      @results = []
    end

    def commence!
      iterations.times {|i| perform_iteration(i) }
      printer.print_summary(iterations, results)
    end

    Result = Struct.new(:status)

    private

    attr_reader :command, :iterations, :printer, :persistence
    attr_accessor :results

    def perform_iteration(i)
      output, status = Open3.capture2e(command)
      add_result(status)
      persistence.save(iteration: i, status: status, output: output)
      printer.update_progress(status)
    end

    def add_result(status)
      results << Result.new(status)
    end

  end
end
