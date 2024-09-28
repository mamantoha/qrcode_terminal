require "./spec_helper"

describe QRCodeTerminal do
  it "works" do
    output = QRCodeTerminal.generate("It's works!")

    puts output
  end
end
