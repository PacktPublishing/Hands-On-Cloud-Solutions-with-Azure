Connect-MsolService
$applicationId = "App ID from app you are needing to elevate permission"
$sp = Get-MsolServicePrincipal -AppPrincipalId $applicationId
# Directory Read
Add-MsolRoleMember -RoleObjectId 88d8e3e3-8f55-4a1e-953a-9b9898b8876b -RoleMemberObjectId $sp.ObjectId -RoleMemberType servicePrincipal
# Directory Write
Add-MsolRoleMember -RoleObjectId 9360feb5-f418-4baa-8175-e2a00bac4301 -RoleMemberObjectId $sp.ObjectId -RoleMemberType servicePrincipal
# User Account Admin – for deletes
Add-MsolRoleMember -RoleObjectId fe930be7-5e62-47db-91af-98c3a49a38b1 -RoleMemberObjectId $sp.ObjectId -RoleMemberType servicePrincipal
