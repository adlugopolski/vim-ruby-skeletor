require_relative "underscore.rb"

class Parser
  using Underscore

  def self.call(*args)
    new(*args).call
  end

  def initialize(code)
    self.code = code
  end

  def call
    if match
      relative_path
    else
      ""
    end
  end

  private

  attr_accessor :code

  def regexp
    /(([A-Z][A-Za-z]+)::)*([A-Z][A-Za-z]*)/
  end

  def match
    @_match ||= code.match(regexp)
  end

  def value
    match[0].underscore
  end

  def relative_path
    format("app/services/%<path>s.rb", path: value)
  end
end
