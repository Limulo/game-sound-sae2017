# Che cos'è un videogioco? - Dichiarazione d'intenti

Un videogioco è la declinazione moderna più diffusa e pervasiva del gioco.
Il gioco è un'attività che accompagna da sempre la storia dell'uomo. Se ne ritrovano esemplari molto antichi, che non si discostano molto dai giochi ai quali siamo abituati noi.
Per gioco intendiamo una **narrazione** guidata dalle **scelte** che uno o più giocatori compiono in conformità ad un insieme di **regole** che limtano il campo d'azione.
Un gioco è quindi uno strumento di intrattenimento, come un film, un libro. Si distingue da queste forme espressive, però, in virtù della propria **interattività**, privilegiando ad una narrazione lineare una narrazione a salti, non determinata a priori, ma emergente dall'interazione tra giocatore e gioco.
Il videogioco si distingue intoltre da altre forme di gioco in quanto punto di convergenza di diversi elementi eterogenei ta loro. In questo senso il videogioco è un **prodotto** di intrattenimento ( ma non solo ) **multimediale**, che si avvale cioè di almeno un paio di mezzi espressivi differenti (grafica, audio, animazione, testo, interfaccia utente, controlli hardware).

Il videogioco è un software; un software molto complesso, capace di raccogliere input provenienti da differenti domini e di farli coesistere in maniera coerente all'interno
di un unico ambiente.

Di tutti i domini che concorrono a creare un videogioco ci concentriamo sulla sua componente audio, studiando l'evoluzione della tecnologia e delle tecniche nel corso della storia per meglio capire dove siamo arrivati, perchè e come possiamo inserirci professionalemnte nel panorama contemporaneo.

Facciamo attenzione a quelli che sono i problemi principali che si sono dovuti affrontare nella creazione di audio per videogiochi:

* la gestione dell risorse (scarsità di memoria)
* difficoltà di programmare audio e di comporre in codice

E teniamo in considerazione fattori come:

* ruolo dell'audio nel gioco
* gestione dinamica del suono (transizioni)

# Once upon a time ...

Citiamo per amor di completezza quelli che sono considerati i due antesignani dei videogiochi. Siamo alla fine degli anni '50-inizio anni '60, in USA, nelle università.
1958: tennis for two
1962: spacewar! [foto]
Si tratta di software sviluppato sui supercomputer dei cintri di rricerca, più sperimentazioni e simulazioni che veri e propri videogames. Dovremo attendere la fine degli anni '70 per avere i primi giochi su computer.

# intanto in sala giochi...

Immaginiamo di essere nel XV secolo. Nelle corti si pratica un gioco che consiste nel guidare il percorso di sfere di metallo/legno facendo attezione ad evitare alcune buche.
Negli anni '30 questa idea diventa il ballyhoo, progenitore del pinball, che a sua volta spinge alla creazione delle cosiddette coin-operated machines, o coin-op. I cabinati.

