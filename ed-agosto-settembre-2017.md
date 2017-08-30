---
layout: default
---

## Edizione Agosto/Settembre 2017

Back to [Home](index);
<br/><br/>
Presto disponibili le slide delle lezioni!
<!-- Scarica le <a href="./slides/Game Engines Game Sound Techniques maggio 2017.pdf" >slides</a> delle lezioni! -->
{: class="dashed"}

Di seguito parte dei contenuti trattati durante le lezioni:

* Go to the [Part 1](#pt1);
* Go to the [Part 2](#pt2);
* Go to the [Part 3](#pt3);

---

<a id="pt1"></a>
## Pt1: Game Engines

### Che cos'è un game engine?

Il **game engine** (o motore di gioco) è un componente software usato per aiutare lo sviluppo l'esecuzione di un _videogioco_. Prima di esaminarlo in dettaglio conveniamo sulla definizione di **videogioco**.

#### Cos'è un videogioco?

Il _videogioco_ è una moderna di declinazione del concetto di **gioco**. La sua particolarità risiede nel mezzo con cui si fruisce del gioco: uno **schermo**.

![videogioco](./images/ed-agosto-settembre-2017/pt1/natron/natron-output.png)

####   Le caratteristiche del gioco

Un **gioco** è una narrazione guidata da scelte che uno o più giocatori compiono in conformità a un insieme di regole che limitano il campo d’azione.

Le sue caratteristiche sono:

* Intrattenimento (non solo: [studi sull'impatto del videogioco sulla salute e le capacità cognitive](https://www.scienceopen.com/search#%7B%22id%22%3A%22%22%2C%22isExactMatch%22%3Atrue%2C%22context%22%3Anull%2C%22kind%22%3A77%2C%22order%22%3A0%2C%22orderLowestFirst%22%3Afalse%2C%22query%22%3A%22videogame%20%22%2C%22filters%22%3A%5B%5D%7D))
* Interattività
* Multimedialità

---

#### Il videogame è software!

Storicamente i videogiochi hanno visto i natali negli arcade (sale gioco), a cui si sono aggiunte le console e infine i PC. Un videogioco altro non è che un **software**, un insieme di codici contenenti le istruzioni comprensibili da una macchina.

Ogni macchina per le sue peculiarità (hardware, OS quando presente) comprende un particolare insieme di codici, non utilizzabili da altri macchinari, per quanto simili come finalità di utilizzo.

Inoltre, assieme alla complessità logica e grafica i giochi ci sono man mano diversificati anche in virtù di un genere di appartenenza.

La _diversificazione dei generi_ non è stata solo uno sbocco naturale dovuto all'innovazione tecnologica ma anche una necessità dell'industria per far fronte ad una stagnazione del mercato, ormai saturo di giochi, uno [clone](http://www.pong-story.com/mypongs.htm) dell'altro, sia negli arcade, console e primi pc. Uno su tutti è l'esempio di Pong il cui chip (l'[AY-3-8500](https://it.wikipedia.org/wiki/AY-3-8500))
<br/><br/>
![collasso](./images/ed-agosto-settembre-2017/pt1/pong/collapse.png)
<br/><br/>
La saturazione del mercato fu causata anche da una mancanza di regolamentazione nel _copyright_ associato al prodotto videoludico!
{: class="dashed"}

Di generi videoludici ne esistono moltissimi, possiamo qui esaminarne alcuni, come ad esempio un'avventura testuale o grafica, un RPG, un race game e un FPS. Tutti questi sono videogiochi, ma differiscono notevolmente tra di loro sia per quanto riguarda la logica interna sia per quanto riguarda la performance richiesta alla macchina.

1. un'avventura testuale (come [Colossal Cave Adventure](https://en.wikipedia.org/wiki/Colossal_Cave_Adventure) del 1976) richiede un'efficienza in termini di _parsing del testo_ (comprensione delle istruzioni digitate dall'utente), ma non ha grafica;
2. un'avventura grafica (come [Gabriel Knight](https://en.wikipedia.org/wiki/Gabriel_Knight) della Sierra) invece richiede un _render grafico_, la possibilità di emettere _suono_ e di gestire la _fisica_, e la gestione dell'_input_ dell'utente attraverso _interfaccia grafica_ (GUI);
3. un RPG (come [Ultima](https://en.wikipedia.org/wiki/Ultima_%28series%29)) richiede _memoria_ per gestire le statistiche e i vari livelli durante il gioco. A differenza delle avventure testuali richiede anche la capacità di render grafico;
4. un race game (come [Indianapolis 500](https://it.wikipedia.org/wiki/Indianapolis_500%3A_The_Simulation)) si basa sulla _simulazione_, quindi saranno necessari modelli accurati e una corretta impostazione della _fisica_ del gioco per poter riprodurre il più fedelemente possibile questi modelli nel gioco. A ciò si aggiunge il _render grafico_ che deve essere accurato, una capacità responsiva veloce e una gestione di controller articolata;
5. un FPS (come [Wofenstein 3D](https://it.wikipedia.org/wiki/Wolfenstein_3D)) ha bisogno di un'ottima resa _grafica_, di un sistema di gestione delle collisioni ottimale, di un sistema di _AI_ e di gestire l'input utente attraverso interfacce grafiche anche molto complesse.

Si vede che anche solo considerando pochi esempi di videogiochi, questi differscano non solo in genere, ma anche in risorse di cui necessitano.

### Perchè si utilizza il game engine?

Per capire perchè il game engine è importante...

#### Mettiamoci nei panni...

Quindi ora, mettiamoci nei panni di una software house. Possiamo decidere di sviluppare ogni videogame da zero. Questo è dispendioso in termini di persone coinvolte e di tempo impiegato nella realizzazione del videogioco (concept, creazione degli asset, programmazione del gioco - interazione, fisica, grafica, suono, ottimizzazione per varie piattaforme - abbiamo visto prima che macchine diverse comprendono codici - o linguaggi - diversi).

Questa modalità a lungo andare non è efficiente. Allora ci domandiamo, perchè reinventare ogni volta la ruota?

Quando abbiamo realizzato un videogioco, ad esempio un RPG, abbiamo già a disposizione tutta una serie di strumenti software che possono essere riutilizzati in altri giochi RPG. Quello che cambierebbe allora sarebbero solo gli **assets** (grafiche, suoni, modelli, script,...). Questo è dispendioso solo in termini di rendere il pacchetto software già realizzato il più generico possibile, in modo da essere utilizzabile più e più volte per diversi giochi.

Una volta che si crea questo _motore di gioco_ (**game engine**), lo sviluppo di ulteriori giochi è facilitato, si possono spender più tempo e soldi in termini di sviluppo asset e soprattutto in level design. Il tutto è ulteriormente semplificato dall'utilizzo di un'IDE grafica (interfaccia di sviluppo grafica) che rende trasparente il livello di programmazione.

I vari reparti interessati nello sviluppo del gioco lavorano ciascuno nel proprio ambito sulla medesima piattaforma di sviluppo (sullo stesso progetto) senza preoccuparsi di integrare le varie componenti tra di loro. Il reparto che si occupa di programmazione si occupa di collegare le risorse sia tra di loro sia con la logica sottostante utilizzando codice.

Ecco quindi che come software house abbiamo creato un nostro game engine ad uso interno.

#### Game engine storici

Il nostro game engine è comunque lungi dall'essere un'innovazione nell'industria. Appoggiarsi a game engine (nel caso di sviluppo di videogiochi) o a porzioni di software già pronto (nella fase di sviluppo e creazione software) è una pratica vecchia quanto la computer science. Per quanto possibile non si reinventa la ruota. Si cerca, al più, di migliorarla.

![engine storici](./images/ed-agosto-settembre-2017/pt1/engine-storici.png)

A partire dagli arcade, passando per le prime console e quindi approdando ai PC, la tecnologia ha reso sempre più semplice e desiderabile riutilizzare software già scritto, testato, ottimizzato, sul quale è possibile costruire nuovi programmi in minor tempo e in modo più efficiente.

#### Game engine di moderna concezione

Ma se siamo sviluppatori indipendenti e non abbiamo un reparto che si occupa di programmazione e sviluppo software capace di creare dal nulla un game engine? Alcune software house importanti (Epic Games con "_Unreal_" e Id Software con "_idTech_") hanno rilasciato al pubblico i loro engine, entrambi utilizzati per la realizzazione di FPS, il genere di videogiochi più in voga al tempo.

Altre software house si sono specializzate nello sviluppo di game engine per terze parti. Negli ultimi anni si ha una vera e propria profusione di game engine di respiro più genrico, per cui oggi non si ha che l'imbarazzo della scelta.

Una nota: esistono game engine più generici (Unity3D, Godot,...) e altri pensati per la realizzaizone di una tipologia precisa di videogiochi (Inform, Unreal, ...). Alcuni game engine offrono molte risorse (render 3D, compatibilità con sistemi VR, gestione rete per multiplayer online, streaming video...), ma alle volte non tutte sono necessarie per il gioco che si vuole realizzare. Quindi si sceglie (visto che oggi lo si può fare) il game engine in funzione del gioco da realizzare.
<br/><br/>
Non uso _Ableton Live_ per fare editing al campione, come non uso _ProTools_ per fare una performance dal vivo che richiede flessibilità e affidabilità.
{: class="note"}

#### Middleware

Come pro tools può essere espanso con plugin che ne amplificano le funzionalità, così i game engine possono essere ampliati in alcune loro funzionalità grazie all'uso di middleware (di cui avete già visto un esempio in Wwise). Ci sono middleware molto famosi, come _Havok_ per la **fisica** e l'**AI** e _Euphoria_ per la fisica e le collisioni.

<table style="width:100%">
<tr>
<td>
<iframe width="100%" src="https://www.youtube.com/embed/cIcg5eotZlY" frameborder="0" allowfullscreen></iframe>
</td>
<td>
<iframe width="100%" src="https://www.youtube.com/embed/wKLaMN9dnjQ" frameborder="0" allowfullscreen></iframe>
</td>
</tr>
</table>

Un'ulteriore nota di carattere generale: sebbene il livello di programmazione è trasparente all'utente del game engine, questo non scompare. Il gioco non cessa di essere software e il software altro non è che codice scritto in un linguaggio di programmazione. In parole povere, non si prescinde dal codice, ci sono sistemi semplificati di programmazione resi disponibili dai game engine, ma non esistono game engine in cui si può creare un gioco senza programmare.
{: class="note"}

#### Spaccato sulla programmazione

Abbiamo visto che il videogioco altro non è se non un **software**. Sebbene nei moderni sistemi di sviluppo non sia necessario essere in grado di programmare se si creano assets (ad esempio audio), è anche vero che ci si dovrà interfacciare con reparti tecnici che invece lavorano con il codice (ad esempio un _DSP guy_ o _audio programmer/coder_). Quindi familiarizzare con un po' di nomenclatura facilita il lavoro di entrambi.

In sostanza, imparare i rudimenti della programmazione è fondamentale, soprattutro per operare nell'ambito multimediale, per i seguenti motivi:
1. imparare a programmare fornisce un **linguaggio comune** spendibile in tutti i contesti in cui ci si debba interfacciare con un team di sviluppatori;
2. imparare a programmare non implica che per forza si debba cercare uno sbocco professionale nel campo. Così come si impara a _leggere e scrivere_ senza pensare di divenire _scrittori_, così programmare sta diventando l'equivalente dell'**alfabetizzazione** del secolo scorso.

Le nuove tecnologie si stanno evolvendo a ritmi sostenuti (esempi) e, se questo è da una parte salutato con entusiasmo, dall'altra è guardato con preoccupazione. L'unico modo per interfacciarsi serenamente con la tecnologia, ovvero non caderne vittima e non fuggirla come una minaccia è conoscerla!
{: class="note"}

3. inoltre, padroneggiare i principi di programmazione torna utile anche da un punto di vista **creativo**, rendendo possibile usare tool di sviluppo audio come SuperCollider o Chuck con cui si possono realizzare effetti audio e suoni inediti e del tutto originali. Inoltre questi strumenti sono utilizzabili durante live performances per creare jam con il codice (live coding). A tal proposito, rimandiamo all'interessante [talk](https://www.youtube.com/watch?v=TK1mBqKvIyU) del creatore di [Sonic Pi](http://sonic-pi.net/), Sam Aaron. Il movimento di riferimento è [Algorave](https://algorave.com/) e il sito in cui trovare informazioni è [toplap](https://toplap.org/).

Per chi fosse interessato ad approfondire da subito il mondo della programmazione, consigliamo di seguire [questa breve lezione](http://hello.processing.org/) tenuta da Daniel Shiffman, portabandiera della [Processing](http://processing.org) Foundation.
{: class="dashed"}

Cosa significa avere un sistema semplificato di programmazione come ho detto prima?

Il computer è una macchina universale. Significa che può compiere qualsiasi compito per il quale le si forniscano le corrette istruzioni. Il computer però non fa nulla da solo. Non è come una radio, che una volta accesa, capterà automaticamente le onde radio a una data frequenza e le renderà in forma di onda sonora. Il computer una volta acceso rimane in stand-by. Attende istruzioni.

Le istruzioni comprese dal computer sono in forma binaria. Significa che sono in forma di sequenze di caratteri `1` e `0`.

E' possibile programmare, ovvero fornire istruzioni al computer, in forma binaria, ma non è molto efficiente. Questo per due motivi principali:
- le istruzioni raggiungono lunghezze considerevoli in breve tempo, quindi richiedo del tempo per essere redatte;
- la possibilità di errore cresce esponenzialmente con la lunghezza delle istruzioni così come la difficoltà di correggere l'errore.

Il vantaggio di programmare in binario è, però, l'assenza di livelli intermedi tra programmatore/software ed hardware.
Per facilitare il compito del programmatore sono nati linguaggi di programmazione più vicini al linguaggio naturale, che grazie ad una macchina (l'**assembler**), vengono tradotti in binario. Ogni macchina comprende un particolare dialetto binario, quindi avrà un proprio assembly (il linguaggio compreso dall'assembler) dedicato. Non posso usare l'assembly per Intel su una macchina Motorola.

L'assembly è a tutti gli effetti quello che si chiama linguaggio a basso livello (ovvero, un linguaggio che usa simboli e alfabeto proprio degli esseri umani e che comunica in linea piuttosto diretta con l'hardware).

Per rendere la programmazione indipendente dalla macchina su cui si lavora (sviluppo un editor di testo che possa funzionare su DOS, Unix, Solaris, ...), sono stati creati dei linguaggi ancora più vicini al linguaggio naturale e che si avvantaggiano del **compilatore**, un software che traduce il file sorgente in un file scritto nell'assembly relativo alla macchina di destinazione, che a sua volta sarà reso in binario.

![astrazione](./images/ed-agosto-settembre-2017/pt1/livelli-astrazione.png)

Parlando di linguaggi vicini al linguaggio naturale, forse diamo un'idea un po' fuorviante. In realtà un linguaggio di programmazione è un linguaggio formale, ovvero un linguaggio con una grammatica, una sintassi e dei fortemente vincolato. Al contrario del linguaggio naturale, l'ambiguità è inesistente, pena la non computabilità del file sorgente.

Infine, a un livello di astrazione ulteriore si situano i cosiddetti **linguaggi di scripting**, che richiedono un passaggio intermedio ulteriore rispetto ai linguaggi compilati per essere resi in binario

![programming languages evolution](./images/ed-agosto-settembre-2017/pt1/binary-2-scripting/programming-lang-evo.png)

Più un linguaggio ha una grammatica e sintassi formale più si evitano ambiguità e più è semplice formulare istruzioni. Di contro, bisogna padroneggiare una buona percentuale del linguaggio prima di essere in grado di utilizzarlo.
{: class="note"}

### Com'è fatto un game engine?

Ecco le principali funzionalità che non possono mancare in un qualsiasi game engine:
* rendering engine (_motore di render_): sia 2D che 3D, si occupa di raccogliere tutte le informazioni della scena e sintetizzarle a schermo in un'immagine coerente (camera, luci, occlusioni, colori, texture) responsiva dell'input dell'utente (60 fps). Render 3d: i modelli 3d si compongono di "facce" ovvero poligoni costruiti usando triangoli. Ciascun vertice di ciascun triangolo è sottoposto a forze, illuminazione, deformazione, movimento... Tutto questo viene calcolato per milioni di vertici 60 volte al secondo;
* physics engine (_motore di fisica_): 60 volte al secondo il sistema controlla le collisioni dei corpi, le interazioni tra questi, i movimenti - anche solo camminare - è determinato da un intervento sulla fisica: `s = s0 + v0*t + 1/2a*t^2`;
* sound engine (_motore audio_): generalmente si distingue un **emitter** (= altoparlante) e un **listener** (= microfono o array di microfoni) per la gestione dei suoni _diegetici_. Un player audio stereo o multicanale è utilizzato invece per i suoni _extra-diegeteici_ (colonna sonora);
* interprete del linguaggio di scripting;
* AI engine (_motore di intelligenza artificiale_): i primi esempi di AI risalgono a PacMan, ma soprattutto al giorno d'oggi l'AI ha assunto un ruolo di rilievo in molti giochi. Chi si occupa di gestirla a livello software è il game engine;
* animation tools;
* particle systems;
* memory management (garbage collection);
* threading (physics engine e AI engine);
* video support (codecs);
* network management;
* UI/GUI ();
* VR;
* etc...

Interessate il progetto [openHMD](http://www.openhmd.net/) (open <b>H</b>ead <b>M</b>ounted <b>D</b>isplay) che offre un set di librerie libere e open source pensate per la gestione del VR e AR.
{: class="dashed"}

### Godot

Prendiamo [Godot](http://godotengine.org) come game engine di esempio.

<iframe width="100%" height="315" src="https://www.youtube.com/embed/XptlVErsL-o" frameborder="0" allowfullscreen></iframe>

Perchè abbiamo scelto _Godot_:
- open source: posso modificarlo come voglio e c'è una community che amplia e consolida la piattaforma
- multipiattaforma: linux, Windows, Mac OS
- 2D e 3D: parimenti sviluppato per entrambi i formati di gioco
- leggero e veloce non pesa sulla memoria del sistema operativo
- GDScript è mutuato su Python (Godot3 ha porting per Python): è un linguaggio molto usato (dalla computer vision alla AI, al NLP)
- GUI
- visual programming (dalla versione 3)

![Godot interface](./images/pt1/engines/Godot2.png)

Come è strutturata l'interfaccia di _Godot_:
* Filesystem: accesso a risorse sul computer e visualizzazione gererchia cartelle all'interno del progetto
* pannello risorse: le risorse usate nel gioco (file audio, file video, scene, sprite/modelli 3D, mesh, textures, immagini)
* hierarchy: gerarchia della scena (Nodo root, nodi figli, nodi fratelli, scripts associati ai singoli nodi, scene istanziate)
* properties: proprietà del nodo: variabili modificabili per il nodo (estendibili tramite script)
* Node Signals: segnali emessi/recepiti dal nodo (sistema di comunicazione fra vari elementi)
* Node Group: assegnazione dei nodi a gruppi per associare comportamento comune a più elementi (esempio enemies)

<a id="pt2"></a>
## Pt2: Game Sound overview

### Panoramica storica

TODO: coin-op, consoles, PC, MOD format, MIDI, MT-32

#### SID

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

<a id="c64-sound">
<audio controls style="width:100%">
  <source src="./sounds/c64-sound.ogg" type="audio/ogg">
Your browser does not support the audio element.
</audio>
<a/>

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

#### Rob Hubbard

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

Immagini e tracce sonore sono state estrapolate utilizzando il player [SIDplay2](http://sidplay2.sourceforge.net/) e [Audacity](http://www.audacityteam.org/).<br/><br/>mentre la musica di Hubbard proviene dal database [High Voltage SID Collection](http://hvsc.c64.org/). Il programma è stato scritto e eseguito utilizzando [VICE](http://vice-emu.sourceforge.net/index.html#download), importante emulatore commodore. Qui altre interessanti informazioni sul SID: [datasheet](http://www.waitingforfriday.com/?p=661) e [wiki](https://www.c64-wiki.com/wiki/SID).
{: class="dashed"}

### Re-Re-Repetition

Partiamo analizzando la _ripetizione_! La ripetizione in ambito audio all'interno di un videogioco può essere un bene o un male, cerchiamo di capire come e perchè; inoltre cerchiamo di visualizzare quali possibili soluzioni si possano adottare per ovviare ad eventuali problemi che la ripetizione possa causare.

Scott Selfon di _Microsoft Corporation_ parla della ripetizione nel videogioco al GDC 2014 in un [talk](http://www.gdcvault.com/play/1020319/Techniques-for-Fighting-Repetition-in) intitolato "_Techniques for Fighting Repetition in Game Audio_".
{: class="dashed"}

#### Quando la ripetizione è un bene

Talvolta la ripetizione nel sonoro per un videogame è un bene: al giocatore va data una sorta di feedback, una **audio reward** ad indicare che si sta facendo qualcosa di giusto o qualcosa che migliora la propria condizione (es. bere la pozione rinvigorente in "_Prince of Persia_").

![prince](./images/ed-agosto-settembre-2017/pt2/prince-of-persia.png){: width="60%"}

<a id="prince-of-persia">
<audio controls style="width:100%">
  <source src="./sounds/prince-glu-glu.ogg" type="audio/ogg">
Your browser does not support the audio element.
</audio>
<a/>

Anche nell'ambito dei suoni associati alla **UI** la ripetizione è quasi necessaria: un particolare suono sta ad indicare che si sta selezionando una opzione specifica e lo stesso suono ripetuto serve a sottolineare il fatto. Se l'interfaccia utente proponesse suoni diversi mentre l'utente si muove nell'interfaccia, anche interagendo con il medesimo pulsante, la cosa causerebbe non poca confuzione.

#### Quando la ripetizione è un male

Quando siamo fruitori di opere di intrattenimento - libri, cinema, teatro, etc... - tra noi e gli autori dell'opera si instaura una sorta di tacito accordo.

Da una parte nasce (inconsciamente) in noi volontà di sospendere l'incredulità ([_suspension of disbelief_](https://it.wikipedia.org/wiki/Sospensione_dell'incredulit%C3%A0)) per mettere momentaneamente da parte le nostre facoltà critiche, ignorare le incongruenze secondarie e godere appieno dell'opera di fantasia. Come spettatori ci lasciamo guidare e ci abbandoniamo alla narrazione.

Dall'altra parte l'autore si impegna ad introdurci e nel guidarci attraverso un percorso comune per raccontare una storia.

La sospensione dell'incredulità nasce da un equilibrio molto sottile, tanto più difficile da creare quanto da mantenere da parte dell'autore dell'opera, soprattutto in epoca moderna dove si è bombardati da flussi continui di informazione e da moltissime forme diverse di intrattenimento.

Declinando il concetto al mondo videoludico, un suono ripetitivo viene riconosciuto dal nostro cervello come un **pattern**.

Il nostro cervello è abilissimo ad identificare pattern, strutture ricorrenti di ogni tipo, è quando questo avviene il contratto si rompe.

---

I casi in cui la ripetizione NON è bene sono quelli in cui causerebbe la rottura dell'illusione: se il suono che udiamo è lo stesso che abbiamo già ascoltato, il nostro cervello intuisce immediatamente che qualcosa non funziona come dovrebbe.

Un suono che si ripete, sempre uguale a sé stesso, anche solo due volte di fila, è quanto di più innaturale si possa percepire.

Nella realtà di tutti i giorni non si verifica mai nulla di simile, basta considerare semplicemente _la posizione della nostra testa_ all'interno dell'ambiente, essa non è mai nella stessa esatta posizione in istanti ravvicinati (le nostre orecchie non mentono e sanno riconoscere ogni tipo di variazione).

La ripetizione può verificarsi nell'ambito dei:
* **dialoghi**: immaginiamo una sitzaione in cui affrontiamo uno schieramento di nemici e ognuno di essi pronunci un grido di battaglia assolutamente identico a quello pronunciato dai vicini;
* **fooley**: esempio tipico è quello dei _footsteps_, in cui lo stesso identico suono si sente ripetuto più e più volte durante il gioco. L'effetto suona innaturale e contribuisce a "_buttare fuori_" lo spettatore rompendo l'illusione;
* **fisica**: se il physics engine lavora per simulare, ad esempio, una lattina che rotola al suolo, e l'integrazione prevede che un suono venga riprodotto a loop ad intervalli di tempo regolari, ecco che si ha lo stesso tipo di problema (indipendentemente che il suono ben si sposi con l'immagine renderizzata a schermo);
* **suono senza corrispondenza visiva** (o per meglio dire, con _errata_ corrispondenza visiva): una cosa che accade tipicamente con i suoni d'ambiene, spesso pre-prodotti e inseriti nel gioco senza che ci sia poi una comunicazione tra i game e audio engines. Un esempio potrebbe essere il bubolare del **gufo** o l'**ululato** del lupo in uno scenario di un bosco pauroso. La traccia ambientale potrebbe essere prerenderizzata (mono, stereo o multicanale), tuttavia non risultare realistica quando il gufo suoni sempre "_pannato_" a destra nonostante l'avanzare e il muoversi del player nel bosco.

#### Grandi matrici

TODO: lista suoni prince of persia

### I suoni di "Prince of Persia"

Un videogioco a piattaforme ambientato in un intricato palazzo della Persia medievale, originariamente pubblicato per Apple II da Brøderbund nel 1989, e successivamente portato su molti altri sistemi.

Per maggiori informazioni su questo bel gioco vi rimandiamo a [questo link](). Inoltro, per chi fosse interessato, [ecco il link](https://github.com/jmechner/Prince-of-Persia-Apple-II) al repository GitHub dove l'autore del gioco, Jordan Mechner, ha rilasciato il codice sorgente per [MOS 6502](https://it.wikipedia.org/wiki/MOS_6502) originale. Sul sito personale dell'autore si possono consultare anche il  e i diari di sviluppo!
{: class="dashed"}

I suoni si cui il gioco fa uso (almeno nella sua versione per PC-MSDOS) sono 32. Sono stati realizzati dal sound designer Tom Retting. Eccone la lista, come la si può leggere dal [design document](http://www.jordanmechner.com/downloads/popsource.pdf) originale:
* Footsteps
* Soft landing
* Medium landing ("Oof!")
* Hard landing (Splat!)
* Sword clash
* Stab opponent
* Stab skeleton
* Stabbed by opponent
* Bones leap to life
* Impaled by spikes
* Slicer blades clash
* Character gets sliced in half
* Gate rising
* Gate stops at top
* Gate coming down slow
* Gate reaches bottom (Clang!)
* Gate crashes down
* Entrance door closes
* Exit door opening
* Bump into wall (soft)
* Bump into wall (hard)
* Bump into mirror
* Falling floor lands on your head
* Loose floor shakes
* Falling floor lands
* Drink position--1 unit of strength restored
* Drink special potion--strength boosted to higher level
* Drink poison (lose 1 unit of strength)
* Unsheathe sword
* Jump through mirror
* Grab on to ledge
* Drink potion (glug glug)

---

Tutto questo fa sì che ci sia bisogno di un gran numero di variazioni e che si debba lavorare per "_riempire gli spreadsheet_" (parte dell'_audio design document_) e registrare centinaia se non migliaia di suoni diversi. Una matrice ad incroci enorme che richiede un sacco di tempo e risorse per essere prodotta.

Il workflow comunce infatti può essere compreso se si pensa a come l'audio viene normalemnte implementato all'interno del videogioco: come un evento che corrisponde ad un determinato suono.

![event --> snd](./images/graphics/event-sound.png){: width="60%"}

Eventualmente poi il suono associato all'evento viene prodotto o elaborato successivamente a seconda di uno o più parametri che derivano dall'game engine. Alcuni esempi potrebbero essere:
* il _carico_ per un automobile in corsa;
* il livello di _salute_ per il player;
* il _punteggio_ della partita a regolare il livello di eccitamento del pubblico sugli spalti dello stadio.

![spreadsheets 1](./images/ed-agosto-settembre-2017/pt2/spreadsheet-1.jpg)

![spreadsheets 2](./images/ed-agosto-settembre-2017/pt2/spreadsheet-2.jpg)

---

![A and b](./images/graphics/collision.png){: width="50%"}

Ammesso che la relazione `martello-->colpisce-->incudine` produca lo stesso suono di `incudine-->colpisce-->martello`, gli assets audio da ricreare sono comunque tantissimi: la **crescita** è **combinatoria**!

![combinatoria](./images/ed-agosto-settembre-2017/pt2/combinazioni.gif){: width="60%"}


Un oggetto può essere colpito in un particolare punto o subire un impatto da un corpo che poi rimane in contatto. Può essere strisciato e causare una eccitazione da frizione, soffiato per eccitarne eventuali cavità d'aria oppure scosso da una vicina sorgente ad esso accoppiata ed essere portato in risonanza.
<br/><br/>
Inoltre tutto questo può accadere in aria oppure sott'acqua il che modificherebbe la velocità del suono e la sua propagazione. Oppure può accadere mentre l'oggetto, l'ascoltatore o il mezzo di propagazione sono in movimento causando l'effetto Doppler, etc...
<br/><br/>
Per fare un altro esempio si potrebbe considerare ancora quello dei _footsteps_: senza troppo eccedere, potremmo supporre che il gioco contenga 20 diverse superfici calpestabili come legno, metallo, ghiaia, sabbia, cemento e così via.
<br/><br/>
Per ottenere il numero di file audio da produrre, dobbiamo moltiplicare questo numero per quello dei personaggi più importanti per il gioco, i quali hanno bisogno d'essere caratterizzati particolarmente nei loro movimenti.
<br/><br/>
Questi personaggi possono poi indossare diversi tipi di calzari e possono camminare a diverse velocità: anche questo incide sul suono (il _correre_ non suona come il _camminare_).
<br/><br/>
All'interno dell'equazione potremmo poi inserire anche il paramtro _peso_, dovuto ad esempio dal numero di oggetti trasportati nell'inventario personale, oppure ancora considerare la pendenza del terreno, e così via...
{: class="note"}


Come si vede la matrice degli assets sonori in un caso come questo diventerebbe davvero gigantesca e multidimensionale.

Un caso di studio interessante potrebbe essere quello illustrato da _Alastair MacGregor_ della _Rockstar games_ al GDC 2014 rigaurdo agli assets del gioco GTA V (vedi minuto [13:47](https://youtu.be/L4GuM15QOFE?t=13m47s))

![GTA V assets 1](./images/ed-agosto-settembre-2017/pt2/GTA-slide-1.jpg)

![GTA V assets 2](./images/ed-agosto-settembre-2017/pt2/GTA-slide-2.jpg)

TODO: argomenta suoni di impatto, dialoghi, programmi radiofonici, etc...

#### Realtime

Una possibile soluzione alla ripetizione e alla conseguente necessità di avere numerosi assets è di genereare variazioni in **realtime**, usando le capacità offerte dai dispositivi **hardware** della piattaforma ove possibile oppure programmando via **software** (a basso livello magari) le features che ci interessano per creare varaizione.

Un altro modo per risolvere problemi di ripetitività è quello di **tenere traccia delle variazioni**.

Tenere traccia in qualche modo, di quale sia stato l'audio appena riprodotto per operare delle scelte intelligenti sul nuovo audio da riprodurre così da sincerarsi di non ripetere e non essere ridondanti.

Ecco le principali accortezze che si potrebbero avere:

##### Volume / attenuation

Si tratta di un sistema facile ed economico da metter in atto perchè comporta operazioni CPU base. Fornisce già una discreta illusione della profondità e della spazialità, tuttavia non è uno dei sistemi più incisivi per vincere la ripetitività;

##### Pitch changes

L'orecchio umano è meno abile nel riuscire a percepire differenze di intonazione. Inoltre questo sistema non è sempre applicabile, specie nelle linee di dialogo, per le quali invece una variazione di pitch risulterebbe particolarmente fastidiosa.

La causa di questo è da ricercare nel fatto che tutti questi cambiamenti nel pitch avvengono attraverso cambiamenti di sample rate, nel dominio del tempo quindi, con conseguente variazione nella durata.

Così facendo la voce diventa rapidamente innaturale (quando una voce è "_pitchata_" verso l'alto ad esempio si incorre nel problema legato alle armoniche superiori che, superata la frequenza di nyquist, finiscono per ripresentarsi nella parte bassa dello spettro, causando distorsioni e artifatti percepibili).

Inoltre da considerare la banda di trasferimento dati da disco a memorie/processore: con un pitch shift di un ottava sopra ci ritorviamo un audio dalla velocità raddoppiata il che necessità un più veloce accesso ai dati.

Pitch shifting più avanzati possono essee usati: si tratta dei pitch shifting che agiscono invece nel dominio della frequenza e si basano quindi sulla FFT. Sono pitch shifting con la preservazione delle formanti che garantiscono alle voci di mantenere la loro credibilità. Con questi tipi di pitch shifting inoltre lo streaming dei contenuti audio da disco resta coerente.

##### Filtering

Spesso l'hardware dei dispositivi su cui il gioco verrà giocato permette di effettuare operazioni di filtraggio in modo diretto senza costi di alcun tipo. In caso questo non sia possibile invece è comunque semplice implementare lo stesso tipo di filtri base come un LPF o un banco di BPF, via codice DSP.

TODO: cosa significa **costo CPU**?
{: class="note"}

Usare i filtri sul sonoro e anche sulle voci permette di raggiungere un alto grado di variabilità. Non importa se il filtraggio non rispetta con accuratezza la fisica del fenomeno, il semplice fatto che ci sia un filtro fa suonare il tutto più naturale.

Applicare variazioni randomiche sul filtto di una voce infatti, aiuta a illudere il giocatore sulla presenza di elementi attenuanti come l'umidità ad esempio, ma soprtattutto fornisce la sensazione di direzionalità: nell'esperienza quotidiana, come ascoltatori ci accorgiamo che la nostra testa non è mai perfettamente ferma nello stesso punto e, anche piccole variazioni nella posizione, possono modificare lo spettro dell'audio percepito.

Anche questa è una tecnica relativamente economica da applicare.

##### Timing/variation

Di nuovo in questo caso si può citare l'esempio dei _footsteps_. Il suono dei passi è infatti un suono molto articolato, per questo si può pensare di **spezzarlo nelle sue componenti individuali** e applicare variazioni casuali a ciascuna di queste per ottenere un risultato molto più ricco.

Un altro espediente è quello di **variare il tempo** che intercorre tra i vari elementi. In un suono ambientale che debba generare un tappeto costante di sottofondo, un particolare altamente riconoscibile come un ululato o il suono di un gufo può destare l'interesse dell'ascoltatore, pertanto una ripetizione a loop dell'audiofile, verrebbe immediatemente classificata come finta.

In questi casi meglio separe le diverse parti e lavorare con tempi diversi e casuali frapposti tra i suoni che possono essere più problematici.

##### Silence

Talvolta il silenzio può risultare un grande alleato quando si cerchi di sconfiggere la ripetitività.

Semplicemente contemplare il silenzio come una delle possibili opzioni nel ventaglio di delle possibilità, può aggiungere un po' di variazione in più!

##### Envelope

Applicare curve di inviluppo su volume o frequenza di taglio dei filtri aggiungono ancora ulteriore variabilità.

Ad esempio una _mitragliatrice_ che abbia terminato la sua raffica potrà avere diverse curve di inviluppo applicate alla coda del suono in decadimento.

##### Positional variation

La variazioni applicata al posizionamento dei suoni nell'ambiente è importante; in particolare per tutti quei suoni che non hanno un proprio corrispettivo visivo.

Il _bubolare di un gufo_ nello scenario del bosco deve essere posizionato con cognizione e mantenere la propria posizione coerentemente con i movimenti del giocatore.

Inoltre, considerando che i suoni non sono quasi mai omnidirezionali, occorre considerare anche quale la **direzione** verso cui la sorgente sonora è orientata.

Un "_epic fail_" in questo caso sarebbe il percepire un gufo sul proprio lato destro quando, sopraggiungendo dal bosco, si sia ormai arrivati a costeggiare sulla destra un alto edificio.

##### Environmental variation

L'ambiente deve interagire con il suono prodotto dagli emitter: il mondo 3D in cui siamo immersi può essere sfruttato per creare variazione.

Per continuare con l'esempio del muro, il suono dei nostri passi dovrebbe in questo caso essere arricchito da una serie di early reflection. Ascoltando il suono così realizzato non soltanto si avrebbe una percezione di variazione ma anche una maggiore sensazione di immedesimazione nell'ambiente.

Un esempio potrebbe essere il plug-in [Reflect](https://www.audiokinetic.com/products/wwise-add-ons/reflect/) di Wwise il cui compito è proprio quello di realizzare le early reflection dinamicamente su base della struttura 3D del mondo.

Ad oggi la cosa può sembrare scontata ma, forse qualcuno se ne ricorderà, prima che il calcolo dinamico delle occlusioni diventasse possibile e venisse implementato massicciamente, poteva capitare che si sentisse il suono di un nemico sopraggiungere dal lato ma che, voltandosi verso la direzione di provenienza del suono, non ci fosse nulla se non un muro. Il nemico c'era ma aldilà della parete.
{: class="dashed"}

TODO: nota sulla tecnologia

un'osservazione personalissima:
* grandi variazioni in ambito audio --> comportano piccole differenze nella percezione della verosimiglianza;
* piccole variazioni in ambito grafico --> comportano immani differenze nella percezione di cosa è verosimile.
{: class="dashed"}

### When to apply all those effects

#### Dialoghi

Aggiungere variazione non è sempre facile: il dialogo è la cosa più difficile da manipolare dinamicamente su cui è più difficile applicare quanto visto fino ad ora..

Per questo la variazione la si ottiene in fase di registrazione, con l'attore e il direttore del ADR che registrano battute con differenti intenzioni ed intonazioni.

Interessanti saranno i futuri sviluppi dell'**intelligenza artificiale** per la sintesi vocale la quale potrebbe presto soppiantare la necessità di disporre di _voice talents_ in carne ed ossa per la registrazione di linee di dialogo (vedi il progetto [WaveNet](https://deepmind.com/blog/wavenet-generative-model-raw-audio/) ad esempio).
{: class="note"}

Nel caso dei dialoghi eventualmente si possono applicare modifiche in real-time come il **voice-masking** (usato tra l'altro per ridurre il gender gap (flip gender) nell [interviste di lavoro on-line](https://youtu.be/p6m8hvIo0VI), inducendo un artificiale "_gender flip_") oppure ancora per una "_radio-lizzazione_" (voice coming from the radio).

In tale caso è possibile aggiungere più o meno rumore, crakcles o distorsione in modo dinamico e in termpo reale.

Altro esempio è il filtering real time che si applica per simulare la voce proveniente da una comunicazione telefonica. in genere utilizzando un filtro passabanda da 300Hz a 3000Hz.
{: class="dashed"}

Resta comunque il fatto che la stessa frase non può essere mai detta identicamente 2 volte di fila! E' inaccettabile all'ascolto.

Un altro aspetto interessante che dovrebbe essere gestito è nell'interazione di più characters durante il dialogo: come individui nella quotidianità del mondo reale, siamo naturalmente in grado di ascoltarci l'un l'latro e aspettare il nostro turno per esprimere la nostra opinione. In caso di sovrapposzione è possibile interrompere l'interlocutore alzando la voce oppure restare in silenzio fino a che colui che parla non concluda.

Un gioco non è in grado di fare questo. Interessante sarebbe capire come ed in che modo introdurre sistemi intelligenti per simulare questo tipo di interazioni sociali per restituire una suono più verosimile.

Una nota va spesa per citare i sistemi di **speech recognition** come shortcut sostitutivi all'uso dei controller fisici per agire all'interno del gioco (implementati ad esempio in titoli come "_Mass Effect 3_", "_The Elder Scrolls V: skyrim_").
{: class="note"}

Importante comunque generare variazioni come la già citata _positional variation_ considerando che il suono proveniente dalla bocca non è direzionale e pertanto va opportunamente filtrato a seconda dei movimenti.

#### Sound fxs

Come già detto, le variazioni hanno ampia applicazione sugli effetti sonori.

#### Music (case study: iMuse)

Anche la musica è una elemento che può certo avvantaggiarsi delle tecniche di variazione fino ad ora discusse.

Un sistema davvero interessante è quello ideato dai compositori Michael Land e Peter McConnel nel 1991, quando all'epoca lavoravano ai videogiochi di avventura della _LucasArts_: **iMuse**.

Nasce nel 1991 ([brevettato nel 1994](https://www.google.com/patents/US5315057)); è un sistema che premette l'introduzione di componenti di audio dinamico in un linguaggio di scripting. Fondamentalmente iMuse è un database di sequenze musicali che possono contenere **punti di decisione** o **markers** all'interno delle tracce.

Il sistema, utilizzando eventi SysEx nei file MIDI, permette l'interazione tra le azioni del giocatore e il sonoro del gioco.
Gli eventi in questione sono di due tipi: **markers** e **hooks**.

* Un _marker_ viene inserito nel file MIDI nel punto che, una volta raggiunto dal lettore MIDI, deve triggerare l'esecuzione di un particolare comando da parte dello script del gioco. Il comando in questione è inserito in una lista (_coda  fifo_) è ne viene attivata l'esecuzione non appena il MIDI player raggiunge un marker con un determinato ID. I comandi possono essere qualsiasi cosa, dal fade in/out alle pause;
* Un _hook_ contiene un ID e l'azione da eseguire una volta che l'hook viene raggiunto. Lo script lancia un comando che si occupa di aspettare che un certo hook venga incontrato (_callback_), e quindi di mettere in esecuzione il comando contenuto in quest'ultimo.
Gli hook si distinguono in vari tipi, quali ad esempio salti, trasposizioni, abilitazione/disabilitazione di strumenti.

Vediamone un paio di esempi sfruttando il motore _ScummVM_ e giocando a _Monkey Island 2: LeChuck revenge_ (nota: nella particolare dimostrazione usiamo una emulazione software della scheda _Roland MT-32_, all'epoca lo stato dell'arte dell'audio nel mondo videoludico);

![iMuse in ScummVM](./images/ed-agosto-settembre-2017/pt2/monkey2-scabb.gif){: width="100%"}

Per la musica si potrebbe aprire un intero capitolo a parte parlando di composizioni interattive, musica generativa/algoritmica, passando per iMuse, Farnell,

Forse in una lezione futura :)

### Game audio engine tradizionale

Il _game audio engine_ è una componente del game engine, oppure un modulo _middleware_ da affiancare ad esso, che si occupa della gestione di tutto ciò che è suono all'interno di un videogioco.

Quali sono i compiti e le caratteristiche principali di un game audio engine tradizionale?

#### Switching

Logiche e meccanismi per dare priorità ai suoni da riprodurre e assegnare le voci disponibili, dal momento che si tratta di risorse limitate.
Un esempio potrebbero essere i sintetizzatori dove si parla di [voice stealing](http://electronicmusic.wikia.com/wiki/Voice_stealing).

Un esempio di voice stealing nel videogioco lo si ha in _Super Mario Bros_, dove il sound engine agisce sulla voce assegnata alla melodia principale (il suono più acuto), deallocandola e riassegnandola per la sintesi degli effetti sonori delle monete.

<iframe width="100%" height="315" src="https://www.youtube.com/embed/Dp7fVUfj8oI?start=123" frameborder="0" allowfullscreen></iframe>

Lo switching è guidato anche dal ruolo che il particolare suono riveste all'interno della **narrazione**: in una sitauzione in cui sono presenti molti suoni, sono quelli meno importanti ai fini di quanto si deve raccontare ad essere sacrificati per primi.

Ai suoni in riproduzione in un videogioco sono quasi sempre associati **valori di priorità** o **rating** in modo automatico o semi-automatico in base alle scelte del giocatore. Questi valori numerici sono fondamentali nella scelta di quali voci deallocare in un scenario di _voice stealing_/switching.

#### Random

Come abbiamo ampiamente detto poco fa, la randomicità può essere una grande risorsa per aggiungere variabilità.

Il game audio engine dispone di una serie di strumenti integrati per aggiungere variabilità pressochè a ciascun parametro disponibile.

#### Blending

![multisampling](./images/graphics/multisampling.png)

Crossfade parametrico tra campioni diversi, quello che nella sintesi prende il nome di **multisampling**. Questa tecnica è implementata in gran misura nei campionatori i quali infatti rispondono a diverse velocity di tocco con un mix tra campioni corrispondenti.

In un gioco, immaginiamo una caduta di un oggetto da diverse altezze; questo comporta intensità diversa ma non solo, anche variazione timbrica.

#### Mixer, Grouping and Buses

Molti game audio system incorporano un mixer del tutto analogo a quallo in uso nelle grandi produzioni: un banco large frame con gruppi, mandate e ritorni, etc...

La differenza è che, mentre per una produzione tradizionale la configurazione del banco rimane statica, praticamente invariata lungo tutta la durato di Un medesimo brano o album, nel caso di un videogioco  il mixer deve spesso riconfigurarsi del tutto in pochi istanti.

<table>
<tr>
<td>
<img src="./images/pt2/screenshot-01.jpg" alt="quake 2 screenshot" width="100%;" />
</td>
<td>
<img src="./images/pt2/screenshot-02.jpg" alt="quake 2 screenshot" width="100%;" />
</td>
</tr>
</table>

Un esempio potrebbe essere il passaggio da una sitauzione _in-game_ ad un _menù di interfaccia_ (pausa o salvataggio).

#### Real time controllers

Il game sound engine deve fornire un'interfaccia per ricevere parametri real time dal game engine ed usarli, spesso mappandoli sulle frequenze cutoff di filtri o sul controllo di volumi piuttosto che pitch shifting.

#### Positioning

Come funziona l'audio in un gioco: **emitters** sono oggetti nello spazio tridimensionale che emettono suono e uno o più **listeners** (mono, stereo o multicanale; va pensato come un array di microfoni), in genere solidale col player.

E' un sistema che si occupa di calcolare in run-time le funzioni di trasferimento e i filtri da applicare al suono riprodotto per dare all'ascoltatore la percezione che gli emettitori si trovino immersi nello spazio virtuale circostante.

Il panning "_reale_" è più complcato rispetto ad una semplice variazione di volume tra i canali.
panning, multicanale (stereo, 5.1, 7.1, ambisonic (non usato), binaurale);
{: class="nota"}

---
Un esempio interessante per quanto riguarda il posizionamento del suono nello spazio lo si ha ad esempio nel gioco "_Hellblade: Senua's sacrifice_", sviluppato da [Ninja Theory](https://en.wikipedia.org/wiki/Ninja_Theory) e pubblicato pochi giorni fa.

In questo gioco l'[audio binuaurale](https://www.polygon.com/2017/8/9/16120082/hellblade-binaural-audio-psychosis) diventa importantissimo per rappresentare con efficacia le voci interiori della protagonista che soffre di un disturbo psichico.

<iframe width="100%" height="315" src="https://www.youtube.com/embed/LQQ2Jm2dgXk?list=PLbpkF8TRYizaT6GfMcKBG-RoUOQ6BJRXp" frameborder="0" allowfullscreen></iframe>

A proposito di binuaurale, mai sentito parlare del fenomeno denominato [ASMR](https://it.wikipedia.org/wiki/Autonomous_sensory_meridian_response)? Ecco un [interessante articolo](https://emshort.blog/2017/07/27/second-person-storytelling-in-asmr/) a rigurdo.
{: class="dashed"}

Nel gioco l'audio è [talvolta utilizzato](https://youtu.be/5-D57571odo?t=2m11s) come mezzo (quasi) esclusivo per riuscire ad orientarsi nel mondo tridimensionale.

#### Ambience

Parlando di sample, quando si registra si predilige il suono diretto e si fa di tutto per escludere quello riverberato
Questo perchè il suono d'ambienza viene calcolato in tempo reale da processori dedicati.
reverb, delay, doppler effect, filtering, fast realtime convolution.

#### Attenuation & damping

Due sfere concentriche centrate sulla posizione dell'_emitter_ nel 3D world. Le due sfere dividono lo spazio in 3 volumi.

![3D sound](./images/ed-agosto-settembre-2017/pt3/3D-sound.png)

Attenuazione e smorzamento: un discorso legato alla distanza tra emitter e listener, grandezza geometrica ricavata dal modello tridimensionale, in base alla quale viene modificato in tempo reale la frequenza di taglio di un filtro passa basso e un amplificatore di livello.

Lo stesso si applica in casi in cui ci sia un ostacolo tra emittere e listener: occlusione ottenuta con filtri opportunamente settati. Materiali diversi

#### Dialogues

![gabriel knight talking](./images/pt2/gabriel-talking.jpg)

Il game audio engine deve essere in grado di interfacciarsi e gestire complessi **database** di informazioni. Uno di questi è rappresentato dall'insieme degli audio file associati a tutte le varie linee di dialogo (in una o più lingue) presenti nel gioco.

#### Music

Il game audio engine deve essere in grado di gestire l'eventuale colonna sonora musicale interattiva (vedi ad esempio il sistema _iMuse_).

#### Alignement

Uno scenario in cui più giocatori prendono parte ad un partita multiplayer.
Un server preposto al controllo e al master clock per la ricezione e ridistribuzione dei pacchetti.
A seconda della contingeza ci possono essere latenze che si sommano e si accumulano, e possono essere diverse da caso a caso, e da giocatore a giocatore e cambiare nel tempo.

Il game engine, e più nello specifico l'audio engine per quanto concerne il suono, deve essere in grado di gestire situazioni come questa e di riordinare opportunamente i pacchetti in arrivo per dare un audio sempre corerente.

#### Encoding/Decoding, data streams

L'audio engine deve interfacciarsi con quella parte di software in carico di gestire gli accessi al disco e che si occupa del memory management. Da ricordare che l'audio è immagazzinato sul supporto in forma compressa in modo da risparmiare spazio di archiviazione, il che, nel momento della riproduzione, impone un pre fetching e un buffering per la decompressione prima dell'effettiva riproduzione.

### Suono come modello event based/data driven

![data driven](./images/graphics/data-driven.png){: width="60%"}

A ben vedere nell'ultima parte della sua storia, come analizzato fino ad ora, il suono nel videogioco si presenta come un modello guidato dai dati (**data driven model**).

In altri termini, è costituito da una moltitudine di file audio raccolti in un database e che vengono messi in riproduzione all'occorrenza, in seguito al verificarsi di particolari eventi (**event based**).

![event --> snd](./images/graphics/event-sound.png){: width="60%"}

Ai sample che vengono riprodotti si possono certo applicare delle **modificazioni in tempo reale** come abbiamo già detto (attenuazione dovuta alla distanza, combinazioni e layering, random e granularità).

A ben vedere però questo sistema basato sui sample audio sembra in contraddizione netta con il dominio visivo, caratterizzato invece da un comportamento **continuo** e guidato da uno stream di parametri piuttosto che da eventi **discreti**.

### Come funziona un FPS?

L'immagine che vediamo quando giochiamo **non esiste** prima del run time!

Consideriamo un semplice modello 3D costituito da 4 facce triangolari: occorrono 3 (OpenGL ne usa 4 in realtà) valori numerici corrispondenti ai 3 assi cartesiani per identificare la posizione di ciascuno dei suoi vertici nello spazio tridimensionale.

Un modello estrapolato da un moderno FPS tuttavia è composto da una moltitudine di poligoni, centinaia se non migliaia (_high poly_). Questi vertici e la loro configurazione nello spazio costituisce la **mesh** del modello ma da sola, non basta per creare l'illusione di realismo.

Serve una **texture** da poter mappare sulla mesh che riproduca fedelmente le caratteristiceh visive come colori e dettagli dell'oggetto ([UV mapping](https://en.wikipedia.org/wiki/UV_mapping)).

Perchè il modello possa essere visto nel mondo tridimensionale occorrono **luci**: ogni oggetto dunque, colpito dai raggi irradiati da tutte le fonti di luce presenti nel mondo virtuale, verrà descritto in modo ancora più realistico, in più se il modello riporta alcuni valori per le grandezze fisice associate ai materiali di cui è composto, come coefficienti di riflessione e assorbimento, e così via, l'effetto potrà essere ancora più realistico.

Moltiplichiamo il tutto per la moltitudine di modelli simultaneamente all'interno del mondo 3D virtuale e avremo quanto computato da una speciale componente del game engine, il **rendering engine** (che traspone il tutto su una superficie flat 2D), coadiuvato da componenti hardware che aiutano ad accelerare l'immane qunatitativo di calcoli richiesti.

L'interità dei modelli e delle loro mesh non sono fondamentali soltanto per ottenere una immagine 2D in uscita ma anche per creare la cosìdetta **word geometry** per il il calcolo e dell **collisioni**, indispensabili per prevedere e computare i comportamenti fisici.

Tutto questo è appannaggio del **physics engine** che non si occupa solo di collisioni ma valuta l'interà fisicità del mondo virtuale in cui siamo immersi: masse, densità, velocità e accelerazioni, forze, torsioni.

A tutto questo si aggiunge la componente di **intelligenza artificiale** che ha il compito di simulare comportamenti "_intelligenti_" per tutti quegli attori che, nel gioco, non sono comandati da un player umano.

Ebbene tutto questo viene calcolato di continuo, sempre in funzione dei dati di movimento ottenuti dalle azioni del giocatore, 60 se non più volte al secondo.

### Realismo (?!) / Suono come processo


Il sample audio è una registrazione, e come tale si tratta di un qualche cosa fissato nel tempo: una registrazione cattura la perturbazione della densità dell'aria, l'effetto di un movimento nello spazio in un particolare istante ma non ci dice nulla in merito al comportamento.

In questo senso l'audio fruito attraverso i campioni resta un procedimento **statico**, come un **interruttore** che può essere solamente acceso o spento, una **fotografia** fissa ed immutabile anzichè vivida e dinamica.

Ci potremmo chiedere quindi che significato ha la parola **realismo**? premesso che il realismo non è una condizione indispensabile, anzi, ci sono videogiochi (basti pensare a PacMan, o a diverse produzioni indipendenti come Fez, Limbo, etc...) che tutt'altro ci propongono rispetto ad una esperienza "_realistica_", ce ne occupiamo perchè la ricerca del realismo sembra essere stata forse "_IL_" motore principale per lo sviluppo tecnologico nell'abito dei videogames.

Basti pensare che si è passati al massiccio uso della grafica tridimensionale non appena le tecnologie lo hanno permesso (questo vale anche per il mondo dell'**animazione**). Si ricerca sempre una maggiore definizione dei modelli. Ci si avvale del supporto di potenti motori di fisica per simulare fedelmente i comportamenti quali collisioni, esplosioni, attrazione gravitazionale, spinta del vento, forze etc...
L'intelligenza artificiale contribuisce a rendere sempre più credibili i movimenti e le azioni di attori e creature npc e la lista potrebbe continuare a lungo.

In abito audio invece quello che si fa, in pratica, è "_premere il tasto play_" quando serve, il che sembra un po' **riduttivo**, soprattutto per il fatto che:

* il suono riveste un ruolo importante di guida emotiva all'interno del gioco;
* l'audio è una parte importante per mantenere viva la senzazione di realismo;

Inoltre, un approccio _data driven_ come questo ha i suoi svantaggi vediamo un paio di esempi:

#### La porta

Supponiamo di avvicinarci ad una abitazione sconosciuta. L'intento è quello di entravi senza destare l'attenzione di chi sta all'interno. Nel gioco guideremo il nostro avatar fin sulla soglia e, a questo punto, a seconda dell'ispirazione del momento, potremo aprire la porta di colpo e preciparci all'interno oppure socchiuderla lentamente e magari interromperci al primo sospetto di non essere soli.

![door](./images/esempi-procedurale/open-door.png){: width="50%"}

Secondo l'approccio tradizionale _sample based_ un campione preregistrato di scricchiolio viene riprodoto non appena si verifica l'evento "_collisione_" tra il nostro avatar e l'oggetto _porta_. Specie se l'audio file è lungo si nota che la riproduzione dell'audio file prosegue, anche se l'azione sulla porta si interrompe dopo breve.

Anche nel caso il game sound engine utilizzasse meccanismi di dissolvenza in uscita per temporizzare correttamente il livello, comunque risulterebbe chiara la disomogeineità tra i domini grafico e uditivo.

Immaginiamo cosa accadrebbe se poi scostassimo la porta ripetutamente, avanti ed indietro...

#### Lastra percossa

Alcuni oggetti come le campane o i tubi creano differenti suoni in base al proprio stato. un tubo che è già in vibrazione e che venga colpito in un punto diverso, incorporerà le nuove eccitazioni nel pattern di vibrazione a creare un suono diverso rispetto a quello che avrebbe fatto se colpito in stato di quiete. Niente di simile è ottenibile usando i campioni.

![plate](./images/esempi-procedurale/steel-plate.png){: width="50%"}

Immaginiamoci con un arma di fronte alla fortificazione di un piccolo bunker dal quale dobbiamo stanare i nostri nemici. Cominciamo a sparare e colpiamo ripetutamente una delle lastre di metallo che rivestono l'esterno della costruzione.

Ad ogni impatto (di un proiettile sulla lastra) la lastra viene eccitata e di tutti i possibili modi strutturali saranno quelli primari ad assorbire il maggior quantitativo di energia e, come risultato, percepiremo sempre più chiaramente le frequenze di risonanza della lastra mano a mano che i proiettili continuano ad incidere su essa.

Lo stesso effetto non è ottenibile riproducendo lo stesso audiofile ripetuttamente per ogni nuovo impatto.

---

Il suono insomma risulta essere malamente accoppiato con il motore di gioco sottostante, incoesivo con l'esperienza complessiva. Eppure non è sempre stato così. All'inizio della storia dei videogame, delle console e dei computer, era l'audio la motivazione principale che ha guidato lo sviluppo tecnologico.

L'audio veniva generato in tempo reale e rispecchiava linearmente le azioni del giocatore e le reazioni dell'engine. L'audio veniva sintetizzato in tempo reale.
Questa tendenza si è interrotta indicativamente attorno alla seconda metà degli anni '90, momento storico dove si può collocare la comparsa sul mercato dei prini CD e che vede il diffondersi dell'audio campionato ad alta qualità (44100@16bit).

Attenzione, questo **non significa che in passato i sample non venissero utilizzati**; Nintendo, SEGA e ancora prima nelle coin-op, dove possibile, si inserivano sistemi DAC in grado di riprodurre, seppure non con la stessa qualità CD, campioni e sample pre-registrati, soprattutto per la voce. La ricerca del "_realismo_" tuttavia ha infine soppiantato i sistemi di sintesi tradizionale.

---

Semplicemente significa che, forse, i "trucchi" descritti poco fa, usati normalmente per ridurre o mascherare la ripetitività, sono in realtà dei rimedi temporanei.

Un modo alternativo, mutuato dalla storia del videogioco, è quello di pensare il sonoro come **sintetico**: in questo modo due suoni associati allo stesso evento non suonerebbero mai esattamente allo stesso modo.

Si tratta in fondo di una caratteristica peculiare della sintesi sottrattica, la quale fa uso del rumore come forma d'onda base.

Non esistono due esempi dello stesso tipo di impatto, a fare uso di eccitazione con noise e formanti del materiale, che abbiano la stessa composizione spettrale.
{: class="nota"}

Anche se le differenze potrebbero essere estremamente sottili, il nostro **cervello** ha la capacità particolare di riconoscere queste sorgenti come "_vive_".

---

Tali sistemi però sono sopravissuti in una parte del mercato legato all'audio: la **musica** e gli **strumenti musicali**. In questi campi ci si accorge subito dell limitazion intrinseche dell'audio per campioni (il sample è un _tradimento_ della realtà), per questo la ricerca e lo sviluppo di nuovi sistemi di sintesi continua a progredire.

Nascono i primi sistemi di sintesi basati su modelli: i fenomeni della fisica del suono vengono studiati e sintetizzati in modelli matematici e poi innestati all'interno dei circuiti integrati o dei software per computer.

Quando si vuole simulare i suoni dei vecchi sintetizzatori analogici, si sviluppano tecnologie volte a riprodurre in digitale tutte le idiosincrasie dei componenti elettrici discreti che li costituivano e nascono i modelli [virtual analog](https://en.wikipedia.org/wiki/Analog_modeling_synthesizer).

![virtual analog](./images/ed-agosto-settembre-2017/pt2/virtual-analog.jpg)

Quando invece si vuole simulare strumenti musicali acustici o elettroacustici nascono modelli volti a riprodurre i fenomeni fisici delle sollecitazioni, vibrazioni, attenuazioni dei materiali: nasce il [physical modelling](https://en.wikipedia.org/wiki/Physical_modelling_synthesis).

![physical modelling](./images/ed-agosto-settembre-2017/pt2/physical-modelling.jpg)

Esistono da diversi anni scuole di pensiero volte a traslare questi metodi di sintesi, da tempo diffusisi sul mercato e molto apprezzati per le loro qualità, nel mondo videoludico.

Pionieri di questa filosofia di pensiero sono persone come [Perry Cook](http://www.cs.princeton.edu/~prc/AKPetersBook.htm) e [Andy Farnell](https://mitpress.mit.edu/books/designing-sound), solo per citare i più noti, i quali ritengono possibile derivare dagli studi fatti fino ad ora, modelli finalizzati non tanto a simulare suoni appartenenti al dominio musicale ma piuttosto volti a sintetizzare una moltitudine di classi sonore associate ad oggetti e fenomeni quotidiani.

<table>
<tr>
<td>
<img src="./images/pt2/book-Perry-Cook.png" alt="Perry Cook's book" width="100%;" />
</td>
<td>
<img src="./images/pt2/book-designing-sounds.jpg" alt="Andy Farnell's book" width="100%;" />
</td>
</tr>
</table>

Così da rendere possibile la sintesi, potenziale, di ogni tipo di suono possibile.

Da questo punto di vista il suono nel videogioco diventa un modello inteso come processo (**sound as a process**), in contrasto con il paradigma precedente di _event driven/data driven model_.

Il termine spesso associato a questo paradigma è **audio procedurale**, eccone una definizione:

> “Procedural audio is non-linear, often synthetic sound, created in real time according to a set of programmatic rules and live input.” – "[An introduction to procedural audio and its application in computer games](http://cs.au.dk/~dsound/DigitalAudio.dir/Papers/proceduralAudio.pdf).” by Andy Farnell

Processo guidato da uno stream continuo di dati provenienti dall'interazione dell'utente, manipolati e usati come parametri per controllare in tempo reale una serie di algoritmi che sintetizzano audio.

A ben vedere il concetto di audio procedurale non ci è del tutto estraneo; un esempio a cui siamo abituati è il _riverbero artificiale_.

![behaviour, model, implementation](./images/graphics/beh-mod-impl.png){: width="30%" }

TODO: classi di modelli (tassonomia)
TODO: perchè scegliere il procedurale e quando sceglierlo.

### Vantaggi e svantaggi del paradigma procedurale

Tra i vantaggi possiamo considerare:

#### Differimento

metre l'atto di registrare un suono è un azione che fissa nel tempo senza lasciare alcune possibilità di intervento successivo, l'audio procedurale è dinamico e lascia che molte delle decisioni, anche strutturali, vengano rimandate al real-time;

#### Variabilità

Caratteristica fondamentale del suono procedurale che garantisce la possibilità pressochè completa di modificazione del suono in tempo reale e di produrre in questo modo risultati sonori anche molto diversi tra loro pur facendo capo ad uno stesso modello.

#### Default forms

dal momento che la **crescita** dei sounds assets è **combinatoria** (es. incudine martello), diventa difficile provvedere alla creazione di tutti i suond assets necessari mano a mano che il mondo virtuale cresce. Il vantaggio di un modello procedurale è che il suono può essere generato in modo automatico derivando le proprietà dagli oggetti presenti nel gioco. Questo **non elimina** la figura del **sound designer**, il quale interviene laddove alcuni suoni necessitino di particolari caratteristiche perchè più importanti per la narrazione, ma **garantisce** che ogni oggetto abbia sempre un **suono di default** associato, senza incorrere così nel rischio che qualche evento sonoro non possa essere triggerato.

#### Costo variabile e dinamico (Dynamic Level of Details)

Il suono sintetico si dimostra vincente rispetto all'approccio _data driven_ quando si debbano descrive ampie scene con innumerevoli sorgenti sonore (tra 100 e 1000 sorgenti concorrenti).

I dati sottoforma di campione hanno un costo fisso (lo streaming dati da disco non cambia se il suono deve essere riprodotto completamente dry oppure deve subire real-time processings).
Inoltre, la densità di suoni che possono essere riprodotti in una scena ha un limite:
* sia in termini di accuratezza del mix dei vari suoni (più suoni = più difficile sommarli tra loro, problemi di dinamica e saturazione);
* sia dal punto di vista psicoacustico (alcuni dei contibuti sonori sono inutili all'atto pratico perchè non posso essere uditi per via dei diversi mascheramenti, in tempo o in frequenza).

Già quando si arriva a sommare 100 suoni simultanei, si può vedere che il contributo di ogni nuovo suono aggiuntivo, in rapporto al costo computazionale associato, diminuisce.

D'altro canto, una approccio sintetico può offrire un costo variabile ad ogni sorgente: un esempio potrebbe essere il suono di un bicchiere che si infrange cadendo a terra.

Un metodo sintetico potrebbe produrre un suono molto "_realistico_" e mantenere ancora un alto grado di correlazione audio-video rimpiazzando i frammenti perimetrali con singoli segnali sinusoidali o granuli di rumore, fornendo un alto grado di dettaglio per quie frammenti che cadono vicino al player.

---

Il paradigma procedurale permette il LOAD - Level Of Audio Details - (che sfrutta le conoscenze in ambito di acustica e psico-acustica) caricamento dinamico sulla CPU esattamente come già fa la parte grafica cone il **mipmapping**.

Consideriamo una esempio quale potrebbe essere un suono in grande lontananza:
nel caso di un motore audio tradizionale, al suono verrebbe applicato notevole processing DSP in tempo reale da far sì che il sample - attenuato e filtrato - dia l'impressione di provenire da lontano. Tuttavia, nonostante il suono ne risulti pesantemente modificato rispetto all'originale, comunque il costo in termini di risorse sarebbe invariato rispetto alla normale riproduzione di un audio file.

Nel caso il problema venga affrontato con il paradigma procedurale invece, soprattutto facendosi forti del fatto che il modello è stratificato e costituito da più parti indipendenti tra loro, il carico di lavoro potrebbe essere ridotto: certe componenti del suono, proprio per via del fatto che la sorgente sonora è ascoltata da grande distanza, potrebbero essere del tutto tralasciate rispetto ad altre. Il lavoro del processore sarebbe avvantaggato.

Lo stesso dicasi se il suono riprodotto da un modello si trova riprodotto in associazione con altri suoni che causerebbero il _mascheramento_ nel tempo o in frequenza di alcune sue componenti.

#### Real Time

Talvolta è semplicemente impossibile conoscere a priori quale sarà il suono da registrare (o il tipo di processing cui sottoporlo).

Esempio di audio procedurale in "_No Man Sky_" (raycasting per procedural occlusion, tool interno per sintesi di vocalizzazione di creature aliene: _VocAlien_).

Tra gli svantaggi:

#### Industrial inertia: you gotta ship titles

Al momento attuale non sembra ci sia interesse nell'implementare quanto necessario per inserire questo paradigma nel workflow per la produzione di giochi. Spesso in questi casi ci si scontra con metodi di lavoro consolidati che sono difficili da modificare, soprattutto per via dei costi e dei tempi necessari per la transizione.

#### La sintesi è brutta (si fa per dire)

>"Il tutto è più grande della somma delle sue parti." (Ludwig Von Bertalanffy)

Permane la falsa concezione che la sintesi audio sia in qualche modo sinonimo di finzione (sintesi = suono "_di plastica_") e, come tale, sia qualcosa di insoddisfacende, di deludente.

In realtà non è così e, se anche lo fosse, il ragionamento non sta in piedi in quanto il **realismo** non serve!
Lo sanno bene i sound designer e tutti coloro che, in generale, hanno già qualche esperienza nel mondo dell'intrattenimento, il realismo spesso delude. Quello di cui c'è bisogno è il **verosimile** (come dice molto bene [Chion](http://www.lindau.it/Libri/L-audiovisione.-Suono-e-immagine-nel-cinema)) o addirittura dell'**hyperrealism** ("_more than reality_").

### New skills
TODO

### The Future

In un futuro presumibilmente non troppo lontano, il paradigma procedurale avrà preso piede e il mondo del lavoro nel settore dell'audio per videogiochi si arricchirà di tutta una serie di nuove figure professionali.

![water](./images/pt2/future-water.jpg)

Proprio come negli ultimi 20 anni sono nate specializzazioni di ogni tipo nel mondo della computer grafica (professionisti che si occupano esclusivamente di _rigging_, _textures_, _animazione_, _modellazione_, _light_, _visual fxs_, etc...), così anche nel mondo dell'audio procedurale ci saranno nuove figure speciallizzate nella modellazione di suoni e fenomeni fisici differenti (acqua e [bolle](http://www.cs.cornell.edu/projects/Sound/bubbles/), fuoco, [fracture sound](http://www.cs.cornell.edu/projects/FractureSound/), impatti, [frizioni e sfregamenti](http://independent.academia.edu/StefaniaSerafin), [accartocciamenti](http://www.cs.columbia.edu/cg/crumpling/), [acustica delle stanze](http://www.ness-music.eu/wp-content/uploads/2013/04/TASL2256897.pdf), etc...).

#### Animation driven by audio

C'è addirittura chi si specializza nel processo inverso, ovvero nel ricreare animazioni basandosi sul suono in una sorta di [**inverse fooley**](http://www.cs.cornell.edu/projects/Sound/ifa/), il che può portare a risultati davvero sorprendenti:

<iframe width="100%" height="315" src="https://www.youtube.com/embed/EGkQkdCKztM?start=130" frameborder="0" allowfullscreen></iframe>

Se, come spesso accade, l'audio è considerato come accessorio e secondario rispetto alla parte grafica/visiva, ci sono tuttavia alcuni casi in cui questo andamento è ribaltato: `event --> sound` diviene qui `sound --> event`.

**Automatic lip sync**: un sistema studiato da moltissimo tempo per animare grafiche e modelli 3D in modo automatico basandosi sul segnale audio (vedi [patent Sierra](https://patentimages.storage.googleapis.com/c3/e3/32/01720ae146f119/US5430835.pdf)).

![sierra lip sync](./images/ed-agosto-settembre-2017/pt2/sierra-lipsync.jpg)

**Procedural animation**: [Tom Clancy's Ghost Recon Advanced Warfighter 2](https://en.wikipedia.org/wiki/Tom_Clancy%27s_Ghost_Recon_Advanced_Warfighter)) (Ubisoft 2007) case study: un aeroplano precipitato nel deserto esplode e continua a bruciare a terra. Le fiamme sono sferzate a destra e a sinistra da un vento irregolare. Polvere e fumo sono generati proceduralemtne in base al livello dell'audio pre-prodotto (vedi [questo talk](http://www.gdcvault.com/play/1017780/Crossing-the-Streams-Game-Audio) di Scott Selfon al minuto 23:14)!

---

<a id="pt3"></a>
## Pt3: Game Sound workshop

### FMOD
TODO

Concetti di:
* "_one project per game_";
* uno o più game events possono essere associati al medesimo eevento in _fmdo_ e triggerarne diverse istanze;
* modules --> sound modules --> one or more trigger regions (play until mouse leaves the trigger region);

![3d Panner](./images/ed-agosto-settembre-2017/pt3/3D-panner.png)

* 3D panner
  - min and max distance
  - attenuation curve
  - sound size
  - min extent (eventualmente impiegato per sovrascrivere per sovrascrivere quanto impostato con gli altri parametri)
* pt motors / parametrization
* pt footsteps
* pt music

---

#### Implementazione usando la sintesi
TODO

tipologie di suono: classi sonore relativamente piccole, canne, lastre di metallo o corde possono essere programmate con relativa facilità usando sorgenti di tipo generico.

#### Physical modelling

![PM vs. PIM](./images/graphics/physically-inpired-model.png){: width="80%"}

physical modelling / physical informed modelling (differenze)
Waveguide (difetto: uso della memoria per implementare delay per la propagazione e i risuonatori)
MSD (Mass, Spring, damper)

tipologie di suono: questo approccio lavora bene per "_dropped sound_", collisions, tubi o lastre percosse, eccitazione di strutture fisse.

#### Granular approximation

Utile l'analisi statistica della densità

tipologie di suono: suoni con struttura eterogenea, onde che si infrangono sulla spiaggia, pioggia, grandi gruppi di persone (ae esempio il suono degli applausi).

---

### PureData: esempi di audio procedurale e musica generativa

Abbiamo detto che il paradigma del suono procedurale prevede una stratificazione delle diverse fasi. Questo significa che ciascuna di esse può essere svolta con un particolare strumento hardware o software piuttosto che un altro, a seconda delle esigenze del progetto o delle particolari propensioni del suond designer.

![behaviour model implementation](./images/graphics/beh-mod-impl.png){: width="40%"}

Tipico è il caso del layer di _implementazione_: in questa fase infatti qualsiasi strumento software può essere usato per implementare il modello. Esistono infatti svariati linguaggi che possono essere utilizzati per la fase di implementazione (Supercollider, Csound, Faust, C++ via STK, Chuck, etc...). Ogni linguaggio possiede determinate caratteristiche che lo rendono più indicato per un task specifico.

Parleremo di Pure data, che sembra essere un valido compromesso in termini di efficienza, facilità di apprendimento, di integrazione in altri tipi di sistema come può essere un game engine esistente (grazie in particolar modo a progetti software di integrazione come libpd, vedi sotto).

Pure Data, come Godot, è _free software_ quindi aperto per essere modificato ed esteso liberamente.

#### Introduzione al linguaggio di programmazione PureData

Che cosa è PureData? [PureData](http://puredata.info/) è un linguaggio di programmazione a nodi nato a metà degli anni '90 ad opera di Miller Puckette che all'epoca lavorava all'IRCAM di Parigi.

Pure Data è un linguaggio di programmazioni a paradigma _dataflow_ e, sebbene manchi di ricorsione e di una effettiva accuratezza "_al sample_" nell'implementazione di filtri FIR, IIR, è uno strumento molto produttivo e permette di risolvere il 90% dei problemi di sound design sintetico.


Uno degli obiettivi cui si è interessati è quello di fare il minor uso possibile della memoria (evitando quini, ove possibile, lookup table, ring buffers per dly, etc...). Si usano dunque i troncamenti delle approssimazioni in serie di Taylor delle varie funzioni anzichè ricorrere a lookup tables, il rumore è generato come numeri pseudo casuali, etc...
<br/><br/>
Perchè evitare l'uso della memoria? Uno dei motivi è quello di facilitare l'esecuzione del codice in un ambiente multithread, in cui i diversi thread sono distribuiti su più processori.
{: class="dashed"}

---

Vedremo ora alcuni esempi tratti dal lavoro di _Andy Farnell_, il quale usa PureData come linguaggio di programmazione (thanks to _Andy Farnell_, _Alexey Reshetnikov_ and _Rod Selfridge_).

#### Material and structure

* **telephone**: bakelite resonators

#### Wind

Il vento in sè non produce suono (molto interessante a tale proposito il [seminario "_Squeezing out noise_"](https://vimeo.com/89488861) di Chris Woolf, technical consultant per _Rycote_)


#### Water
TODO

#### Machines

Vale la pena di sottolineare che tutti i suoni prodotti dalla macchine sono il risultato di un qualche tipo di inefficienza e di frizione: in teoria, la macchina perfetta non emette alcun rumore.

* **electric motors**:

* **fans**: il suono macchine come le ventole degli impianti di areazione, le quali funzionno di continuo, è più soggetto a problematiche di _ripetizione_. Se il suono viene generato per mezzo della sintesi (usando come base il rumore in questo caso) ecco che il problema è risolto: il suono acquista una caratteristica _viva_ e il cervello non è più in grado di identificare alcun _pattern_.

* **elicopter**:

* **clocks**: Il suono di un orologio che ticchetta può essere realizzato sovrapponendo diverse componenti più semplici per ottenere un risultato finale organico. Interessante a tale proposito l'[aneddoto raccontato dallo stesso Farnell](https://youtu.be/sp83-Pq7TyQ?t=57m50s) in un seminario sull'audio procedurale all'AES nel 2013 in cui ricorda d'avere analizzato il suono di una sveglia dopo averlo registrato ad alta risoluzione e riprodotto a velocità ridotta.

* **creaking**: movimento [_slip-stick_](https://en.wikipedia.org/wiki/Stick-slip_phenomenon). Un segnale di controllo (che simboleggi la forza impiegata nel movimento) che varia da 0 e 1 produce una serie di impulsi in uscita. Questi passano attraverso una serie di filtri passabanda per riprodurre le formanti di una struttura _quadrata_ in _legno_.

Di seguito alcune belle animazioni che mostrano i _modi_ principali per una membrana rettangolare, tratte dalla [pagina](http://www.acs.psu.edu/drussell/demos.html) del professor Daniel Russel della _Pennsylvania State University_.

<table style="width=100%">
<tr>
<td>
<img src="http://www.acs.psu.edu/drussell/Demos/MembraneSquare/mode11.gif" alt="11" style="width:100%" />
</td>
<td>
<img src="http://www.acs.psu.edu/drussell/Demos/MembraneSquare/mode12.gif" alt="11" style="width:100%" />
</td>
<td>
<img src="http://www.acs.psu.edu/drussell/Demos/MembraneSquare/mode21.gif" alt="11" style="width:100%" />
</td>
<td>
<img src="http://www.acs.psu.edu/drussell/Demos/MembraneSquare/mode22.gif" alt="11" style="width:100%" />
</td>
</tr>
</table>

![rectangular membrane formulae](./images/ed-agosto-settembre-2017/pt3/godot/door.png)

Sicuramente da approfondirne le caratteristiche: [Frame3dd](http://frame3dd.sourceforge.net/). Un software libero per studiare le dinamiche strutturali statiche e dinamiche. Che possa esserci utile nell'analisi dei modi?
{: class="dashed"}

---

Per utilizzare [questi esempi](https://github.com/Limulo/game-sound-sae2017/tree/master/resources/procedural/PureData_examples) è necessaria l'installazione di [PureData](http://puredata.info/) e delle seguenti librerie aggiuntive:
<br/>
* list_abs (for the **[list_dot]** and **[list_emath]** objects);
* zexy (for the **[>~]** and **[<~]** object);
* iemlib (**[prvu~]**, **[init]**, **[t3_bpe]**, **[t3_line~]** and **[t3_delay]** objects);
* motex (**[ln~]** object);
* lyonpotpourri (**[adsr~]** object);
* creb (**[ead~]** object);
* cxc, cyclone, purepd (**[Uzi]**, **[acos]**, **[atan~]**, **[delta~]** objects);
* ggee (**[image]** object);

### Godot: audio architecture

[Godot](https://www.patreon.com/godotengine) è un game engine libero!

![godoto audio architecture 1](./images/ed-agosto-settembre-2017/pt3/godot/scene-servers-drivers)

TODO: immagine audio server / audio player / stream / sample / architecture


Interrogato dal **driver**, l'**audio server** deve fornire lui tutti i _samples_ (campioni audio 32 bit) di cui ha bisogno.

Per farlo deve copiare i dati immagazzinati nel proprio _internal buffer_ sul _p_buffer_ che il driver gli ha fornito.

Ad ogni richiestadel driver, l'audio server passa in rassegna tutte le **voci** (esaminandone con cura la _coda dei comandi_ rispettiva in modo tale da sapere se la voce deve essere riprodotta, messa in pausa, eliminata dalla codam etc...) e chiede al **mixer** di mixarle. In seguito si passa ad analizzare gli **stream** e a scrivere infine sul _p_buffer_.

Il **mixer** elabora l'audio che passa attraverso i suoi **canali** provvedendo eventualmente a calcolare eventuali **effetti** da applicare sull'audio passante. Una volta fatto questo, copia i dati contenuti sul proprio _internal_buffer_ a quello dell'_audio_server_.

L'**audio player**:

Lo **stream player**:

L'**event player**:

#### Godot & libpd integration

Il software libero è vincente in quanto consente l'accesso diretto al codice sorgente rendendo più veloci e agili integrazioni, modifiche e migliorie altrimenti impossibili in progetti software proprietari.

In questo modo ci è stato possibile avviare un progetto di integrazione in Godot dell'engine audio _PureData_ grazie al wrapper [libpd](http://libpd.cc/) ideato da Peter Brinkmann.

![PD-Player](./images/ed-agosto-settembre-2017/pt3/godot/Pd-Player.png){: width="60%"}

#### Call for partecipants

Il progetto è ancora in fase embrionale ma contiamo di refinirlo sempre più per poi rilasciarlo ufficialemtne al pubblico in modo che tutti possano avvantaggiarsi anche di un audio _veramente_ procedurale all'interno di Godot.

[Qui](https://github.com/Limulo/godot) il link al repository sul quale _limulo.net_ sta facendo i primi test: ogni contributo è benvenuto!

---

## References

Vai alla pagina [references](references) per maggiori informazioni.
