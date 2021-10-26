require_relative "patient"

class Room
  attr_reader :patients
  attr_accessor :id

  class RoomError < Exception; end

  def initialize(attributes = {})
    @id = attributes[:id]
    @capacity = attributes[:capacity]
    @patients = attributes[:patients] || []
  end

  def full?
    @capacity == @patients.length
  end

  def add_patient(patient)
    raise RoomError.new "Sorry, the room is full"  if self.full?
    @patients << patient
    patient.room = self
  end
end

# patient_1 = Patient.new(name: "Gabriel")
# patient_2 = Patient.new(name: "Pilar")

# room = Room.new(capacity: 2)

# room.add_patient(patient_1)
# room.add_patient(patient_2)

# patient_3 = Patient.new(name: "Jeff")

# begin 
#   room.add_patient(patient_3)
# rescue Room::RoomError
#   puts "Don't worry, the patient was not added"
# end