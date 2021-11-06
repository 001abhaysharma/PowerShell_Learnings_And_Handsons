<#
1. creating folder:
cmdlet: New-Item 
New-Item cmdlet is used to create a directory by passing the path using -Path as path of the directory and -ItemType as Directory
#>

# to create a folder "New Folder" in a perticular location, execute below:

New-Item -Path 'D:\New Folder' -ItemType Directory

<#
2. creating file:
cmdlet: New-Item
New-Item cmdlet is used to create a file by passing the path using -Path as path of the file and -ItemType as File
#>

# to create a file "New File.txt" in a perticular location, execute below:

New-Item -Path 'D:\New Folder\New File.txt' -ItemType File

<#
3. copy folder:
cmdlet: Copy-Item
Copy-Item cmdlet is used to copy a directory by passing the path of the directory to be copied and destination path where the folder is to be copied
#>

# to copy a folder D:\New Folder as D:\New Folder1, execute below:

Copy-Item 'D:\New Folder' 'D:\New Folder1'

# to copy a folder recursively D:\New Folder to D:\New Folder1, execute below:

Copy-Item 'D:\New Folder' -Destination 'D:\New Folder1'

# in the output of above command you can see content of New Folder1 in windows explorer where it contains both the New Folder and New File.txt.

<#
4. copy files:
cmdlet: Copy-Item
Copy-Item cmdlet is used to copy a file by passing the path of the file to be copied and destination path where the file is to be copied
#>

# to copy a file D:\New Folder\New File.txt to D:\Test Folder1, execute below:

Copy-Item 'D:\New Folder\New File.txt' 'D:\Test Folder1\New File1.txt'

# in the output of above command, you can see the New File1.txt in New Folder1 with content of New File.txt. New Folder1 folder should be present before running this command

# to copy all text file recursively D:\New Folder to D:\New Folder1

Copy-Item -Filter *.txt -Path 'D:\New Folder' -Recurse -Destination 'D:\New Folder1'

# in the output of above command, you can see the content of New Folder1 in windows explorer where it contains both the New Folder and only text based file(s)
