# Computer Maintenance

### Problem:
As computers age, their components naturally degrade, and performance can decline.  Windows provides several diagnostic and maintenance tools to help identify and fix issues such as file corruption, disk errors, and outdated drivers.  
  
However, these tools are scattered and not intuitive to locate, requiring technical knowledge to run effectively.  Most users are unaware of these tools or how to use them, which can lead to unnoticed system corruption, degraded performance, and potentially loss of access to their computer.

### Solution:
This script consolidates essential Windows maintenance tasks into a single batch file.  It automates installing updates, fixing Windows corruption, freeing up disk space, and much more.  
  
By simplifying the process, you can execute this with minimal input and maintain system health, improve performance, and prevent common issues that arise from neglect or lack of technical expertise. 


## How To Use  

### Part 1: Setup
  1. Download Computer_Maintenance_Setup.bat file
  2. Right click the file.  Click 'Run as administrator'
  3. Click 'Yes' on the prompt
  4. This will open up a window for what kind of files you want to clean up.  Select the ones you would like to clean up  
>**Tip**: Here is the Microsoft documentation for what each section means.  [Microsoft Cleanup Documentation](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/cleanmgr#options)
  5. After you have made your selection click 'ok' to save your configuration
  6. It will then install some modules to programatically install windows updates.  You can then press any key to close

### Part 2: Running  
  1. Download Computer_Maintenance.bat file
  2. Right click the file.  Click 'Run as administrator'
  3. Click 'Yes' on the prompt
  4. You can see it progressing with 'Starting' and 'Completed' messages
  5. After making it through Updates and Maintenance you will get to a section called 'Longer Checks'.  This will prompt a 'Y' or 'y' if you would like to do the check.  Type anything else to not perform that check
     A. RAM check: This checks if RAM is working properly.  This requires a restart and will run tests for 10-30 minutes not allowing you computer access during this time  
     B. Drive scan.  This scans and repairs C drive.  You can schedule this to be done on next restart.
>**Note**: Longer checks don't need to be perfomed as regularly and will take much longer amounts of time.  They require restarts and additional time to run checks

## What it actually does  
  
### Updates  
  1. Installs Windows Updates  
  2. Installs Microsoft Updates through Windows Update  
  3. Runs winget (scans your installed software and checks for and installs newer version)
  
### Maintenance 
  1. Free up disk space using cleanmgr.  The things to clean can be changed by running the Computer_Maintenance_Setup.bat file.
  2. Free up disk space using defrag.  Gives you space back for files that have already been deleted
  3. Check for corrupted Windows files using sfc /scannow.  Fixes any corruption in windows files
  4. Check for corrupted Windows image using DISM.  Fixes corruption in windows image.

### Longer Checks
  1. Tests RAM for errors using Windows Memory Diagnostic.
  2. Fixes disk errors using chkdsk.  

### Computer Specs
Shows specs for your compute including hardware and software.  You can use this to search the internet for newer software versions for your hardware.  
It is much more difficult to make a scaleable solution for various setups, and there are generally not API's or static links to check for newer versions :(
