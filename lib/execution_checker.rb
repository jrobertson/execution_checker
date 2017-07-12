#!/usr/bin/env ruby

# file: execution_checker.rb

require 'sps-pub'
require 'dynarex'


class ExecutionChecker

  def initialize(dxfile, sps_address: 'sps', verbose: true)

    @dx = Dynarex.new dxfile
    @sps = SPSPub.new host: sps_address
    @verbose = verbose

  end

  def check(tag)

    rx = @dx.find_by_tag tag

    puts 'checking ...'

    if rx then

      if File.exists? rx.filepath then

        if File.mtime(rx.filepath).to_date == Date.today then

          puts 'success: ' + rx.filepath.inspect if @verbose
          @sps.notice rx.success unless rx.success.empty?

        else
          @sps.notice rx.failure unless rx.failure.empty?
        end

      end

    else

      puts 'execution_checker warning: tag '  + tag + ' not found'

    end

  end
end

if $0 == __FILE__ then
  ec = ExecutionChecker.new ARGV[0]
  ec.check tag=ARGV[1]
end
