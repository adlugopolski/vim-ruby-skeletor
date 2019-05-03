module Squish
  refine String do
    def squish
      self
        .gsub(/\A[[:space:]]+/, "")
        .gsub(/[[:space:]]+\z/, "")
        .gsub(/[[:space:]]+/, " ")
    end
  end
end
