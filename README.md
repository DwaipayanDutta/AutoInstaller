
<p align="center">
  <img src="https://github.com/DwaipayanDutta/AutoInstaller/blob/main/Installer/settings.png" alt="Software Icon" width="100" height="100"/>

  
</p>

# InstallSoftware.ps1

## 📜 Overview

`InstallSoftware.ps1` is a PowerShell script designed to automate the installation of software applications. It scans a specified directory for executable (`.exe`) and Windows Installer (`.msi`) files and installs them sequentially. The script provides progress updates and handles both types of installation files.

## 🚀 Features

- **Automated Software Installation**: Automatically installs all `.exe` and `.msi` files found in a specified folder.
- **Progress Reporting**: Displays installation progress with percentage completion.
- **Silent Installation**: Uses silent installation options to avoid user interaction during the process.
- **Elevated Permissions Check**: Ensures the script is run with administrative privileges.

## 📋 Requirements

- **PowerShell**: The script is compatible with Windows PowerShell.
- **Administrative Privileges**: The script must be run as an administrator to successfully install software.

## 🔧 Usage

1. **Set Up the Software Folder**

   Place all the `.exe` and `.msi` installation files in a designated folder. Update the `$softwareFolder` variable in the script to point to this folder.

2. **Run the Script**

   Open PowerShell as an administrator and execute the script:

   ```powershell
   .\InstallSoftware.ps1
    ```
3. **Batch File**

   Batchfile is also provided to run from same folder which calls install powershell 
