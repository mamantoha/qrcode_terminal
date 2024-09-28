require "../src/qrcode_terminal"

puts QRCodeTerminal::VERSION
puts QRCodeTerminal.generate("this is the bomb")
