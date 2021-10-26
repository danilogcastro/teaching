require_relative 'patient'
require_relative 'room_repository'
require 'csv'

class PatientRepository
  attr_reader :patients

  def initialize(csv_file_path, room_repo)
    @csv_file = csv_file_path
    @room_repository = room_repo
    @patients = []
    load_csv
    @next_id = @patients.empty? ? 1 : @patients.last.id + 1
  end

  def add(patient)
    patient.id = @next_id
    @patients << patient
    @next_id += 1
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id]    = row[:id].to_i
      row[:cured] = row[:cured] == "true"
      patient = Patient.new(row)
      room_id = row[:room_id].to_i - 1
      room = @room_repository.find(room_id)
      patient.room = room
      @patients << patient
    end
  end
end


# room_repo = RoomRepository.new("rooms.csv")
# patient_repo = PatientRepository.new("patients.csv", room_repo)

# p patient_repo.patients.first.room





