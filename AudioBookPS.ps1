$topUrl = Read-Host "Enter the Find Audiobooks Online page's URL [ENTER]"
$hrefRaw = (Invoke-WebRequest -Uri "$topUrl").Links.Href

$folderName = ($topUrl -split "/")[-2]
New-item -path ./$folderName -itemtype Directory
Set-Location $folderName 
$hrefRaw | ForEach-Object {
    if ($_ -like "*https://ipaudio*") {

        $url = "$_"
        $outpath = $url.Split('/')[-1]
        write-host "$outpath"
        Invoke-WebRequest -Uri $url -OutFile $outpath
    }
}