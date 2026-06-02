import provincias.*

class ProfesionalVinculado {
    const property universidad
 
    method honorariosPorHora() = universidad.honorariosRecomendados()
    method provincias() = [universidad.provincia()]
}

class ProfesionalDelLitoral {
    const provincias = [entreRios, santaFe, corrientes]
    const property universidad

    method honorariosPorHora() = 3000
    method provincias() = provincias
}

class ProfesionalLibre {
    const property honorariosPorHora
    const property universidad
    const property provincias

    method agregarProvincias(provincia) {
        provincias.addAll(provincia)
    }
}

class Universidad {
    const property provincia
    const property honorariosRecomendados
}