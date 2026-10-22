# Trae la versión actual de una clase desde el repositorio del curso.
#
#   bajar_clase(3)      los ejercicios de la clase 3
#   bajar_resuelta(3)   la clase 3 resuelta y explicada
#   traer("archivo")    cualquier otro archivo del curso, con su ruta
#
# Para qué sirve: cuando copiaste este proyecto te llevaste una foto de ese momento. Si
# después se corrige algo, o si todavía no empezaste una clase y mientras tanto cambió,
# esto te trae lo último sin que tengas que copiar el proyecto de nuevo.
#
# Si ya habías escrito en el archivo, se guarda una copia antes de reemplazarlo. No vas a
# perder trabajo.

REPO <- "https://raw.githubusercontent.com/EMBS-ITBA/curso-r/main/"

traer <- function(archivo) {
  # Solo se respaldan los cuadernos, que es donde el alumno escribe. Un .R o un .csv del
  # curso se reemplaza directo.
  if (file.exists(archivo) && grepl("[.]qmd$", archivo)) {
    # El nombre lleva la hora porque alguien puede actualizar dos veces el mismo día.
    copia <- sub("[.]qmd$", paste0("-tuyo-", format(Sys.time(), "%d%m-%H%M"), ".qmd"), archivo)
    file.copy(archivo, copia, overwrite = TRUE)
    message("Tu versión quedó guardada como ", basename(copia))
  }
  dir.create(dirname(archivo), showWarnings = FALSE, recursive = TRUE)
  descarga <- try(
    utils::download.file(paste0(REPO, archivo), archivo, quiet = TRUE, mode = "wb"),
    silent = TRUE
  )
  if (inherits(descarga, "try-error")) {
    message("No se pudo descargar. Fijate si tenés internet y volvé a intentar.")
    return(invisible(FALSE))
  }
  message("Listo: ", archivo)
  invisible(TRUE)
}

bajar_clase <- function(n) {
  traer(sprintf("clase-%02d-ejercicios.qmd", n))
}

bajar_resuelta <- function(n) {
  traer(sprintf("resueltas/clase-%02d-resuelta.qmd", n))
}
