require "qr-code"

module QRCodeTerminal
  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}

  extend self

  def generate(text : String) : String
    # based on https://github.com/gtanner/qrcode-terminal/blob/master/lib/main.js
    qrcode = QRCode.new(text, level: :h)

    platte = {
      white_all:   '█',
      white_black: '▀',
      black_white: '▄',
      black_all:   ' ',
    }

    module_count = qrcode.modules.size
    module_data = qrcode.modules

    border_top = platte[:black_white].to_s * (module_count + 2)
    border_bottom = platte[:white_black].to_s * (module_count + 2)

    String.build do |output|
      output << border_top
      output << '\n'

      module_count.times.step(2).each do |row|
        output << platte[:white_all] # left border

        module_count.times.each do |col|
          if !module_data.dig?(row, col) && !module_data.dig?(row + 1, col)
            output << platte[:white_all]
          elsif !module_data.dig?(row, col) && module_data.dig?(row + 1, col)
            output << platte[:white_black]
          elsif module_data.dig?(row, col) && !module_data.dig?(row + 1, col)
            output << platte[:black_white]
          else
            output << platte[:black_all]
          end
        end

        output << platte[:white_all] # right border

        output << '\n'
      end

      output << border_bottom unless module_count.odd?
    end
  end
end
