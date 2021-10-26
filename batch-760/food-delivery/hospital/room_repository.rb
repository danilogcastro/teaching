require_relative 'room'
require 'csv'

class RoomRepository
  def initialize(csv_file_path)
    @csv_file = csv_file_path
    @rooms = []
    load_csv
    @next_id = @rooms.empty? ? 1 : @rooms.last.id + 1
  end

  def find(room_id)
    @rooms[room_id]
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id]    = row[:id].to_i          
      row[:capacity] = row[:capacity].to_i
      room = Room.new(row)
      @rooms << room
    end
  end
end

# room = RoomRepository.new("rooms.csv")

# p room