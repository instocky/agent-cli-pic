param(
    [string]$Dir = ".",
    [ValidateSet("jpeg", "png")]
    [string]$Format = "jpeg"
)

Add-Type -AssemblyName System.Windows.Forms,System.Drawing

$data = [Windows.Forms.Clipboard]::GetDataObject()

if (!$data.GetDataPresent([Windows.Forms.DataFormats]::Bitmap)) {
    Write-Error "No bitmap in clipboard"
    exit 1
}

$img = $data.GetData([Windows.Forms.DataFormats]::Bitmap)

$timestamp = Get-Date -Format "yyMMddHHmmss"
$extension = if ($Format -eq "jpeg") { "jpg" } else { "png" }
$file = Join-Path $Dir "clipboard_$timestamp.$extension"

try {
    $imageFormat = if ($Format -eq "jpeg") {
        [Drawing.Imaging.ImageFormat]::Jpeg
    } else {
        [Drawing.Imaging.ImageFormat]::Png
    }

    $img.Save($file, $imageFormat)
    Write-Host $file
}
finally {
    $img.Dispose()
}