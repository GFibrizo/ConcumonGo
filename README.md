# ConcumonGo
Trabajo práctico para la materia Técnicas de Programación Concurrente I de la Facultad de Ingeniería de la UBA.


## Requisitos

- Haskell
- Stack (pasos para instalar en [https://docs.haskellstack.org/en/stable/README/](https://docs.haskellstack.org/en/stable/README/)
- cabal (`sudo apt-get install cabal-install` seguido de `cabal update`)

## Buildear

Dentro de la carpeta my-proyect

- Ejecutar 
```
stack build
```

- En caso de que el build termine con error por falta de alguna libreria, ejecutar
```
cabal install nombre-del-paquete
```

## Correr

Ejecutar
```
stack exec my-proyect-exe
```