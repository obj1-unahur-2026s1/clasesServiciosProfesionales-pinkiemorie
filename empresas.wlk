class Empresa {
    const profesionales = []
    const clientes = []
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
        return profesionales.any({p => self.profesionalSatisfaceASolicitante(p, solicitante)})
    }

    method profesionalSatisfaceASolicitante(profesional, solicitante) {
        return solicitante.puedeSerAtendidoPor(profesional)
    }

    method darServicio(solicitante) {
        if (self.puedeSatisfacerASolicitante(solicitante)) {
            self.profesionalDaServicioASolicitante(self.profesionalQuePuedeSatisfacerASolicitante(solicitante))
            clientes.add(solicitante)
        }
    }

    method profesionalDaServicioASolicitante(profesional) {
        profesional.cobrar(profesional.honorariosPorHora())
    }

    method profesionalQuePuedeSatisfacerASolicitante(solicitante) {
        return profesionales.find({p => self.profesionalSatisfaceASolicitante(p, solicitante)})
    }

    method cantClientes() {
        return clientes.size()
    }

    method esCliente(solicitante) {
        return clientes.contains(solicitante)
    }
}