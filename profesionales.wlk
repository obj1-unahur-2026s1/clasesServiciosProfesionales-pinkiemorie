import provincias.*

class ProfesionalVinculado {
    const property universidad
 
    method honorariosPorHora() = universidad.honorariosRecomendados()
    method provincias() = [universidad.provincia()]

    method cobrar(cantDinero) {
        universidad.recibirDonaciones(cantDinero / 2)
    }
}

class ProfesionalDelLitoral {
    const provincias = [entreRios, santaFe, corrientes]
    const property universidad

    method honorariosPorHora() = 3000
    method provincias() = provincias

    method cobrar(cantDinero) {
        asociacionProfesionalesDelLitoral.recibirDonaciones(cantDinero)
    }
}

class ProfesionalLibre {
    const property honorariosPorHora
    const property universidad
    const property provincias
    var cantRecaudado = 0

    method agregarProvincias(provincia) {
        provincias.addAll(provincia)
    }

    method cobrar(cantDinero) {
        cantRecaudado += cantDinero
    }

    method pasarDinero(profesional, cantAPasar) {
        cantRecaudado -= cantAPasar
        profesional.cobrar(cantAPasar)
    }
}

class Universidad {
    const property provincia
    const property honorariosRecomendados
    var donaciones = 0

    method recibirDonaciones(donacion) {
        donaciones += donacion
    }
}

object asociacionProfesionalesDelLitoral {
    var totalRecaudado = 0

    method recibirDonaciones(donacion) {
        totalRecaudado += donacion
    }
}