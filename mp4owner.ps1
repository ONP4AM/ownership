$mp4Files = Get-ChildItem -Filter *.mp4

# Loop through each .mp4 file and apply the ownership and permissions changes
foreach ($file in $mp4Files) {
    # Take ownership
    takeown /f $file.FullName

    icacls $file.FullName /grant "*S-1-5-11:(R)"
}
