while ($true) {
    Clear-Host

    Write-Host "Este es el menú de opciones:" -ForegroundColor Green
    Write-Host

    Write-Host "1. Listar los usuarios del sistema"
    Write-Host "2. Crear usuario"
    Write-Host "3. Cambiar contraseña de un usuario"
    Write-Host "4. Desactivar usuario"
    Write-Host "5. Borrar usuario"
    Write-Host "6. Listar los grupos de usuarios del sistema"
    Write-Host "7. Listar miembros de un grupo"
    Write-Host "8. Crear grupo"
    Write-Host "9. Borrar grupo"
    Write-Host "10. Añadir usuario a grupo"
    Write-Host "11. Borrar usuario de un grupo"
    Write-Host "12. Comprobar tu contraseña"
    Write-Host "13. Salir"
    Write-Host

    $opcion = Read-Host "Elige una opción"

    switch ($opcion) {
        1 { Get-LocalUser }
        2 {
            $nombre = Read-Host "Nombre de tu nuevo usuario"
            $pass = Read-Host "Contraseña" -AsSecureString
            New-LocalUser -Name $nombre -Password $pass
            Enable-LocalUser $nombre
            Add-LocalGroupMember -Group "Administradores" -Member $nombre
        }
        3 {
            $nombre = Read-Host "Usuario al que cambiar la contraseña"
            $nueva = Read-Host "Nueva contraseña para el usuario" -AsSecureString
            Set-LocalUser -Name $nombre -Password $nueva
        }
        4 {
            $borrar = Read-Host "Usuario que deseas desactivar"
            Disable-LocalUser -Name $borrar
        }
        5 {
            $usuario = Read-Host "Usuario a borrar"
            Remove-LocalUser -Name $usuario -Force
        }
        6 { Get-LocalGroup }
        7 {
            $grupo = Read-Host "Grupo que listar"
            Get-LocalGroupMember -Group $grupo
        }
        8 {
            $grupo = Read-Host "Grupo a crear"
            New-LocalGroup -Name $grupo
        }
        9 {
            $grupo = Read-Host "Grupo a borrar"
            Remove-LocalGroup -Name $grupo -Force
        }
        10 {
            $grupo = Read-Host "Nombre del grupo"
            $usuario = Read-Host "Usuario a asignar en el grupo"
            Add-LocalGroupMember -Group $grupo -Member $usuario
        }
        11 {
            $grupo = Read-Host "Nombre del grupo"
            $usuario = Read-Host "Usuario a asignar en el grupo"
            Remove-LocalGroupMember -Group $grupo -Member $usuario
        }
        12 {
            $pass = Read-Host "Introduce tu contraseña"
            testpasswd -password $pass
        }
        13 { exit }
        Default {}
    }

    Read-Host "Presiona Enter para continuar..."
}
