class Code
  def self.generate
    colors = ["R", "O", "Y", "G", "B", "P"]
    Array.new(4).map { |_| colors.sample }
  end
end
