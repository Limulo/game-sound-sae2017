---
layout: default
---

linear music (shuffling) 37:00 / radio GTAV - ducking, changing mix, djishing thing, cross fade - interactive composition
markers, timing (iMuse style of stuff)


## Interesting link

* [Music Theory Dog](http://www.tobyrush.com/theorypages/)


---

### dall'edizione precedente:

non linearità

* variazione del tempo (space invaders + mario alla fine di ogni livello)
* variable pitch ( a che vedere con le limitazioni tecniche della memoria)
* variabile rhythm/meter (esempio fraseggiatore o Zen games)
* volume and dynamic
* variable DSP (reverb and distorsion)
* variable melody
* variable harmony
variable mix (sostituzione di strumenti o di layers)

_vedi Roads_

Concetti di [musica generativa](https://en.wikipedia.org/wiki/Generative_music), esempio sono _Music for Airports_, _Discreet Music_ etc...
architetto e compositore vs gardener (intervento di [Brian Eno](https://vimeo.com/55969912))

Individuazione dei metodi formali, delle regole nella composizione della musica: Guido D'Arezzo (1026), Mozart, etc...
Composizione automatica
contollo delle sequenze --> musica algoritmica (Xenakis, Koenig, Truax)

processi stocastici
    + tabelle della probabilità
    + distribuzione di probabilità
    + catene markoviane

---

## Catene Markoviane

(Andrey Markov 1856 - 1922) è il nome che viene assegnato ad una macchina a stati statistica discreta nella quale lo stat osuccessivo è determinato da una matrice dei pesi di probabilità assocaiti ai passaggi tra stati diversi all'interno di una sequenza.

Dati statistici possono essere estratti da una musica data per ottenere poi una nuova composizione generata nello stile esaminato.

citando Farnell:
> For example, a Markov machine can quickly be trained to under stand 12 bar blues and notice that more often than not a F7 follows a C and that a where a
chord has a major 3rd the melody will use a flattened one. This is interesting when data from more than one composer is interpolated to see what Handel, Jean Michel Jarre and Jimi Hendrix might have written together.

### Case Study: Zen Game

esempio [Zen Games](http://www.limulo.net/games/ZenGame/)
Le note sono prese a prestito dalla scala pentatonica maggiore di C
set di regole:
* durata nel tempo
* durata della frase che condiziona il verificarsi di una pausa e la durata della stessa
* probabilità di scegliere una nota all'interno dell'accordo
* probabilità di scegliere una nota successiva che si trovi nelle vicinanze di quella appena cantata
* probabilità che la nota da cnatare sia acuta piuttosto che grave

## Artificial Intelligence

memoria ritenuta diventa conoscenza

conoscenza + processo.

### AI adattiva

### Sistemi esperti

per semplificare all'estremo si può dire che i sistemi esperti sono quelli che possiedono un libr od iregole (l'armonia jazz, il rock, etc...) dal quale possono attingere per operare delle decisioni. Ma questa conoscenza non è fissa. Quello che definisce i sistemi esperti come AI è il fatto che questi possono correggere la loror conoscenza.

### Neural Networks

### Cellular Automata

Gli automi cellulari sono una collezione di programmi molto piccoli che vivono in un ambiente circoscritto e interagiscono tra loro. Ognuno è una macchina a stati che evolve su base di una matrice di regole e anche dell'input esterno.

Una **intelligenza emergente** si ottiene dalla rispettive interazioni e dal modo in cui gli output di alcuni diventa input per altri.

Esempio game of life in Processing

### Algoritmi genetici

Condisioni ambientali possono far prosperare o uccidere le nuove generazioni le quali portano con sè, talvolta mutato, il patrimonio genetico dei genitori.

---

Frattali (auto similarità) - 1/f rumore frazionale
Chaos generator
Grammatiche
Pattern matching / search tecniques
    Constraints
