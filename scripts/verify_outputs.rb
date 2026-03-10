require "open3"

ROOT = File.expand_path("..", __dir__)

success = true

(1..3).each do |n|
  input_file = File.join(ROOT, "inputs", "input#{n}.txt")
  expected_file = File.join(ROOT, "outputs", "expected_output#{n}.txt")

  command = "ruby #{ROOT}/bin/console < #{input_file}"
  stdout, _stderr, _status = Open3.capture3(command)

  expected = File.read(expected_file)

  if stdout.strip == expected.strip
    puts "Input #{n}: ✅ PASS"
  else
    success = false
    puts "Input #{n}: ❌ FAIL"
    puts "--- Expected ---"
    puts expected
    puts "--- Got ---"
    puts stdout
  end
end

exit(success ? 0 : 1)