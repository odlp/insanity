require 'insanity/version'
require 'insanity/printer'
require 'open3'

module Insanity
  class Runner

    def initialize(command:, iterations:, printer: Printer.new)
      @command = command
      @iterations = iterations
      @printer = printer
      @results = []
    end

    def commence!
      iterations.times do |i|
        _, status = Open3.capture2e(command)
        add_result(status)
        printer.update_progress(status)
      end

      printer.print_summary(iterations, results)
    end

    Result = Struct.new(:status)

    private

    attr_reader :command, :iterations, :printer
    attr_accessor :results

    def add_result(status)
      results << Result.new(status)
    end

  end
end
