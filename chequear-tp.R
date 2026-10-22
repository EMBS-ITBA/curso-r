# Verifica el trabajo integrador. Se carga al principio del cuaderno y no hace falta
# abrirlo.
#
# Va aparte de chequear.R por una razon practica: el que copio el proyecto antes de que
# existiera el TP tiene una version vieja de chequear.R, y este archivo le llega nuevo,
# sin pisar nada.
#
# Los valores esperados estan guardados como huellas (hashes) y no como numeros, para que
# la respuesta no quede escrita en el cuaderno. Igual que chequear.R, nunca llama a
# stop(): un error cortaria el render justo cuando el alumno se equivoco.

marcar <- function(ok, mensaje) {
  cat(if (ok) "[x] " else "[ ] ", mensaje, "\n", sep = "")
  invisible(ok)
}

# Se redondea antes de calcular la huella, asi da lo mismo si el alumno redondeo o no, y
# las diferencias de punto flotante entre computadoras no cambian el resultado.
huella <- function(x, digitos) {
  rlang::hash(round(as.numeric(x), digitos))
}

traer_objeto <- function(nombre) {
  if (!exists(nombre, envir = globalenv())) return(NULL)
  get(nombre, envir = globalenv())
}

chequear_tp <- function(nombre, esperado, digitos) {
  x <- traer_objeto(nombre)
  if (is.null(x)) {
    return(marcar(FALSE, paste0("Todavia no definiste '", nombre, "'.")))
  }
  if (!is.numeric(x)) {
    return(marcar(FALSE, sprintf("'%s' tiene que ser un numero, y es %s.", nombre, class(x)[1])))
  }
  if (length(x) != 1) {
    return(marcar(FALSE, sprintf("'%s' tiene %d elementos, y tiene que ser uno solo.",
                                 nombre, length(x))))
  }
  if (is.na(x)) {
    return(marcar(FALSE, sprintf("'%s' es NA. Fijate si falta na.rm = TRUE.", nombre)))
  }
  if (huella(x, digitos) != esperado) {
    return(marcar(FALSE, sprintf("'%s' no da el valor esperado.", nombre)))
  }
  marcar(TRUE, "Correcto")
}

chequear_objeto <- function(nombre, clase, que_es) {
  x <- traer_objeto(nombre)
  if (is.null(x)) {
    return(marcar(FALSE, paste0("Todavia no definiste '", nombre, "'.")))
  }
  if (!inherits(x, clase)) {
    return(marcar(FALSE, sprintf("'%s' existe pero no es %s. Fijate si lo guardaste con <-.",
                                 nombre, que_es)))
  }
  marcar(TRUE, "Correcto")
}

chequear_respuesta <- function(nombre, minimo = 25) {
  x <- traer_objeto(nombre)
  if (is.null(x)) {
    return(marcar(FALSE, paste0("Todavia no respondiste '", nombre, "'.")))
  }
  if (!is.character(x) || length(x) != 1) {
    return(marcar(FALSE, sprintf("'%s' tiene que ser un texto entre comillas.", nombre)))
  }
  palabras <- length(strsplit(trimws(x), "\\s+")[[1]])
  if (palabras < minimo) {
    return(marcar(FALSE, sprintf("'%s' tiene %d palabras y el minimo es %d. Desarrollala un poco mas.",
                                 nombre, palabras, minimo)))
  }
  # La huella sirve para encontrar respuestas copiadas entre entregas sin tener que
  # leerlas todas. Solo letras y numeros sin tilde, asi da igual en Windows y en Linux.
  normal <- gsub("[^a-z0-9]", "", tolower(x))
  marcar(TRUE, sprintf("Respondida (%d palabras, huella %s)", palabras,
                       substr(rlang::hash(normal), 1, 8)))
}

chequear_mail <- function() {
  x <- traer_objeto("mi_mail")
  if (is.null(x)) {
    return(marcar(FALSE, "Todavia no definiste 'mi_mail'."))
  }
  valido <- is.character(x) && length(x) == 1 &&
    grepl("^[^@[:space:]]+@[^@[:space:]]+\\.[^@[:space:]]+$", x) &&
    x != "tu.mail@ejemplo.com"
  if (!valido) {
    return(marcar(FALSE, "'mi_mail' tiene que ser el mail con el que te anotaste, entre comillas."))
  }
  marcar(TRUE, paste("Entrega de", tolower(trimws(x))))
}
