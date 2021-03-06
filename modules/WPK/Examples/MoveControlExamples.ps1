New-Canvas -Width 640 -Height 480 { 
    10..(Get-Random -Minimum 20 -Maximum 50) | ForEach-Object { 
        New-Button "Click Me" `
            -Opacity ((Get-Random -Minimum 75 -Maximum 100) / 100) `
            -Top (Get-Random -Maximum 320) `
            -Left (Get-Random -Maximum 240) `
            -Width (Get-Random -Maximum 320) `
            -Height (Get-Random -Maximum 240) `
            -On_Click {
                $fadeOut = $true, $false | Get-Random
                $this | 
                    Move-Control -fadeOut:$fadeOut `
                        -Height (Get-Random -Maximum 640) `
                        -Width (Get-Random -Maximum 640) `
                        -Left (Get-Random -Maximum 320) `
                        -Top (Get-Random -Maximum 240) `
                        -duration ([TimeSpan]::FromMilliseconds((Get-Random -Maximum 1000)))
            }
    }
} -AsJob
