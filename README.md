# Linux Assembly Lab

**Aïmane Ramzi · Apprentissage des systèmes et de l'assembleur x86-64**

Des exercices courts pour comprendre ce qui se passe entre un programme et le
noyau Linux : registres, appels système, mémoire et débogage.

## Exercices

| Programme | Objectif | Résultat attendu |
| --- | --- | --- |
| `hello.asm` | Appeler `write` puis `exit` | `Hello, world!` |
| `exit2.asm` | Distinguer sortie texte et code de retour | Code de retour 2 |
| `uppercase.asm` | Parcourir des octets et modifier uniquement a-z | Texte original puis majuscules |
| `heap.asm` | Demander une extension du tas avec `brk` | `HEAP OK` ou échec contrôlé |
| `fibonacci.c` | Observer une récursion avec GDB | Les dix premiers termes à partir de 0 |

## Exécuter sur Linux x86-64

Prérequis : NASM, GNU binutils, GCC, Make et Python 3. Les exécutables ELF ne
s'exécutent pas nativement sous macOS. Utiliser une VM Linux x86-64 ou la CI.

```sh
make
make test
make clean
```

Les tests assemblent et exécutent uniquement ces programmes locaux. Aucun accès
réseau, lancement de shell distant, modification d'exécutable tiers ou mécanisme
d'infection n'est inclus.

## Documentation

- [Ce que j'étudie et comment le vérifier](docs/learning-notes.md)
- [Provenance et limites](docs/provenance.md)

Ce dépôt est une sélection retravaillée d'exercices personnels d'apprentissage.
Il ne remplace pas un cours ni un allocateur de production. Des tests automatiques
vérifient les sorties attendues, pas la maîtrise individuelle de tous les sujets.

Pas de support de cours, corrigé tiers, archive OST2 ou binaire fourni par un
enseignant. Aucune licence de réutilisation n'est accordée à ce stade.

