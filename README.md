# Curso de R

Material del curso. Gratis y asincrónico: los módulos quedan publicados y los hacés cuando puedas.

Para quien ya sabe estadística y nunca programó.

## Dos formas de usarlo

### En el navegador, sin instalar nada

Entrá al [proyecto del curso en Posit Cloud](https://posit.cloud/content/13181088) y apretá
**Save a Permanent Copy**. Te queda una copia tuya con todo esto cargado y los paquetes ya
instalados.

Es la forma recomendada para empezar.

### En tu computadora

Necesitás R y RStudio instalados. Está explicado en `guia-instalacion.pdf`, con la lista
de qué suele fallar y cómo se arregla.

Con eso listo, abrí RStudio y pegá estas dos líneas en la consola:

```r
install.packages("usethis")
usethis::use_course("EMBS-ITBA/curso-r")
```

Baja todo, lo descomprime en tu escritorio y lo abre. No hace falta saber git ni tener
cuenta de GitHub.

Después, una vez:

```r
source("instalar-paquetes.R")
```

## Qué hay acá

| Archivo | Qué es |
|---|---|
| `clase-01-ejercicios.qmd` y siguientes | Los ejercicios de cada clase |
| `resueltas/` | Cada clase resuelta y explicada |
| `tp-integrador.qmd` | El trabajo integrador del final del curso |
| `datos/` | Los archivos que usan los ejercicios |
| `chequear.R` y `chequear-tp.R` | Lo que corrige tus respuestas. No hace falta abrirlos |
| `actualizar.R` | Para traer la versión más nueva de una clase |
| `guia-instalacion.pdf` | Instalar R, y qué hacer cuando falla |
| `instalar-paquetes.R` | Instala todo lo que el curso necesita |

## Cómo se usan los cuadernos

Cada ejercicio tiene dos bloques de código.

En el primero escribís tu respuesta. En el segundo no tocás nada: lo corrés y te dice si
te dio bien.

```
[x] Correcto
```

o, si algo no cierra:

```
[ ] 'peso_medio' tiene NA. Fijate si falta na.rm = TRUE.
```

## La carpeta `resueltas/`

Ahí está la explicación de cada ejercicio: por qué esa función y no otra, qué supuesto
estás haciendo sin darte cuenta, y en varios casos el gráfico que lo muestra. Es la parte
que no entra en el video.

Los números te los da el bloque de verificación, así que lo que vale de esta carpeta es
el porqué.

Intentá el ejercicio primero. Pero si te trabaste, abrila sin culpa: el cuaderno no te
pone nota, y quedarse trabado no sirve para nada.

## Traer la versión más nueva de una clase

Cuando copiás el proyecto te llevás una foto de ese momento. Si después se corrige algo, o
si todavía no empezaste una clase y mientras tanto cambió, no te enterás solo.

Para traer lo último:

```r
source("actualizar.R")

bajar_clase(3)       # los ejercicios de la clase 3
bajar_resuelta(3)    # la clase 3 resuelta y explicada
```

Si ya habías escrito en ese archivo, guarda una copia tuya antes de reemplazarlo. No vas a
perder trabajo.

Conviene correrlo cuando arrancás una clase que todavía no tocaste.

## El trabajo integrador

Es un ensayo clínico simulado para analizar de punta a punta, con lo de las seis clases.
Junto con las ejercitaciones, es lo que se entrega para el certificado.

Si copiaste el proyecto antes de que estuviera, traelo con esto en la consola:

```r
source("actualizar.R")
traer("tp-integrador.qmd")
traer("chequear-tp.R")
traer("datos/ensayo-tp.csv")
```

## Si algo se rompe

El primer bloque de cada cuaderno carga los paquetes. Si lo salteaste, todo lo demás
falla con `could not find function`. Corrélo y volvé a intentar.

Para empezar de cero: en RStudio, menú Session, Restart R.
