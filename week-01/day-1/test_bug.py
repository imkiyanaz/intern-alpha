from byte_report import to_binary, char_count, note_path

assert to_binary(72) == "1001000"
assert to_binary(5) == "101"
assert to_binary(1) == "1"
assert to_binary(0) == "0"

assert char_count("سلام") == 4
assert note_path("notes", "binary.md") == "notes/binary.md"

print("All tests passed!")