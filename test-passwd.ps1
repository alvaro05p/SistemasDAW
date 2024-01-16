function testpasswd {
    
    


    $pass = Read-Host Introduce una contraseña
    $buena = 1

    $contieneNumero = $pass -match '\d'
    $contieneSimbolo = $pass -match '\W'
    $contieneMayuscula = $pass -cmatch '[A-Z]'
    $contieneMinuscula = $pass -cmatch '[a-z]'

    if ($pass.Length -lt 8 ){

        Write-Host "Minimo 8 carácteres"
        $buena = 0

    }

    if (-not $contieneSimbolo){

        Write-Host "Debe contener algun simbolo como: $ % & / "
        $buena=0

    }

    if (-not $contieneMayuscula -or $contineMinuscula){

        Write-Host "Debe contener almenos una mayuscula"
        $buena = 0

    }

    if (-not $contieneNumero){

        Write-Host "Debe contener almenos un numero"
        $buena = 0

    }

    if ($buena -eq 1){

        Write-Host "La contraseña es correcta"

    }
}