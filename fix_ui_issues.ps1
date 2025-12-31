$files = @("d:\silver-site-mission-millionaire\index.html", "d:\silver-site-mission-millionaire\1.html")

foreach ($file in $files) {
    if (Test-Path $file) {
        $content = Get-Content $file -Raw
        
        # 1. Fix Encoding
        # Replace corrupted menu icon
        $content = $content -replace 'â˜°', '☰'
        # Replace corrupted bullet point
        $content = $content -replace 'â—', '●'
        # Replace middle dot if corrupted (just in case)
        $content = $content -replace 'Â·', '·'

        # 2. Fix Ticker Height (CSS)
        # Change .ticker-wrap { height: 40px; ... } to 50px
        $content = $content -replace '\.ticker-wrap\s*\{\s*height:\s*40px;', '.ticker-wrap { height: 50px;'

        # 3. Fix Ticker Height (Inline HTML)
        # Change style="height: 40px; width: 100%;" to 50px
        $content = $content -replace 'style="height: 40px; width: 100%;"', 'style="height: 50px; width: 100%;"'

        $content | Set-Content $file -Encoding UTF8
        Write-Host "Updated $file"
    }
}
