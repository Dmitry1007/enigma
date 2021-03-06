require_relative 'encryptor'


message_filename = ARGV[0] || "message.txt" 
encrypted_message_filename = ARGV[1] || "encrypted.txt"

message = File.open(message_filename, "r").read

encrypted_message = Encryptor.new
key = encrypted_message.key_generator
date = encrypted_message.date_generator

BOOYEY = encrypted_message.encrypt(key, date, message)

File.open(encrypted_message_filename, "w") { |file| file.write(BOOYEY) }

puts "Created 'encrypted.txt' with the key #{key} and date #{date}"
