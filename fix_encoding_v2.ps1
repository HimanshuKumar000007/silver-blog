$files = @("d:\silver-site-mission-millionaire\1.html", "d:\silver-site-mission-millionaire\index.html")

foreach ($file in $files) {
    if (Test-Path $file) {
        $content = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)
        
        # 1. Fix Menu Icon (â˜° -> ☰)
        # â (\u00e2) + ˜ (\u02dc) + ° (\u00b0)
        $content = $content.Replace([String][char]0x00e2 + [String][char]0x02dc + [String][char]0x00b0, [String][char]0x2630)

        # 2. Fix Bullet Point (â— -> ●)
        # â (\u00e2) + — (\u2014)
        # Note: 0x97 in CP1252 is Em Dash (\u2014). 
        # We also handle the case where it might be followed by a 'missing' character or space
        if ($content.Contains([String][char]0x00e2 + [String][char]0x2014)) {
             $content = $content.Replace([String][char]0x00e2 + [String][char]0x2014, [String][char]0x25cf)
        }
        # Also try just the literal string if the unicode escape logic is slightly off for the file content
        $content = $content.Replace("â˜°", "☰")
        $content = $content.Replace("â—", "●")

        # 3. Fix Middle Dot (Â· -> ·)
        # Â (\u00c2) + · (\u00b7)
        $content = $content.Replace([String][char]0x00c2 + [String][char]0x00b7, [String][char]0x00b7)
        $content = $content.Replace("Â·", "·")

        [System.IO.File]::WriteAllText($file, $content, [System.Text.Encoding]::UTF8)
        Write-Host "Processed $file"
    }
}
