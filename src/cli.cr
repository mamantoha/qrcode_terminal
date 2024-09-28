require "./qrcode_terminal"

if input = ARGV[0]?
  puts QRCodeTerminal.generate(input.chomp) if input && !input.chomp.empty?
elsif input = STDIN.gets
  puts QRCodeTerminal.generate(input.chomp) if input && !input.chomp.empty?
end
