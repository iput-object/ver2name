# Ver2Name

A simple Bash script to rename APK files based on their app name and version, then move them to an output folder. This script uses the `aapt` binary to extract the app's metadata.

---

## Features

- Extracts **app name** and **version** from APK files.
- Renames APK files in the format: `<AppName>_<Version>.apk`.
- Moves renamed files to an `output` folder.
- Self-contained: includes the `aapt` binary in the project (`lib` folder).
- Portable: No external dependencies required beyond `bash`.

---

## Folder Structure

```
project/
├── input/         # Place your APK files here
├── output/        # Renamed APK files will be moved here
├── lib/
│   └── aapt       # aapt binary (included with the project)
└── rename_apk.sh  # Bash script
```

---

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/darksky4you/ver2name.git
   cd ver2name
   ```

2. Ensure the `aapt` binary is in the `lib` folder. The script already includes the binary, but you can replace it if needed.

3. Make the script executable:
   ```bash
   chmod +x rename_apk.sh
   ```

---

## Usage

1. Place your APK files in the `input` folder.
2. Run the script:
   ```bash
   ./rename_apk.sh
   ```
3. Renamed APKs will appear in the `output` folder.

---

## Requirements

- **Bash** (default on most Unix-based systems like Linux and macOS).
- `aapt` binary (included in the `lib` folder).

---

## Example

### Input:
- `input/OpenID.apk` (App Name: `OpenID`, Version: `1.2.3`).

### Output:
- `output/OpenID_1.2.3.apk`.

---

## Troubleshooting

1. **No `aapt` binary found**:
   - Ensure the `aapt` binary is in the `lib` folder.
   - Check if it is executable: 
     ```bash
     chmod +x lib/aapt
     ```

2. **No APK files found**:
   - Ensure your APK files are placed in the `input` folder.

3. **Empty app name or version**:
   - This can happen if the APK metadata is incomplete or corrupted.
   - Verify the APK with:
     ```bash
     lib/aapt dump badging input/YourApp.apk
     ```

---

## License

This project is open-source under the MIT License. Feel free to modify and use it as per your needs.

---

## Credits

Developed by [@darksky4you](https://github.com/darksky4you).

Special thanks to:
- [ChatGPT](https://openai.com/chatgpt) for providing guidance and assisting with automation ideas.

---
