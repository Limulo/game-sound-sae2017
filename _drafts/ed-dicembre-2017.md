---
layout: default
---

## Edizione Dicembre 2017

Back to [Home](index);
<br/><br/>
Presto disponibili le slides delle lezioni!
{: class="dashed"}

Di seguito parte dei contenuti trattati durante le lezioni:

* Go to the [Part 1](#pt1);
* Go to the [Part 2](#pt2);
* Go to the [Part 3](#pt3);

---

<a id="pt1"></a>
## Pt1:

Il codice è la forma di scrittura a cui siamo maggiormente sottoposti ogni istante quotidianamente.
ref. "Speacking Code - Coding as aesthetic and political expression", G. Geoff, A. McLean, MIT Press

<a id="pt2"></a>
## Pt2:

<a id="pt3"></a>
## Pt3:

### Door simulation

(vedi Cook "_Real Sound Synthesis for Interactive Applications_" pg. 174)

Intuitivamente sappiamo che se spingiamo o trasciniamo un oggetto sopra ad un tappeto, facciamo esperienza di una forza che resiste al movimento che vogliamo indurre all'oggetto.

Questa forza, detta _forza di attrito_ è proporzionale al peso dell'oggetto e dipende in qualche misura dal tipo di materiali di cui sono composti i due oggetti che scivolanto l'uno sull'altro.

![force scheme](illustration)

Sappiamo anche che questa forza si oppone in misura maggiore nel momento in cui cominciamo a spingere ma poi, mano a mano che l'oggetto acquista velocità, essa diminuisce gradualmente.

Per capire meglio come funziona immaginiamo di ingrandire notevolmente la zona soggetta allo sfregamento.

![zooming in on the friction thing illustration](illustration)

![wiki image](https://en.wikipedia.org/wiki/Friction#/media/File:Friction_between_surfaces.jpg)

Se potessimo ingrandire a sufficienza ci accorgeremmo che i due oggetti non possiedono profili perfettamente lisci, anzi, la struttura del loro bordo è piuttosto costituita da una continuità di picchi e valli di dimensioni casuali. Quando accade che ci sia un sufficiente numero di picchi di un oggetto che incontrano altrettante valli dell'altro, allora la forza richiesta per liberarli è più grande.

Una volta che il movimento tra le due superfici è cominciato, avviene una sorta di separazione il che permette agli oggetti di slittare.

Un movimento lento permette ancora ad alcuni picchi di imbattersi in un certo numero di valli, il che causa una certa resistenza mentre movimenti più veloci permettono soltanto ai picchi più alti di scontrarsi tra loro, senza tuttavia che alle due superfici sia permesso di avvicinarsi a tal punto da "incollarsi" tra loro.

L'olio, l'acqua e altri lubrificanti servono appunto per riempire queste valli, aumentanddo in aggiunta lo spazio medio che separa le due superfici e facilitando inoltre lo slittamento tra i picchi e le valli.

Picchi e valli in realtà non costituiscono la sola causa di attrito più che altro quella più macroscopica: esistono altre interazioni a livello molecolare o che implicano l'elettricita statica che contribuiscono all'attrito.
{: class="dashed"}

<iframe width="%100" height="315" src="https://www.youtube.com/embed/ZA_D4O6l1lo" frameborder="0" allowfullscreen></iframe>

#### Stick/Slip

Questo tipo di meccanismo è chiamato _movimento stick/slip_ e si riscontra in fenomeni come l'archetto che scorre sulle corde tese di un violino ma anche nelle porte che stridono.

<iframe src="https://giphy.com/embed/XTsiHInoOPnyw" width="100%" height="360" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>

Nel fenomeno "porta che stride" il meccanismo è un po' complesso rispetto a quanto si verifica per la corda tesa (vedi Farnell "_Designing Sound_" pg. 395). Come suggerito da Farnell il fenomeno potrebbe essere modellato come mostrato nella seguente figura:

![immagine modello massa con molla](modello massa con molla)

Nell'immagine è indicata **Fw** la forza che, rivolta verso destra, stiamo esercitando sull'oggetto. La forza che esercitiamo non è tuttavia applicata direttamente all'oggetto _mover_ ma piuttosto ad una molla coneessa ad esso.

La molla serve per modellare una sorta di _capacitanza meccanica_ **C**. Una volta che la forza che agisce sul _mover_ (data dalla somma di _Fw_ e _Fe_, la forza elastica della molla) eguaglia la **Fs** (forza di attrito statico), il _mover_ accelerata nella direzione di _Fw_, molto più velocemente di quanto avrebbe fatto solo grazie a _Fw_.

Questo fa sì che la tensione della molla diminuisca gradualmente. La frizione cinetica ora, minore in modulo, rispetto alla statica, agisce sul _mover_  rallentandolo fino allo stop. A quel punto il _mover_ ritorna ad essere "incollato" con la superficie d'appoggio fino ache non si sia accumulato (nella molla) forza sufficiente per staccarlo di nuovo.

Il movimento del _mover_ è quindi riassunto nel grafico sottostante dove si vede bene come il suo spostamento **Dm** avvenga a steps se comparato con lo spostamento costante di chi sta trainando l'oggetto.

![grafico degli spostamenti](grafico degli spostamenti)

Più lungo il tempo che intercorre tra step successivi, maggiore la forza che si accumula sulla molla e quindi maggiore la velocità di picco che il _mover_ avrà nel momento in cui si staccherà dal suolo.

Gli impulsi sono generati quando il _mover_ si slancia in avanti e in pratica questi picchi tendono a comparire in piccoli cluster dove ad un movimento ampio ne seguono altri più piccoli.

La complessità del movimento con attrito stick/slip aumenta perchè il coefficinete dell'attrito dinamico dipende dalla velocità ma non con una relazione non semplice. A velocità basse esso aumenta con la velocità fino ad un massimo; oltre questo massimo comincia a decrescere mano a mano che la velocità comtinua a crescere.

![grafico delle velocità](grafico delle velocità)

Volendo essere precisi si dovrebbero considerare anche le proprietà delle superfici di contatto le quali variano perchè soggetto a calore dovuto allo sfregamento. Questo effetto sulla gomma è ben conosciuto dai piloti i quali, prima di cominciare una gara, provvedono a scaldare i pneumatici per far aumentare il coefficiente di attrito.

Dal momento che le asperità delle superfici sono casuali a livello microscopico non possiamo predire con assoluta certezza l'esatto istante di una _slip_, ma su base statistica il comportamento macroscopico può essere così predicibile da risultare praticamente periodico.

La periodicità aumenta quando l'interfaccia slip-stick appartiene ad una massa che si accopia con una sistema risonante come una molla nel nostro caso.

Il sistema risonante tenderà a produrre picchi regolari nella forza e farà sì che lo slip accada in simpatia con la frequenza risonante, proprio come accade in una corda suonata con l'archetto.







* physics of the stick/slip motion
* attrito statico, attrito dinamico (variazioni tra l'uno e l'altro).

La velocità

* farnell pg 395 + cook pg 176







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

![rectangular membrane formulae](./images/2017-09/pt3/door.png)

Sicuramente da approfondirne le caratteristiche: [Frame3dd](http://frame3dd.sourceforge.net/). Un software libero per studiare le dinamiche strutturali statiche e dinamiche. Che possa esserci utile nell'analisi dei modi?
{: class="dashed"}