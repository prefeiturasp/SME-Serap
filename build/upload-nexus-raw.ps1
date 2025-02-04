[CmdletBinding()]
Param(
    [string]$NexusUrl,    
    [string]$User,
    [string]$Password,
    [string]$ProjectRepository
)

$pair = "$($user):$($password)";
$encodedCreds = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($pair));
$basicAuthValue = "Basic $encodedCreds"

$Headers = @{
    Authorization = $basicAuthValue
}

$fileToUpload = (ls .\output\*zip)
$uploadUrl="$nexusUrl/repository/$projectRepository/$($fileToUpload.Name)"

Write-Output "`r`n`r`n========================================"
Write-Output "Upload Nexus"
Write-Output "========================================"

$retryCount = 0
$success = $false


try{
    Invoke-RestMethod -UseBasicParsing -Uri $uploadUrl -Headers $Headers -Method Put -InFile $fileToUpload.FullName -TimeoutSec ([int]::MaxValue) -Verbose
}
catch {
  
    throw
}


Write-Output "File: $uploadUrl"
