$folders = Get-ChildItem -Directory

# Loop through each folder and apply the ownership and permissions changes
foreach ($folder in $folders) {
    # Take ownership
    takeown /f $folder.FullName

    icacls $folder.FullName /grant "*S-1-5-11:(R)"
}
