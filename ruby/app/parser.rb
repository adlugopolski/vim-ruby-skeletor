require_relative "underscore.rb"

class Parser
  using Underscore

  def self.call(*args)
    new(*args).call
  end

  def initialize(code, prefix: default_prefix)
    self.code = code
    self.prefix = prefix
  end

  def call
    if match
      relative_path
    else
      ""
    end
  end

  private

  attr_accessor :code, :prefix

  def default_prefix
    "app/services"
  end

  def regexp
    /(([A-Z][A-Za-z]+)::)*([A-Z][A-Za-z]*)/
  end

  def match
    @_match ||= code.match(regexp)
  end

  def value
    match[0].underscore
  end

  def segments
    [prefix, format("%<path>s.rb", path: value)].reject do |string|
      string.length.zero?
    end
  end

  def relative_path
    segments.join("/")
  end
end
