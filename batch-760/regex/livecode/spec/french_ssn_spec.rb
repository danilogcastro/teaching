require_relative "../french_ssn.rb"

describe "#french_ssn_number"do
  it "should return 'The number is invalid' if an empty string is passed" do
    actual = french_ssn_info("")
    expected = 'The number is invalid'
    expect(actual).to eq(expected)
  end

  it "should return 'The number is invalid' if an invalid number is passed" do
    actual = french_ssn_info("12345")
    expected = 'The number is invalid'
    expect(actual).to eq(expected)
  end

  it "should return the correct message if a valid number is passed" do
    actual = french_ssn_info("1 84 12 76 451 089 46")
    expected = "a man, born in December, 1984 in Seine-Maritime."
    expect(actual).to eq(expected)
  end
end