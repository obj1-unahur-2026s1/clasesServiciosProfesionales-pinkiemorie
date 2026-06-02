class Persona {
    const property provincia

    method puedeSerAtendidoPor(profesional) = profesional.provincias().contains(provincia)
}

class Institucion {
    const property universidadesReconocidas

    method puedeSerAtendidoPor(profesional) = universidadesReconocidas.contains(profesional.universidad())
}

class Club {
    const property provincias

    method puedeSerAtendidoPor(profesional) = provincias.any({p => profesional.provincias().contains(p)})
}