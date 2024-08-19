# InstallSoftware.ps1

# Function to install software
function Install-Software {
    param (
        [string]$folderPath
    )

    # Get all executable and MSI files in the specified folder
    $softwareFiles = Get-ChildItem -Path $folderPath -File | Where-Object { $_.Extension -eq ".exe" -or $_.Extension -eq ".msi" }
    $totalFiles = $softwareFiles.Count
    $installedCount = 0

    if ($totalFiles -eq 0) {
        Write-Host "No software found in the specified folder."
        return
    }

    # Loop through each software file and install it
    foreach ($software in $softwareFiles) {
        Write-Host "Installing: $($software.Name)"
        
        # Determine the installation command based on file type
        if ($software.Extension -eq ".exe") {
            # Start the installation process for .exe files with silent installation
            Start-Process -FilePath $software.FullName -ArgumentList '/S', '/quiet' -Wait -NoNewWindow
        } elseif ($software.Extension -eq ".msi") {
            # Start the installation process for .msi files with silent installation
            Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$($software.FullName)`" /quiet /norestart" -Wait -NoNewWindow
        }

        # Increment the count of installed software
        $installedCount++

        # Calculate and display the installation progress
        $percentage = [math]::Round(($installedCount / $totalFiles) * 100, 2)
        Write-Host "Installation Progress: $percentage% ($installedCount of $totalFiles)"
    }

    Write-Host "Installation completed for $installedCount out of $totalFiles software."
}

# Check for elevated permissions
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "This script requires elevated permissions. Please run as Administrator."
    exit
}


# Specify the folder containing the software
$softwareFolder = "D:\Software"

# Call the function to install software
Install-Software -folderPath $softwareFolder