Ci spostiamo quindi in sala giochi.
Siamo alla fine degli anni '60 / inizio anni '70, le coin-op montano componenti elettrici discreti, collegati tra loro attraverso cavi che si congiungono in schede madri. C'è sicuramente uno stadio di ventilazione per raffreddare le parti meccaniche che si surriscaldano per l'utilizzo.
In una sala giochi ci sono molte coin-op che funzionano simultaneamente e ininterrottamente.
Il suono serve quindi ad attirare l'attenzione e ad invitare a giocare. Viene rubata l'idea al suono delle slot machine, ovvero al suono della vincita ( la perdita non ha suono). Tante macchine corrispondono, statisticamente, a tanti suoni di vittoria, invitando gli avventori a tentare la fortuna, facendo credere in una fcilità di vincita.
Il suono è  slegato dal gioco. La musica è quasi assente e gli effetti sonori sono funzione del gameplay (se un evento richiede molte risorse l'audio è sacrificato ed il gioco rimane muto). Si implementa sintesi sottrattiva.

La programmazione audio avviene con collegamenti diretti di cavi al chip ( o se va bene il linguaggio macchina o in assembly).
Questa caratteristica fa sì che ogni macchina suoni in maniera differente rispetto alle altre, anche se il gioco che montano è il medesimo.

[time line]

Lo sviluppo per arcade decade a inizio anni '90, e cessa definitivamente a fine anni '90.

# una sala giochi in salotto

## porting

Il mercato degli arcade è rimasto a lungo il settore leader per i videogiochi. Tanto da trainare la creazione, sviluppo e successo di altre tecnologie, come le home consoles. E' infatti grazie al porting di giochi per arcade che le home console si sono imposte sul mercato. Come per le coin-op, si fa uso di sintesi sottrattiva.
Nel 1972 esce Magnavox Odyssey.
E' nel 1975 però che le home consoles hanno un boom con il porting di Pong per la home console di Atari. Il successo è stato tale che nel giro di un anno sono nate quasi un cventinaio di compagnie che offrivano una propria home console con un gioco simile a Pong.
Il chip che Atari usa per Pong (General Instruments AY-3-85-00) viene chiamato "Pong chip". Il chip è responsabile anche di generare il suono per il gioco. Tutte le altre compagnie usano lo stesso chip, quindi tutti i giochi pseudo-pong hanno lo stesso suono. Quel suono diventa marca sonora di un gioco, un genre ed un'epoca.
Un paio d'anni dopo Atari sviluppa il VCS (Video Computer System) - noto dall'82 come Atari 2600 - che sbanca sul mercato grazie al porting di Space Invaders.
Il VCS offre, a livello audio, 2 canali e la possibilità di selzionare la forma d'onda. Tuttavia i due canali hanno ciascuno un proprio tuning e, per la modalità di creazione del tune set, le note generate non appartengono ad alcuna scala, ma si discostano di alcuni (anche parecchi) centesimi di semitono (differenti tra PAL e NTSC).
Mattel sviluppa Intellivision, un sistema che era pensato per essere espandibile e funzionare come strumento general purpose. Una di queste espandìsioni offre un sound chip aggiuntivo, arriavando a offrire 6 canali audio (record per l'epoca).

Il porting di giochi da arcade pone dei problemi per quanto riguarda la musica. A livello compositivo si predilige l'uso di loop di sequenze sonore (soprattutto dagli anni '80). Le transizioni tra scene o eventi nel gioco non vengono trattate, ma si lasciano hard cuts. Tuttavia l'utilizzo delle console in ambiente domestico fa mutare la funzine della musica da un richiamo urlato e fuori dal gioco a un suono più immersivo e non fastidioso, adatto all'ambiente domestico.

Negli anni '80 fanno l'ingresso sul mercato i PSG (Programmable Sound Generator), ovvero sintetizzatori basilari o DAC.
Il più famoso PSG è General Instruments AY-3-8910 usato in moltissimi arcade, in Intellivision, in ZX Spectrum e in Sega Master System.
Il suono si arricchisce e nuove possibilità creative si aprono, prevalentemente nello sviluppo di effetti sonori.

## maturazione delle console

### NES

A metà anni '80 il mercato delle console ristagna, saturo di una miriade di giochi tutti molto simili tra loro.
Una ventata d'aria fesca arriva nel 1983 con il Colecovision di Coleco che viene distribuito con Donkey Kong (Nintendo).
Nel 1985 Nintendo entra nel mercato delle home console con il NES, distribuito con Super Mario. Nel 1986 Nintendo rilascia The legend of Zelda.
Le home console si distaccano dal mondo arcade e iniziano a camminare con le proprie gambe.

Il NES monta un PSG proprietario che garantisce 5 canali audio (2 pulse, 1 tri, 1 noise, 1 DCM). La tecnologia è a 8 bit, ma l'audio prodotto è innovativo.
La gestione della memoria è ancora conflittuale, effetti e musica rivaleggiano per l'appropriazione delle risorse. Per risparmiare spazio in memria si fa largo uso di loop.
A seguito del successo del NES NIntendo abbandona lo sviluppo per arcade.

### Genesis

Diventa leader nello sviluppo per arcade Sega, che sfrutta i titoli su coin-op per lanciare le proprie conosole.
Al Sega Master System fa seguito il Sega Genesis (o Mega Drive) a 16 bit.
L'avvento dei 16 bit rendo possibile la sintesi FM, quindi il suono diventa più definito e ricco e la musica assume un'importanza maggiore nel gioco e per la prima volta acquisisce pari importanza rispetto agli effetti sonori come valore narrativo.

Il Genesis monta un PSG 3+1 (texas instruments SN76489) e un chip Yamaha per FM (YM2612) 6 canali + 1 campionatore.

La programazione audio rimane difficile, si basa ancora prevalentemente sulla conoscenza dell'hardware (si programma tramite cassette).
Quindi si riutilizzano più suoni per diversi giochi (**NOTA** inizia a emergere il concetto di riutilizzo delle risorse)
Esempio: In "Shadow of the Beast II" (1992, Psygnnosis) l'organo a onda quadra è lo stesso di "Fatal Rewind" (1991, Psygnosis) che a sua volta condivide il suono di flauto con "Misadventure of Flint"(1993).

Alla tadizionale tecnica del loop si associano soluzioni creative per offrire una sensazione di variazione maggiore: la trasposizione di frasi sonore e la tecnica del double tracking.

<div style="width:100%;">
<audio controls>
  <source src="./music/Sonic_Labyrinth.ogg" type="audio/ogg">
Your browser does not support the audio element.
</audio>
</div>


Le musiche implementate nei giochi per Genesis sono esempi di una nuova sensibilità che si manifesta

* nella scelta degli strumenti e della loro interazione all'interno della composizione musicale (fiati, violini, tastiere al posto di chitarre);
* nella struttura della stessa, con piccoli riff e frasi ripetuti, sorretti da un suono di basso continuo;
* nella scelta di armonia modale, con richiami a ambienti esotici ed evocativi

### SNES

Successore del NES è il SuperNES (SNES) che monta molti elementi per la creazione e la gestione audio, tra cui un DSP Sony. Questo DSP permette di utilizzare la sintesi a wavetable, quindi superando anche il Genesis dal punto di vista di qualità dei suoni prodotti. Nintendo tuttavia preferisce rimanere su suoni che richiamano i chiptune del NES e stilisticamente richiamare genri musicali in voga al momento, come dance, hard rock, hip hop.

[esempio endorsement -

[Cliff Hanger](https://youtu.be/dnXvGAtdhL8?t=20s)

<iframe width="100%" height="315" src="https://www.youtube.com/embed/dnXvGAtdhL8" frameborder="0" allowfullscreen></iframe>

[Moonwalker](https://youtu.be/r37TJdTI5M0)

<iframe width="100%" height="315" src="https://www.youtube.com/embed/r37TJdTI5M0" frameborder="0" allowfullscreen></iframe>

---
Sega mostra un'attenzione particolare per l'audio. Ne è un esempio il Sega Dreamcast del 1998, a 128 bit. Il Dreamcast monta un processore audio dedicato con una memoria dedicata che permette un accesso non concorrenziale alla memoria del sistema.
Ma non ha successo e Sega scompare dal mercato.
---

### PS1, PS2, PS3, Xbox : verso il PC

Con Sony Playstation 1 nel mercato delle home console fa il suo ingresso il CD ROM, che si porta dietro il CD audio. La qualità audio aumenta, lo spazio su CD è maggiore rispetto a quello delle ROM. Si possono creare molti suoni e creare layer complessi. Ma a scapito dell'interattività e della dinamicità.
Non si risole ancora la gestione delle transizioni, che rimangono hard cuts.

La qualità audio continua a creascere, superando la qualità CD (si arriva a 48KHz), fino ad arrivare a PlayStation 2 che introduce il DVD ROM.
Playstation 3 ha il supporto per il surround e permette lo stream audio 7.1 a 96KBs.

L'architettura delle console si complica, iniziano a montare microprocessori simili a quelli dei moderni computer e le loro funzionalità si diversificano sempre più, facendo della conosole uno strumento più general purpose rispetto al mero gioco. Il sogno di Intellivision si realizza.

Non a caso entra nel mercato delle console anche Microsoft con Xbox. Da console di gioco si passa a lettore CD /DVD /BlueRay /streaming online.

# I computer

## I primi computer

Se agli albori i PC erano macchinari ingombranti appannaggio delle università e dei centri di ricerca, dal 1977 diventano uno dei mezzi preferiti per giocare.
Wozniack stesso in un'intervista racconta di come l'Apple II sia stato dotato di speaker perchè doveva fungere da mezzo per videogiochi. Wozniack e Jobs arrivavano dal mondo degli arcade avendo sviluppato nel 1976 Breakout per Atari.
I computer iniziano a diffondersi nelle case e offrono una caratteristica importantissima: possono essere programmati. I giocatori iniziano a diventare anche creatori.
IBM si accorge dell'importanza commerciale dei videogiochiper computer e perlanciare il PCJr nel 1984 chiede a Sierra On-Line (una delle sftware house più importanti per videogame per computer) di creare un gioco apposito. Nasce King's Quest. Il PCJr monda un'interfaccia standard perle priferiche. Questo srà fondamentale per la successiva creazione di schede audio e controller.
Un altro computer che nasce con il videogame in mente è Commodore64, che è tanto legato all'idea di console da prevedere un adattatore d'antenna per poter essere usato anche collegato al televisore, proprio come le home console.

L'audio in questa fase è ancora agli albori. Richiama per certi versi l'audio delle coin-op (spesso l'ahrdware è lo stesso).

## Soundcards

Un forte sviluppo dell'audio per computer si ha con la creazione di schede audio di terze parti che ampliano le capacità delle singole macchine.
La prima scheda audio per computer e AdLib per Amiga. Segue Creative Instruments/Labs con Game Blaster (da notare il nome della scheda) poi evolutasi nella Sound Balster.
Queste prime schede audio mostravano delle limitazioni, come SoundBlaster che mixa internamente i due canali audio in uno riducendo le capacità espressive e rifucendola qualità dell'audio. Si sviluppano allora moduli esterni da collegare per afruttare a pieno le potenzialità di queste nuove componenti.

La scheda audio permette di sfruttare enormemente il potere creative del computer, permettendo la programmazione di suoni e composizioni musicali grazie a tool come Visual Composer e Instrument Maker per Adlib.

[emu su dosbox]

## MIDI

In questo periodo intanto prende piede un protocollo di trasmissione dati audio: il MIDI ideato da Roland.
Il MIDI è un protocollo di trasmissione dati audio che prevede lo scambio di messaggi contenenti comandi per la creazione e la riproduzione di suoni. I suoni veri e propri non vengono trasmessi, permettendo un notevole risprmio in termini di memoria usata.
Questo fa sì che il MIDI sia massicciamente usato, tra gli altri, anche dai produttori di videogiochi.
Roland nel 1987 rilascia una scheda MIDI, l'MT32. Sebbene sia possibile usare l'MT32 per qualsiasi applicazione, Roland ha evidentemente in mente i videogiochi come campo priilegiato di utlizzo, infatti firma un accordo con Sierra On-Line che si impegna a rendere l'MT32 il sistema audio standard per i suoi giochi.

[video 8 bit guy](https://www.youtube.com/watch?v=BMmFcs-_4x4&feature=youtu.be&t=4m57s)

<iframe width="100%" height="315" src="https://www.youtube.com/embed/BMmFcs-_4x4" frameborder="0" allowfullscreen></iframe>

<iframe width="100%" height="315" src="https://www.youtube.com/embed/BMmFcs-_4x4&feature=youtu.be&t=4m57s" frameborder="0" allowfullscreen></iframe>

Tuttavia non esistendo uno standard ogni produttore implementava a modo suo il protocollo rendendo difficile per i programmatori adattare il proprio lavoro alle varie situazioni. Nel 1991 si arriva alla definizione dello standard: GMIDI poi ampliato in GSMIDI.

Il sequencing è la tecnica compositiva tramite messaggi MIDI. Si tratta di una composizione lineare. In alcuni casi si è adattato il MIDI a sistema capace di creare audio dinamico e interattivo.

### iMuse

iMuse (Michael Land, Peter McCowell) è il sound engine di SCUMM, game engine di LucasArts.
iMuse nasce nel 1991 (brevettato nel 1994); è un sistema che premette l'introduzione di componenti di audio dinamico in un linguaggio di scripting. Fondamentalmente iMuse è un database di sequenze musicali che possono contenere **punti di decisione** o **markers** all'interno delle tracce.
Il sistema, utilizzando eventi SysEx nei file MIDI, si permette l'interazione tra le azioni del giocatore e il sonoro del gioco.
Gli eventi in questione sono di due tipi: **markers** e **hooks**.
Un *marker* viene inserito nel file MIDI nel punto che, una volta raggiunto dal lettore MIDI, deve triggerare l'esecuzione di un particolare comando da parte dello script del gioco. Il comando in questione è inserito in una lista (coda - FIFO) è ne viene attivata l'esecuzione non appena il MIDI player raggiunge un marker con un determinato ID. I comandi possono essere qualsiasi cosa, dal fade in/out alle pause.
Un *hook* contiene un ID e l'azione da eseguire una volta che l'hook viene raggiunto. Lo script lancia un comando che si occupa di aspettare che un certo hook venga incontrato (callback), e quindi di mettere in esecuzione il comando contenuto in quest'ultimo.
Gli hook si distinguono in vari tipi, quali ad esempio salti, trasposizioni, abilitazione/disabilitazione di strumenti.

Esempio: transizioni tra rooms:
- marker trigger: aspetta fino a che si raggiunga il punto appropriato prima di fare la transizione alla nuova sequenza
- jump hooks: nella sequenza mette in riproduzione un'altra parte della sequenza prima della transizione

{esempio su dosBox}

### MOD format

Il formato MOD è un formato di file usato prevalentemente per rappresentare musica. MOD è l'estensione del formato (Module/Modular). Il formato è stato ideato da Karsten Obarski per sopperire alla mancanza di tool per comporre musica per Amiga; il primo utilizzo del formato .MOD è stato con l'Ultimate Soundtracker di Amiga.
I file MOD sono infatti legati al tracker come strumento compositivo, e ne hanno anche condizionato l'estetica e l'utilizzo, tanto che questi software non sono sostanzialmente cambiati dai loro primi esemplari. Quindi il formato .MOD è il formato "nativo" dei tracker.
Il file .MOD contiene campioni (strumenti) e pattern che indicano come e quando i campioni devono suonare ed in quale ordine.
Inizialmente si poteva disporre solo di 4 canali e 64 note. I campioni erano codificati come PCM a 8 bit ed erano riprodotti direttamente dal DAC di Amiga.
I tracker e i file .MOD si sono quindi diffusi ampiamente nello sviluppo di videogiochi, diffusione facilitata anche dal fatto che, al contrario di iMuse, il MOD non è proprietario (contro: diversità di implementazione).

![immagine MOD format]()

## Confronto di audio in videogame

[DOOM](https://www.youtube.com/watch?v=m9HvAXZgGeQ&feature=youtu.be&t=20s)

<iframe width="100%" height="315" src="https://www.youtube.com/embed/m9HvAXZgGeQ" frameborder="0" allowfullscreen></iframe>

[Myst](https://youtu.be/D30r0iRH73Q)

<iframe width="100%" height="315" src="https://www.youtube.com/embed/D30r0iRH73Q" frameborder="0" allowfullscreen></iframe>

# i giochi moderni

Attualmente la grafica e la modalità di gioco spingono verso un iper-realismo. Il suono si adegua con l'uso di surround, che però fronisce una simulazione della realtà SOLO dal punto di vista del posizionamento.
Da citare la modalità di fruizione audio offerta da NIntendo Wii in cui i suoni sono emessi anche dai controller, aumentando l'immersività.

Con Xbox si inizia a dleineare la tendenza delle console e dei computer a convergere in un unico sistema. Questa tendenza permane ai girni nostri e si arricchisce di nuove potenzialità con i nuovi apparecchi per l'home entaitainment (smartTV).

### VR

Oculus Rift e i vari sistemi di realtà virtuale stanno cambiando la modalità di gioco. Vedremo come l'audio si adeguerà a queste nuove modalità.

### handheld games

I giochi per dispositivi portatili sono pensati per essere giocati in pubblico, quindi la musica e i suoni non solo non sono importanti, ma devono poteressere elimimnati per non disturbare.

----

# Figure professionali

Abbiamo visto che il videogioco è un software. Abbiamo visto che alla sua creazione e sviluppo concorrono numerose figure professionali, dagli scrittori ai programmatori, dai compositori ai grafici.

Analizziamo ora come si configura l'industria del videogame contemporanea, attraverso quante e quali fasi si deve passare per ottenere un prodotto finito, quali figure intervengono nelle singole fasi e di cosa si occupano.

Visto che lo sviluppo di videogiochi è un ambiente variegato (ci sono piccoli sviluppatori indipendenti, grandi studios, realtà intermedie, studi che si occupano solo di una fase di produzione, ecc), consideriamo una realtà medio grande.

L'organizzazione del lavoro è gerarchica. A capo del processo c'è il **publisher**, ovvero la compagnia che investe denaro nello sviluppo del gioco. Al di sotto del publisher ci sono gli sviluppatori, o **developers** ovvero gli studi che si occupano di realizzare effettivamente il gioco.

Gli sviluppatori possono essere terze parti rispetto al publisher, quindi collaborare con questo sulla base di singoli progetti. Possono essere sussidiari del publisher, quindi studi di proprietà di quest'ultimo. Infine i developers possono essere indie (indipendenti) e affidarsi al self-publishing (auto-edizione).

A capo del progetto nello studio che si occupa dello sviluppo c'è il **producer** (produttore) che è responsabile dell'intero processo di sviluppo. Il produttore può essere interno allo studio o assunto dal publisher ad hoc.

Fanno capo al produttore i vari capireparto dei diversi dipartimenti di sviluppo:

* lead designer
* lead programmer
* audio lead / audio director
* art director

Nei vari reparti ci saranno quindi varie figure professionali, quali: scrittori (design), programmatori (programming), level designers (design), sound designers (audio), composers (music), audio programmers (programming/audio), artist (art).

Vediamo nello specifico quali sono le fasi di sviluppo del gioco.

## Pre produzione

Nella fase di preproduzione si delinea l'idea, il concept e la visione d'insieme del gioco.
Viene prodotto un documento, il **design document** che contiene:

* la storyline
* i dialoghi
* le mappe
* informazioni / idee sull'audio
* informazioni / idee sulle grafiche
* informazioni / idee di animazione
* primi abbozzi di programmazione

Questo documento deve essere approvato dal publisher.

## Sviluppo

I singoli punti del design document vengono presi in consegna dai rispettivi reparti coordinati dal produttore. Ciascuno sviluppa i propri contenuti e spesso ci si interfaccia tra vari diaprtimenti. Il design document infatti è una guida iniziale e serve a trasmettere l'idea di massima del gioco. Questo poi, in fase di sviluppo subirà modifiche, aggiustamenti, correzioni. I singoli reparti si interfacciano per portare avanti il lavoro in maniera coerente.
Ad assicurarsi che lo sviluppo non deragli dal concept espresso nel design document ci pensa il reparto QA, che sottopone il gioco a varie fasi di verifica.

## Debug

Una volta che il gioco è uscito dal reparto sviluppo e il QA ha dato la propria approvazione, si passa alla fase di debug e testing.
In questa fase vengono anche scritti i manuali e i vari documenti relativi al gioco. Si pensa inoltre anche al porting (PC, Mac, Linux, Android, iOS, Xbox, PS, ...) ed alla localizzazione.
Spesso infatti il gioco presenta dialoghi, sia parlati che sotto forma di testo, che devono essere adattati alla lingua dei vari Paesi inclusi nel piano di distribuzione.

## Release

Una volta che i test vanno a buon fine e che tutti i materiali accessori sono stati preparati, è tempo del lancio e della distribuzione. Di questa parte si occupa il reparto marketing (o uno studio a cui si affida il lavoro).

# La produzione audio

La produzione audio per un videogioco richiama per molti versi la produzione audio per i film.
Anche nei videogiochi si fa uso di foley (foley artists) e live sounds (field recording). Tuttavia c'è da ricordare che mentre il film propone una fruizione lineare dei suoi contenuti, nel videogioco il timing e le immagini cambiano dinamicamente. A differenza dei film, quindi, la fase di post produzione è diversa.
La fase di produzione varia a seconda del tipo di gioco, della piattaforma a cui il gioco è destinato e alla casa produttrice (ed editrice!) che lo sviluppa.

Rintracciamo però a grandi linee le fasi comuni:

## pre produzione - better think as a programmer

In fase di pre produzione viene prodotto l'**audio design document** (che confluisce nel design document) in cui si analizza il concetto e la possibile implemnetazione dell'audio per il videogioco.
Il documento si compone di varie sezioni, relative a musica, sound design e dialoghi.

Si è nelle fasi iniziali di sviluppo, quindi si ha a che fare con pochi elementi non precisi (storyboards e/o documenti da altri dipartimenti, abbozzi più che specifiche).

Questa fase serve a determinare il tipo di videogioco in generale (stabilendone il tema e il genere) e i conseguenti stili di suoni e musiche che lo possono rappresentare.

Inoltre si inizia a tenere traccia delle funzionalità che si prevedono per il gioco e qualsiasi comportamento specifico che l'audio deve tenere nel gioco, caratterizzandolo maggiormente rispetto alle indicazioni di massima di tipo, tema e genere.
E' in questa fase che si prende in considerazione l'interazione giocatore - gameplay. Questo è il momento in cui entra in scena l'interattività.

Un altro tipo di informazione utile definita in questa fase iniziale è lo "_spotting_" ovvero identificare quali elementi hanno componenti musicali/sonore. Si delineano i **cue points** e gli **entry points** per gli effetti sonori.

Si traccia una mappa emozionale del gioco per definire i cue points. Il suono infatti si carica di questo compito, come nel film: è repsonsabile del coinvolgimento emotivo inconscio del giocatore. Secondo Charles Deenen ci sono 6 emozioni base che il suono può veicolare:
felicità, disgusto, tristezza, rabbia, sorpresa, paura.
Le emozioni sono una componente fondamentale non solo della musica, ma anche del sound design, e aiutano a determinare il ritmo e il movimento del gioco, infatti gli effetti e suoni vengono mappati basandosi su una mappa di punti di tesione e rilassamento.

I sound designers elaborano quelli che potrebbero essere gli effetti da usare, i foley e il suono ambientale sia leggendo il design document, sia leggendo lo script (qualora sia disponibile).

I musicisti e sound designers stilano quindi un elenco di assets (armi, personaggi, UI, modelli, livelli, ...) che saranno utili in fase di sviluppo.
Si occupano anche di stabilire quali siano le limitazioni tecniche del sistema su cui si deve sviluppare (il numero di canali, surround o stereo, importanza del suono nel videogioco,...) e stilano un elenco di tools per lo sviluppo. Alcuni di questi possono già essere disponibili (banchi di effetti, editors,...), altri sarà necessario programmarli da zero. Per fare questo si deve tenere conto della piattaforma di destinazione, del sound engine che si andrà ad utilizzare e del playback engine offerto dal sistema di gioco.

## produzione

In fase di produzione si ultima o si realizza se non lo si è fatto in preproduzione il **cue spotting**.
Si creano delle scratch tracks per il compositore, ovvero idee di massima della musica che si vorrebbe inserire nei vari passaggi, come punto di riferimento per la composizione vera e propria.
In case di produzioni grandi non è esclusa la ripresa di orchestre che eseguono dal vivo lo score composto per il videogioco.
Nella fase di produzione ci si occupa anche di creare i foley con props.

In quest fase viene creato il layering dei suoni, l'equalizzazione e si applicano gli effetti del DSP.

Un grosso vantaggio si ha con l'uso di DSP in tempo reale che risparmia il tempo di registrazione. Con un DSP in tempo reale l'audio risponde al physics engine e al graphics engine quando questi engine rilevano la necessità di un riscontro sonoro (si apre una porta, c'è una collisione,...)

### Il dialogo

Il dialogo viene realizzato con la tecnica del **voiceover**. Spesso ci si rivolge a professionisti (attori, doppiatori, direttori di doppiaggio) per ottenere un risultato professionale e molto credibile.

Il dialogo si differenzia in:

* battute durante il gioco (script);
* parlato durante le _cutscene_ (il dialogo in questo caso è simile al dialogo cinematografico);
* _walla_ (voci presenti nell'ambiente, ad esempio persone che parlano per strada);
* narratore in voiceover;
* eventi inseriti nello script;
* cue triggerate dall'intelligenza artificiale (esempio: un cane che abbaia non appena ci si avvicina troppo ad una casa): generalmente non sono in forma verbale.

Spesso un voice actor copre più ruoli nel videogioco, la versatilità quindi è un elemento da tenere in considerazione quando effettuare il casting.
Ogni attore ha un **recording sheet** con le sue battute.
Generalmente si registrano tutte le battute di un attore invece di registrare dialoghi o seguire l'ordine di narrazione del gioco.

I dialoghi vengono registrati in studi per l'ADR. I file sono poi sottoposti al QA e se passano il controllo vengono tagliati nei singoli assets e passano al processamento degli effetti.

### La localizzazione

----------

[get lamp](https://youtu.be/Zctp972y_Eg)

<iframe width="560" height="315" src="https://www.youtube.com/embed/Zctp972y_Eg" frameborder="0" allowfullscreen></iframe>
