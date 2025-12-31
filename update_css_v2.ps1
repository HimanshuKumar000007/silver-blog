$file = "d:\silver-site-mission-millionaire\index.html"
$content = Get-Content $file -Raw

# Target 1: Price Card
$target1 = @"
        .price-card-hero {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: var(--radius-lg);
            min-width: 380px;
            max-width: 400px;
            box-shadow: var(--shadow-glow);
        }
"@

$replacement1 = @"
        .price-card-hero {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: var(--radius-lg);
            width: 100%;
            max-width: 400px;
            box-shadow: var(--shadow-glow);
            box-sizing: border-box;
        }
"@

# Target 2: Body
$target2 = @"
        body {
            font-family: var(--font-main);
            background-color: var(--bg-body);
            color: var(--text-main);
            line-height: 1.6;
            -webkit-font-smoothing: antialiased;
            overflow-x: hidden;
        }
"@

$replacement2 = @"
        html, body {
            width: 100%;
            overflow-x: hidden;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: var(--font-main);
            background-color: var(--bg-body);
            color: var(--text-main);
            line-height: 1.6;
            -webkit-font-smoothing: antialiased;
        }
"@

$newContent = $content.Replace($target1, $replacement1).Replace($target2, $replacement2)

if ($newContent -eq $content) {
    Write-Host "One or more targets not found!"
    # Check which one failed
    if ($content.IndexOf($target1) -eq -1) { Write-Host "Target 1 (Price Card) not found." }
    if ($content.IndexOf($target2) -eq -1) { Write-Host "Target 2 (Body) not found." }
    exit 1
}

$newContent | Set-Content $file -Encoding UTF8
Write-Host "Successfully updated file."
