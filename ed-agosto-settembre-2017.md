---
layout: default
---

## Edizione Agosto/Settembre 2017

Back to [Home](index);

<!--
Scarica le <a href="./slides/Game Engines Game Sound Techniques maggio 2017.pdf" >slides</a> delle lezioni!
-->

TODO: Description

* Go to the [Part 1](#pt1);
* Go to the [Part 2](#pt2);
* Go to the [Part 3](#pt3);

---

<a id="pt1"></a>
## Pt1:
TODO

<a id="pt2"></a>
## Pt2:


### SID

Il SID (Sound Interface Device) era il chip sonoro utilizzato dal Vic20, C64 e C128, sviluppato da _Robert Yannes_ di _MOS technology_ il quale, oltre al background tecnico, ne sapeva molto anche di musica.

![sid](./images/ed-agosto-settembre-2017/pt2/sid.jpg){: width="60%"}

Il suo intento era sviluppare un chip di sintesi sottrattiva totalemente differente dai sistemi sonori presenti nei computer dell'epoca e il risultato fu qualcosa di innovativo.

Il chip era programmabile in BASIC o in linguaggio macchina e possedeva molte caratteristiche interessanti, le principali elencate qui di seguito:

* 3 generatori di suono (voci);
* 4 diverse forme d'onda disponibili (sawtooth, triangle, rectangle w/ pulse width modulation, noise);
* 3 modulatori d'ampiezza (adsr);
* 1 controllo di Master volume (in 16 steps);

Erano possibili **effetti** come la _ring modulation_ o l'[_hard sync_](https://en.wikipedia.org/wiki/Oscillator_sync#Hard_Sync) tra gli oscillatori.

Inoltre il SID disponeva di un **filtro programmabile** (low pass, bandpass, high pass), con frequenza di taglio e risonanza selezionabile. Il funzionamento del filtro era possibile grazie alla presenza di alcuni componenti analogici che completavano il circuito: 2 capacitori. Questa caratteristica rendeva il suono del SID unico e difficilmente replicabile fedelmente, anche al giorno d'oggi.

Ecco qui di seguito un piccolo programma d'esempio:

![sid screenshot](./images/ed-agosto-settembre-2017/pt2/sid-screenshot.jpg)

Da ricordare che, usando l'istruzione `poke` del linguaggio di programmazione BASIC è possibile accedere e scrivere sui singoli registri interni del SID specificando sia l'indirizzo, sia il valore numerico da memorizzarvi.

Il programma usa la prima voce impostata come _onda triangolare_ per riprodurre una nota A440 di durata pari a circa 500 millisecondi. Le istruzioni usate sono:

1. indirizzamento del SID `SI=54272`;
2. impostazione del volume master (registo 4: `L=SI+24` con valori da 0 a 15, volume basso/alto);
3. impostazione dell'envelope con 4 bit per ciascuna fase = 2 byte per la memorizzazione (registri 5 e 6: `A=SI+5` e `H=SI+6`, rispettivamente per attack/decay e sustain/release);
4. impostazione della frequenza (registri 0 e 1: `FL=SI` e `FH=SI+1` )
5. selezione dell'onda (registro 4). Alcuni valori possibili sono:
  * tringolare: 17;
  * dente di sega: 33;
  * rettangolare: 65 --> parametro addizionale "_duty cycle_" (registri 2 e 3 `TL=SI+2`, `TL=SI+3`);
  * noise: 129;
6. ciclo _for_ per la durata della nota.

#### Hubbard

Il SID è uno chip che dispone di sole 3 voci ma non è detto che nelle mani di capaci musicisti programmatori non possa ricreare la polifonia e la ricchezza timbrica di un ensamble molto più numeroso

<iframe width="100%" height="315" src="https://www.youtube.com/embed/pgPEaI0GHBI?list=PLXhLeiiveJmNhFf5ShVwwXspGfgt-ww8c" frameborder="0" allowfullscreen></iframe>

Ecco le tracce separate per apprezzare meglio la ricchezza di variazioni, il timing e intuire l'ingegnosità dei programmi scritti da Hubbard:

<a id="hubbard-1">
<audio controls style="width:100%">
  <source src="./resources/music/Rob_Hubbard/commando_track1_voice1.ogg" type="audio/ogg">
Your browser does not support the audio element.
</audio>
<a/>

<a id="hubbard-2">
<audio controls style="width:100%">
  <source src="./resources/music/Rob_Hubbard/commando_track1_voice2.ogg" type="audio/ogg">
Your browser does not support the audio element.
</audio>
<a/>

<a id="hubbard-3">
<audio controls style="width:100%">
  <source src="./resources/music/Rob_Hubbard/commando_track1_voice3.ogg" type="audio/ogg">
Your browser does not support the audio element.
</audio>
<a/>

Anche dalle immagini che mostrano la forma d'onda della parte iniziale della prima voce si può comprendere la complessità della lavorazione:

![waveform 1](./images/ed-agosto-settembre-2017/pt2/waveform1.jpg)

![waveform 2](./images/ed-agosto-settembre-2017/pt2/waveform2.jpg)

TODO: ascolto del brano su multitraccia **Audacity**.

Immagini e tracce sonore sono state estrapolate utilizzando il player [SIDplay2](http://sidplay2.sourceforge.net/) e [Audacity](http://www.audacityteam.org/).<br/><br/>
[.sid files collection/database](http://hvsc.c64.org/)
[VICE](http://vice-emu.sourceforge.net/index.html#download), importante emulatore commodore;
SID [datasheet](http://www.waitingforfriday.com/?p=661) e [wiki](https://www.c64-wiki.com/wiki/SID)
{: class="dashed"}

## Repetition

Scott Selfon di _Microsoft Corporation_ parla della ripetizione nel videogioco al GDC 2014 in un [talk](http://www.gdcvault.com/play/1020319/Techniques-for-Fighting-Repetition-in) intitolato "_Techniques for Fighting Repetition in Game Audio_":

<audio controls>
  <source src="http://twvideo01.ubm-us.net/o1/vault/gdc05/audio/techniques.mp3" type="audio/mpeg">
Your browser does not support the audio element.
</audio>

### Quando la ripetizione è un bene

La ripetizioni nel sonoro per un videogame non è sempre un male: talvolta al giocatore va dato una sorta di feedback, una **audio reward** ad indicare che si sta facendo qualcosa di giusto o qualcosa che migliora la propria condizione (es. bere la pozione rinvigorente in "_Prince of Persia_").

![prince](./images/ed-agosto-settembre-2017/pt2)

<a id="prince-of-persia">
<audio controls style="width:100%">
  <source src="./sounds/prince-glu-glu.ogg" type="audio/ogg">
Your browser does not support the audio element.
</audio>
<a/>

Anche nell'abito dei suoni associati alla **UI** la ripetizione è quasi necessaria: un particolare suono sta ad indicare che si sta selezionando una opzione specifica e lo stesso suono ripetuto serve a sottolineare il fatto. Se l'interfaccia utente proponesse suoni diversi mentre l'utente si muove nell'interfaccia, anche interagendo con il medesimo pulsante, la cosa causerebbe non poca confuzione.

### Quando la ripetizione è un male

Ci sono altri casi tuttavia dove la ripetizione non è bene. La ripetizione è da evitare quando è causa della rottura dell'illusione.

"_suspenzion of disbilief_"

Se il suono che udiamo è lo stesso che abbiamo già ascoltato, il nostro cervello intuisce immediatamente che qualcosa non funziona come dovrebbe.

Un suono che si ripete sempre uguale a se stesso due volte di fila è quanto di più innaturale si possa percepire in un videogioco. Nella realtà di tutti i giorni non si verifica mai nulla di simile, basta considerare semplicemente _la posizione della nostra testa_ all'interno dell'ambiente, essa non è mai nella stessa esatta posizione in istanti ravvicinati (le nostre orecchie non mentono e sanno riconoscere ogni tipo di variazione).

La ripetizione può verificarsi nell'ambito dei:
* **dialoghi**: immaginiamo una sitzaione in cui affrontiamo uno schieramente di nemici e ognuno di essi pronunci un grido di battaglia assolutamente identico a quello pronunciato dai vicini.
* **fooley**: esempio tipico è quello dei _footsteps_, in cui lo stesso identico suono si sente ripetuto più e più volte durante il gioco. L'effetto suona innaturale e contribuisce a buttare fuori lo spettatore rompendo l'illusione.
* **fisica**: se il Physics engine lavora per simulare, ad esempio, una lattina che rotola al suolo, e l'integrazione prevede che un suono venga riprodotto a loop sempre uguale a se stesso ad intervalli di tempo regolari, ecco che si ha lo stesso tipo di problema (indipendentemente che il suono ben si sposi con l'immagine renderizzata a schermo);
* **suono senza corrispondenza visiva** (o per meglio dire, con errata corrispondenza visiva): una cosa che accade tipicamente con i suoni d'ambiene, spesso pre-prodotti e inseriti nel gioco senza che ci sia poi una comunicazione tra i game e audio engines. Un esempio potrebbe essere il bubolare del **gufo** o l'**ululato** del lupo in uno scenario di un bosco pauroso. La traccia ambientale potrebbe essere prerenderizzata (mono, stereo o multicanale), tuttavia non risultare realistica quando il gufo suoni sempre "_pannato_" a destra nonostante l'avanzare e il muoversi del player nel bosco.


### Grandi matrici

Tutto questo fa sì che ci sia bisogno di un gran numero di variazioni e che si debba lavorare per "_riempire gli spreadsheet_" (parte dell'_audio design document_) e registrare continaia se non migliaia di suoni diversi. Una matrice ad incroci enorme che richiede un sacco di tempo e risorse per essere prodotta.

Il workflow comunce infatti può essere compreso se si pensa a come l'audio viene normalemnte implementato all'interno del videogioco: come un evento che corrisponde ad un determinato suono.

Eventualmente poi il suono associato all'evento viene prodotto o elaborato successivamente a seconda di uno o più parametri che derivano dall'game engine. Alcuni esempi potrebbero essere:
* il _carico_ per un automobile in corsa;
* il livello di _salute_ per il player;
* il _punteggio_ della partita a regolare il livello di eccitamento del pubblico sugli spalti dello stadio.

![spreadsheets](s)

Qui risiede la grande abilità del sound designer il cui talento e capacità sono fondamentali nella riuscita.

![A and b](ab)

Ammesso che la relazione `martello-->colpisce-->incudine` produca lo stesso suono di `incudine-->colpisce-->martello`, i suoni da ricreare sono comunque tantissimi: la **crescita** dei sound assets è **combinatoria**!

![combinatoria](c)

Un oggetto può essere colpito in un particolare punto o subire un impatti da un corpo che poi rimane in contatto. Può essere strisciato e causare una eccitazione da frizione, soffiato per eccitarne eventuali cavità d'aria oppure scosso da una vicina sorgente ad esso accoppiata ed essere portato in risonanza.

Inoltre tutto questo può accadere in aria oppure anche sott'acqua il che modificherebbe la velocità del suono e la sua propagazione. Oppure possono accadere mentre l'oggetto, l'ascoltatore o il mezzo di propagazione è in movimento causando l'effetto Doppler, etc...

Per fare un altro esempio si potrebbe considerare ancora quello dei _footsteps_: senza troppo eccedere, potremmo supporre che il gioco contenga 20 diverse superfici calpestabili come legno, metallo, ghiaia, sabbia, cemento e così via.

Per ottenere il numero di file audio da produrre, dobbiamo moltiplicare questo numero per quello dei personaggi più importanti per il gioco, i quali hanno bisogno d'essere caratterizzati particolarmente nei loro movimenti.

Questi personaggi possono poi indossare diversi tipi di calzari e possono poi camminare a diverse velocità: anche questo incide dal momento che sappiamo che "il correre" non suona come "il camminare".

All'interno dell'equazione potremmo poi inserire anche il paramtro _peso_, dato dal numero di oggetti trasportati nell'inventario personale, oppure ancora considerare la pendenza del terreno, e così via...

Come si vede la matrice degli assets sonori in un caso come questo diventerebbe davvero gigantesca e multidimensionale.

TODO: GTA V case study slides di Alastair MacGregor della Rockstar games (13:47) - walla

### Realtime

La soluzione a questo è computare quanto più possibile in **realtime**, usando le capacità offerte dai dispositivi **hardware** della piattaforma ove possibile oppure programmando via **software** (a basso livello magari) le features che ci interessano per creare varaizione.

Un altro modo per risolvere problemi di ripetitività è quello di **tenere traccia delle variazioni**.

Tenere traccia in qualche modo, di quale sia stato l'audio appena riprodotto per operare delle scelte intelligenti sul nuovo audio da riprodurre così da sincerarsi di non ripetersi e non essere ridondanti.

Le principali accortezze che si potrebbero avere sono in questi ambiti:

#### volume / attenuation

Si tratta di un sistema facile ed economico da metter in atto perchè comporta operazioni CPU base. Fornisce già una discreta illusione della profondità e della spazialità, tuttavia non è uno dei sistemi più incisivi per vincere la ripetitività;

#### Pitch changes

L'orecchio umano è meno abile nel riuscire a percepire differenze di intonazione. Inoltre questo sistema non è sempre applicabile, specie nelle linee di dialogo, per le quali invece una variazione risulterebbe particolarmente fastidiosa.

La causa di questo è da ricercare nel fatto che tutti questi cambiamenti nel pitch avvengono attraverso cambiamenti di sample rate, nel dominio del tempo quindi, con conseguente variazione nella durata.

Così facendo la voce diventa rapidamente innaturale (quando una voce è "_pitchata_" verso l'alto ad esempio in incorre nel problema legato alle armoniche superiori che, superata la frequenza di nyquist, finiscono per ripresentarsi nella parte bassa dello spettro, causando distorsioni e artifatti percepibili).

Inoltre da considerare la banda di trasferimento dati da disco a memorie/processore: con un pitch di un ottava sopra mi ritrovo un audio dalla velocità raddoppiata il che necessità un più veloce accesso ai dati.

Pitch shifting più avanzati possono essee usati: si tratta dei pitch shifting che agiscono invece nel dominio della frequenza e si basano quindi sulla FFT. Sono pitch shifting con la preservazione delle formanti che garantiscono alle voci di mantenere la loro credibilità. Con questi tipi di pitch shifting inoltre lo streaming dei contenuti audio da disco resta coerente.

#### Filtering

Spesso l'hardware dei dispositivi su cui il gioco verrà giocato permette di effettuare operazioni di filtraggio in modo diretto senza costi di alcun tipo. In caso questo non sia possibile invece è comunque semplice implementare lo stesso tipo di filtri base come un LPF o un banco di BPF, via codice DSP.

Usare i filtri sul sonoro e anche sulle voci permette di raggiungere un alto grado di variabilità. Non importa se il filtraggio non rispetta con accuratezza la fisica del fenomeno, il semplice fatto che ci sia un filtro fa suonare il tutto più naturale.

Applicare variazioni randomiche sul filtto di una voce infatti, aiuta a illudere il giocatore sulla presenza di elementi attenuanti come l'umidità ad esempio, ma soprtattutto fornisce la sensazione di direzionalità: nell'esperienza quotidiana, come ascoltatori ci accorgiamo che la nostra testa non è mai perfettamente ferma nello stesso punto e, anche piccole variazioni nella posizione, possono modificare lo spettro dell'audio percepito.

Anche questa è una tecnica relativamente economica da applicare.

#### Timing/variation

Di nuovo in questo caso si può citare l'esempio dei _footsteps_. Il suono dei passi è infatti un suono molto articolato, per questo si può pensare di **spezzarlo nelle sue componenti individuali** e applicare variazioni casuali a ciascuna di qieste per ottenere un risultato molto più ricco.

Un altro espediente è quello di **variare il tempo** che intercorre tra i vari elementi. In un suono ambientale che debba generare un tappeto costante di sottofondo, un particolare altamente riconoscibile come un ululato o il suono di un gufo può destare l'interesse dell'ascoltatore, pertanto una ripetizione a loop dell'audiofile, verrebbe immediatemente classificata come finta.

In questi casi meglio separe le diverse parti e lavorare con tempi diversi e casuali frapposti tra i suoni che possono essere più problematici.

#### Silence

Talvolta il silenzio può risultare un grande alleato quando si cerchi di sconfiggere la ripetitività. Semplicemnte usare il silenzio come una delle possibili opzioni di una scelta casuale può aggiungere un po' di varaizione in più!

#### Envelope

Applicare curve di inviluppo su volume o frequenza di taglio dei filtri aggiungono ancora ulteriore variabilità.

Ad esempio una mitragliatrice che abbia terminato la sua raffica potrà avere diverse curve di iniluppo applicate alla coda del suoni in decadimento.

#### Positional variation

La variazioni applicata al posizionamento dei suoni nell'ambiente è importante; in particolare per tutti quei suoni che non hanno un proprio corrispettivo visivo.

Il bubolare di un gufo nell scenario del bosco deve essere posizionato con cognizione e mantenere la propria posizione coerentemente con i movimenti del giocatore.

Inoltre, considerando che i suoni non sono quasi mai omnidirezionali, occorre considerare anche quale la direzione verso cui la sorgente sonora è orientata.

Un _epic fail_ in questo caso è il sentire un gufo sul proprio lato destro quando, sopraggiungendo dal bosco, si è ormai arrivati a costeggiare sulla destra un alto edificio.

#### Environmental variation

L'ambiente deve interagire con il suono prodotto dagli emitter: il mondo 3D in cui siamo immersi può essere sfruttato per creare variazione.

Per continuare con l'esempio del muro, il suono dei nostri passi dovrebbe in questo caso essere arricchito da una serie di early reflection. Ascoltando il suono così realizzato non soltanto si avrebbe una percezione di variazione ma anche una maggiore sensazione di immedesimazione nell'ambiente.

Un esempio potrebbe essere il plug-in [Reflect](https://www.audiokinetic.com/products/wwise-add-ons/reflect/) di Wwise il cui compito è proprio quello di realizzare le early reflection dinamicamente su base della struttura 3D del mondo.

Ad oggi la cosa può sembrare scontata ma, forse qualcuno se ne ricorderà, prima che il calcolo dinamico delle occlusioni diventasse possibile e venisse implementato massicciamente, poteva capitare che si sentisse il suono di un nemico sopraggiungere dal lato ma che, voltandosi verso la direzione di provenienza del suono, non ci fosse nulla se non un muro. Il nemico c'era ma aldilà della parete.

## When to apply all those effects

### Dialoghi

Aggiungere variazione non è sempre facile: il dialogo è la cosa più difficile da manipolare dinamicamente su cui è più difficile applicare quanto visto fino ad ora..

Per questo la variazione la si ottiene in fase di registrazione, con l'attore e il direttore del ADR che registrano battute con differenti intenzioni ed intonazioni.

Interessanti saranno i futuri sviluppi dell'**intelligenza artificiale** per la sintesi vocale la quale potrebbe presto soppiantare la necessità di disporre di attori in carne ed ossa per la registrazione di linee di dialogo (vedi il progetto [WaveNet](https://deepmind.com/blog/wavenet-generative-model-raw-audio/) ad esempio).
{: class="note"}

Nel caso dei dialoghi eventualmente si possono applicare modifiche in real-time come il **voice-masking** (usato tra l'altro per ridurre il gender gap (flip gender) nell [interviste di lavoro on-line](https://youtu.be/p6m8hvIo0VI), inducendo un artificiale "_gender flip_") oppure ancora per una "_radializzazione_" (voice coming from the radio).

In tale caso è possibile aggiungere più o meno rumore, crakcles o distorsione in modo dinamico e in termpo reale.

Resta comunque il fatto che la stessa frase non può essere mai detta identicamente 2 volte di fila! E' inaccettabile all'ascolto.

Un altro aspetto interessante che dovrebbe essere gestito è nell'interazione di più characters durante il dialogo: siamo naturalmente in grado di ascoltarci e aspettare il nostro turno per esprimere la nostra opinione. In caso di sovrapposzione è possibile interrompere l'interlocutore alzando la voce oppure restare in silenzio fino a che colui che parla non si interrompe.

Un gioco non è normalemnte in grado di fare questo. Interessante sarebbe capire come ed in che modo introdurre sistemi intelligenti per simulare questo tipo di interazioni per restituire una suono più verosimile.

Una nota va spesa per citare i sistemi di **speach recognition** come shortcut sostitutivi all'uso dei controller fisici per agire all'interno del gioco (implementati ad esempio in titoli come "_Mass Effect 3_", "_The Elder Scrolls V: skyrim_").
{: class="note"}

Importante comunque generare variazioni come la già citata _positional variation_ considerando che il suono proveniente dalla bocca non è direzionale e pertanto va opportunamente filtrato a seconda dei movimenti.

### Sound fxs

Come già detto, le variazioni hanno ampia applicazione sugli effetti sonori.

### Music

Anche la musica è una elemento che può certo avvantaggiarsi delle tecniche di variazione fino ad ora discusse.

Per la musica si potrebbe aprire un intero capitolo a parte parlando di composizioni interattive, musica generativa/algoritmica, passando per iMuse, Farnell,

Forse in una lezione futura :)

{% comment %}

linear music (shuffling) 37:00 / radio GTAV - ducking, changing mix, djishing thing, cross fade - interactive composition
markers, timing (iMuse style of stuff)

{% endcomment %}

---

{% comment %}

# dall'edizione precedente:

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

{% endcomment %}


---


event --> sound ribaltato: sound --> event: sound drive the image (loudness - smoke and fire [Tom Clancy's Ghost Recon Advanced Warfighter](https://en.wikipedia.org/wiki/Tom_Clancy%27s_Ghost_Recon_Advanced_Warfighter)) - http://www.gdcvault.com/play/1017780/Crossing-the-Streams-Game-Audio 23:14


<a id="pt3"></a>
## Pt3:
TODO


{% comment %}

### Procedural sword by Rod Selfridge

A model by _Rod Selfridge_ (here's the [paper]())
PD objects which are needed:

* prvu~ (_iemlib_ library??)
* acos (_cyclone_ library)
* atan~ (_cyclone_ library)
* [>~] e [<~] (_zexy_ library)
* Uzi (_cyclone_ library)
* spigot~ (?? library)
* sin~

{% endcomment %}

### Godot & libpd integration

Si tratta di un lavoro in corso che permetterà di integrare il motore audio _PureData_ all'interno del game engine _Godot_. [Qui]() il link al repository sul quale _limulo.net_ sta facendo i primi test: ogni contributo è benvenuto!
