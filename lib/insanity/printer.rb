module Insanity
  class Printer
    def update_progress(status)
      if status.success?
        print green_dot
      else
        print red_dot
      end
    end

    def print_summary(iterations, results)
      puts "\n\n#{iterations} iterations complete.\n\n"
      print_count_by_exit_code(results)
    end

    private

    def red_dot
      "\e[31m.\e[0m".freeze
    end

    def green_dot
      "\e[32m.\e[0m".freeze
    end

    def print_count_by_exit_code(results)
      count_by_status = Hash.new { 0 }
      results.each {|r| count_by_status[r.status.exitstatus] += 1 }

      count_by_status
        .sort { |a,b| b[1] <=> a[1] }
        .each { |i| puts "Status #{i[0]}\t| #{i[1]} times" }
    end
  end
end
