$items = Get-ChildItem

# Loop through each file or folder and apply the ownership and permissions changes
foreach ($item in $items) {
    # Take ownership
    takeown /f $item.FullName

    icacls $item.FullName /grant "*S-1-5-11:(R)"
}
