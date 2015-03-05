require_relative 'key_parser'
require_relative 'offset_parser'
require_relative "rotator"

class Encryptor

	def initialize(key, date, message)
		key_parser = KeyParser.new 
		@rotation_numbs = key_parser.parse(key)

		offset_parser = OffsetParser.new
		@offset_numbs = offset_parser.offset(date)

		@rotator = Rotator.new

		@message = message  
	end

	def encrypt

		encrypted_chars = []
		counter = 0

		@message.each_char do |letter|
			rotation = @rotation_numbs[counter] 
			offset = @offset_numbs[counter]
			encrypted_chars << @rotator.rotate(letter, rotation, offset)
			counter += 1
		end
		encrypted_chars.join		

	end

# Takes the key and sends the key into key_parser and gets back the rotation numbers
# Takes the date sends that to offset parser and gets the offset numbers

# Reads the input file
# it creates the output file

# goes through the input text one char at a time or 4 characters at a time
# it asks the rotator to rotate this character with this appropriate key rotation with this appropriate offset

# it writes the response to the output file 

end

# key = KeyParser.new
# puts key.parse("41521")

# offset = OffsetParser.new
# puts offset.offset("020315")

# Encrypting a Message

# Four characters are encrypted at a time.
# The first character is rotated forward by the "A" rotation plus the "A offset"
# The second character is rotated forward by the "B" rotation plus the "B offset"
# The third character is rotated forward by the "C" rotation plus the "C offset"
# The fourth character is rotated forward by the "D" rotation plus the "D offset"
