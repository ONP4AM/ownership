# Define a function for recursive ownership and permissions change
function Set-OwnershipAndPermissions {
    param (
        [string]$path,
        [string]$targetUser
    )

    # Take ownership of the directory
    takeown /f $path

    # Grant permissions to the specified user/group
    icacls $path /grant "*$targetUser:(R)"

    # Get all items (files and subdirectories) within the directory
    $items = Get-ChildItem -Path $path

    # Loop through each item
    foreach ($item in $items) {
        # If it's a directory, call the function recursively
        if ($item.PSIsContainer) {
            Set-OwnershipAndPermissions -path $item.FullName -targetUser $targetUser
        }
    }
}

# Specify the target user or group
$targetUser = "DOMAIN\Username"

# Call the function to start the recursive process
Set-OwnershipAndPermissions -path . -targetUser $targetUser
