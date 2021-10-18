require "date"
require "yaml"

SSN_PATTERN = /(?<gender>[1-2])\s?(?<year>\d{2})\s?(?<month>0[1-9]|1[0-2])\s?(?<department>0[1-9]|[1-9][0-9])\s?(\d{3})\s?(\d{3})\s?(?<key>\d{2})/
DEPARTMENTS = YAML.load_file("data/french_departments.yml")

def french_ssn_info(ssn)
  match_data = ssn.match(SSN_PATTERN)
  if match_data && key_valid?(ssn)
    gender = gender(match_data[:gender])
    year = year(match_data[:year])
    month = Date::MONTHNAMES[match_data[:month].to_i]
    department = DEPARTMENTS[match_data[:department]]
    "a #{gender}, born in #{month}, #{year} in #{department}."
  else
    "The number is invalid"
  end
end

def gender(code)
  code == "1" ? "man" : "woman"
end

def year(year)
  year.to_i <= 21 ? "20#{year}" : "19#{year}"
end

def key_valid?(ssn)
  ssn_array = ssn.split
  key = ssn_array.pop
  key.to_i == (97 - ssn_array.join.to_i) % 97
end

puts french_ssn_info("1 84 12 76 451 089 46")