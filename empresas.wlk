class Empresa {
    const profesionales = []
    const property honorarioReferencia

    method contratarA(profesional) {
        profesionales.add(profesional)
    }

    method contratarAVarios(profesional) {
        profesionales.addAll(profesional)
    }

    method despedirA(profesional) {
        profesionales.remove(profesional)
    }

    method despedirATodos() {
        profesionales.removeAll()
    }

    method cantProfesionalesDeUniversidad(universidad) {
        return self.profesionalesDeUniversidad(universidad).size()
    } 

    method profesionalesDeUniversidad(universidad) {
        return profesionales.filter({p => p.universidad() == universidad})
    }

    method profesionalesCaros() {
        return profesionales.filter({ p => p.honorariosPorHora() > self.honorarioReferencia()})
    }

    method universidadesFormadoras() {
        return profesionales.map({p => p.universidad()}).asSet()
    }

    method profesionalMasBarato() {
        return profesionales.min({p => p.honorariosPorHora()})
    }

    method esDeGenteAcotada() {
        return not profesionales.all({p => p.provincias().size() >= 3})
    }

    method puedeSatisfacerASolicitante(solicitante) {
        return profesionales.any({p => solicitante.puedeSerAtendidoPor(p)})
    }
}