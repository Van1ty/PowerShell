function Get-MailForward {
    param (
        [parameter(Mandatory=$true)]
        [string]$UserName
    )
}
    try {
    Get-Mailbox | Where-Object {$_.forwardingsmtpaddress -eq ("smtp:"+"$UserName") -or ($_.forwardingaddress -eq ($UserName.split("@")[0]))}
}
catch {
    Write-Error -ErrorRecord $PSitem -ErrorAction Stop
}
