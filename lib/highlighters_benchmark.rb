# First run `gem install coderay pygements.rb uv --no-document`
require 'rubygems'
require 'benchmark'
require 'coderay'
require 'pygments'
require 'uv'

class HighlightersBenchmark

    def initialize
      @repeat = 50
      @content = File.read(__FILE__)

      $stdout.puts;puts "Uninitialized Highlighters:"
      loop
      $stdout.puts;puts "Initialized Highlighters:"
      loop
    end

    def coderay
      CodeRay.scan(@content, 'ruby').div(css: :class)
    end

    def pygments
      Pygments.highlight(@content, lexer: 'ruby')
    end

    def ultraviolet
      Uv.parse(@content, 'xhtml', 'ruby', true, 'amy')
    end

    def loop
      Benchmark.bm(11) do |b|
        b.report(:coderay) do
          @repeat.times { coderay }
        end

        b.report(:pygments) do
          @repeat.times { pygments }
        end

        b.report(:ultraviolet) do
          @repeat.times { ultraviolet }
        end
      end
    end

end
