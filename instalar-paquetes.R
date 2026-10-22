# Instala todo lo que el curso necesita. Se corre UNA VEZ y después te olvidás.
#
# Si entraste por el navegador y copiaste el proyecto del curso, ya está hecho: no hace
# falta que corras esto.
#
# Tarda varios minutos y escribe muchísimo texto en la consola. Es normal, dejalo andar.
# Si te pregunta si querés compilar algún paquete desde el código fuente, contestá "no".

paquetes <- c(
  # Clases 1 a 3
  "palmerpenguins", "dplyr", "tidyr", "ggplot2", "readr", "readxl",
  "tibble", "stringr", "forcats", "lubridate", "janitor", "gtsummary", "scales",
  # Clases 4 a 6
  "broom", "survival", "survminer", "epitools", "pwr", "consort",
  # Para convertir los cuadernos a HTML o PDF
  "knitr", "rmarkdown"
)

install.packages(paquetes, dependencies = TRUE)

# Si RStudio te muestra un cartel arriba del editor diciendo que falta el paquete tinytex,
# cerralo. Es para exportar a PDF y el entorno del curso ya trae LaTeX instalado, así que
# instalarlo sería poner una segunda copia encima de la que ya está.

# Comprobación final. Si algo falló, el nombre aparece acá y no entre las mil líneas de
# salida del instalador.
faltan <- paquetes[!vapply(paquetes, requireNamespace, logical(1), quietly = TRUE)]
if (length(faltan)) {
  cat("\nFALTAN:", paste(faltan, collapse = ", "), "\n")
  cat("Volvé a correr el script. Si sigue fallando, copiá este mensaje y preguntá.\n")
} else {
  cat("\nListo. Los", length(paquetes), "paquetes quedaron instalados.\n")
}
cat("LaTeX para exportar a PDF:", nzchar(Sys.which("pdflatex")), "\n")
