class Extractor
  def self.call(*args)
    new(*args).call
  end

  def initialize(arg)
    self.arg = arg
  end

  def call
    class_name
  end

  private

  attr_accessor :arg

  def class_name
    arg
      .gsub(/^.*\/?app\/[a-z]+\//, "")
      .gsub(/(_spec)?\.rb$/, "")
      .split("/")
      .map { |name| name.split("_").map(&:capitalize).join }
      .join("::")
  end
end
