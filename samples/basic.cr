require "../src/qrcode_terminal"

puts QRCodeTerminal::VERSION
puts QRCodeTerminal.generate("https://github.com/mamantoha/qrcode_terminal")
