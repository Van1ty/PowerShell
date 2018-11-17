function Get-MailForward {
[cmdletbinding()]
    param (
        [parameter(
            Mandatory=$true,
            Position=0,
            ValueFromPipeline=$true
        )]
        [string]$UserPrincipalName
    )
try {
    $MailboxForward = Get-Mailbox | Where-Object {$_.forwardingsmtpaddress -eq ("smtp:"+"$UserPrincipalName") -or ($_.forwardingaddress -eq ($UserPrincipalName.split("@")[0]))}
    $MailboxForwardCount = $MailboxForward | measure-object
    
    if ($MailboxForward) {
        Write-host "Number of forwarding rules going to $($Userprincipalname): $($MailboxForwardCount.count) " 
        foreach ($Forward in $MailboxForward) {
            if ($Forward) {
                Write-host "$($Forward.name)"
            }
        }
    }
    else {
        Write-host "There are no mailboxes forwarding to this address"
    }
}
catch {
    Write-Error -ErrorRecord $PSitem -ErrorAction Stop
}
}
Get-MailForward