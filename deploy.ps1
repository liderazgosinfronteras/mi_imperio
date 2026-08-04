param(
    [string]$Token = $env:NETLIFY_AUTH_TOKEN
)

if (-not $Token) {
    Write-Error "No se encontró NETLIFY_AUTH_TOKEN. Asegúrate de tener la variable de entorno configurada."
    exit 1
}

Write-Host "Desplegando Mi Imperio a Netlify..." -ForegroundColor Cyan
netlify deploy --dir="D:\FINANZAS_LSF\build\web" --prod --auth $Token

if ($LASTEXITCODE -eq 0) {
    Write-Host "Deploy exitoso!" -ForegroundColor Green
} else {
    Write-Host "El deploy falló. Intentando con zip..." -ForegroundColor Yellow

    $zipPath = "C:\Users\ASUS\AppData\Local\Temp\mi_imperio_web.zip"

    if (-not (Test-Path $zipPath)) {
        Write-Host "Creando zip de build/web..." -ForegroundColor Yellow
        Compress-Archive -Path "D:\FINANZAS_LSF\build\web\*" -DestinationPath $zipPath -Force
    }

    Write-Host "Subiendo zip a Netlify API..." -ForegroundColor Yellow
    $headers = @{
        "Authorization" = "Bearer $Token"
        "Content-Type"  = "application/zip"
    }

    $zipBytes = [System.IO.File]::ReadAllBytes($zipPath)
    $response = Invoke-RestMethod -Uri "https://api.netlify.com/api/v1/deploys" `
        -Method POST `
        -Headers $headers `
        -Body $zipBytes

    Write-Host "Deploy ID: $($response.id)" -ForegroundColor Green
    Write-Host "URL del sitio: $($response.url)" -ForegroundColor Green
    Write-Host "SSL URL: $($response.ssl_url)" -ForegroundColor Cyan
}
