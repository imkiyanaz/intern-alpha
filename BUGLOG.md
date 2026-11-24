# BUGLOG — Task 01.1.BUG

## Bug 1: Incorrect Binary Conversion

**Symptom:** `to_binary(72)` returned `001000` instead of `1001000`.

**Hypothesis:** The loop stopped before processing the final bit.

**Experiment:** Tested the function with 72, 5, 1, and 0.

**Root cause:** The condition `while n > 1` skipped the last bit. Zero was also not handled.

**Fix:** Changed the loop condition to `while n > 0` and added a special case for zero.

**Test added:** Assertions for 72, 5, 1, and 0 in `test_bug.py`.

**Lesson:** Always check loop boundaries and edge cases.

## Bug 2: Incorrect Character Count

**Symptom:** The word "سلام" was reported as 8 characters instead of 4.

**Hypothesis:** The function was counting UTF-8 bytes instead of characters.

**Experiment:** Compared `len(text)` with `len(text.encode("utf-8"))`.

**Root cause:** The function used UTF-8 encoding to count characters.

**Fix:** Changed `char_count` to return `len(text)`.

**Test added:** Checked that `char_count("سلام") == 4`.

**Lesson:** Character count and byte count are different.

## Bug 3: Incorrect File Path

**Symptom:** The program saved the file using an incorrect path, and `saved?` returned `False`.

**Hypothesis:** The path separator was incompatible with the operating system.

**Experiment:** Compared the generated path with the expected path on macOS.

**Root cause:** The function used a Windows-style backslash (`\`) instead of the correct path separator.

**Fix:** Replaced manual path concatenation with `os.path.join(folder, file_name)`.

**Test added:** Checked that `note_path("notes", "binary.md")` returns `notes/binary.md`.

**Lesson:** Use `os.path.join()` for cross-platform file paths.

## Bug 4: Incorrect File Location

**Symptom:** The program created an incorrectly named file instead of saving `binary.md` inside the `notes` directory.

**Hypothesis:** The incorrect path caused the file to be created in the wrong location.

**Experiment:** Used `ls -la` to inspect the files and directories.

**Root cause:** The backslash in the path was treated as part of the filename on macOS.

**Fix:** Corrected the path generation, verified the proper file was saved, and deleted the incorrectly named file.

**Test added:** Ran `python3 byte_report.py` and verified that `saved?` returned `True`.

**Lesson:** Always verify that generated files are saved in the expected directory.

## Final Verification

- All assertions in `test_bug.py` passed.
- Binary conversion works correctly.
- Persian character counting is correct.
- File paths use the correct separator.
- `notes/binary.md` is saved successfully.
- The incorrectly named file was removed.

**Final result:** All tests passed!