# Notes de travail

## Appel système et appel de fonction

Dans ces exercices Linux x86-64, `rax` contient le numéro de l'appel système.
Les premiers arguments passent par `rdi`, `rsi` et `rdx`. L'instruction `syscall`
entre dans le noyau et modifie notamment `rcx` et `r11` : une boucle qui utilise
ces registres doit en tenir compte. Ne pas confondre cette convention avec
l'ensemble des règles d'appel de fonctions de l'ABI System V.

## Manipulation de texte

Le programme `uppercase` transforme seulement les octets ASCII a-z. Les chiffres
et la ponctuation sont inchangés. Ce n'est pas une conversion Unicode : les
accents et les alphabets non ASCII demandent une autre approche.

## Mémoire

`heap` est une démonstration d'extension du tas, pas un allocateur complet. Il
contrôle le résultat de `brk` avant d'écrire, mais n'implémente ni libération,
ni métadonnées de blocs, ni accès concurrents. Ces limites sont importantes
avant de présenter le programme comme réutilisable.

## Déboguer un exemple inoffensif

```sh
gdb build/fibonacci
```

Dans GDB : `break fibonacci`, `run`, `info args`, `bt`, `disassemble`.
Observer les appels récursifs, les arguments et la pile. L'algorithme choisi
est volontairement simple et inefficace pour de grandes entrées.

## Prolongements défensifs

Pour aborder le format ELF, étudier les en-têtes et les permissions d'un binaire
de test avec `readelf -h` et `readelf -l`, sans le modifier. L'absence d'une chaîne
lisible, d'un import ou d'une signature connue ne prouve pas qu'un programme est
indétectable. Ce dépôt ne publie aucun outil d'infection ou de contournement.
