function Get-MailForward {
    param (
        [parameter(Mandatory=$true)]
        [string]$UserPrincipalName
    )
}
    try {
    Get-Mailbox | Where-Object {$_.forwardingsmtpaddress -eq ("smtp:"+"$UserPrincipalName") -or ($_.forwardingaddress -eq ($UserPrincipalName.split("@")[0]))}
}
catch {
    Write-Error -ErrorRecord $PSitem -ErrorAction Stop
}
