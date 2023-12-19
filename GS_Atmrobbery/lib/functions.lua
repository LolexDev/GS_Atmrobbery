function progressbar(message, time)
    lib.progressBar({
        duration = time,
        label = message,
        position = 'bottom',
        useWhileDead = false,
    })
end

function obavesti(naslov,deskripcija,type,pozicija,vreme)
    lib.notify({
        title = naslov,
        description = deskripcija,
        type = type,
        position = pozicija,
        duration = vreme,
    })
end