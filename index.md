---
layout: default
---

## Introduction

Go to the [FMOD page](fmod).
Go to [pt1](pt1)
Go to [pt2](pt2)

{% comment %}

### Video game sound and music
(ref. Karen Collins)

* Storia dell'audio nelle varie console/videogiochi:
 * MIDI
 * iMUSE
 * Amiga (mod format) [Storia del game sound]

* Game audio oggi - figure professionali, modalità di lavoro e documenti di lavoro (ref Adams):
 * pre, pro, post
 * sample music cue sheet
 * dialogue cue sheet
 * sound design assets list
 * pop in VG
 * funzione del game audio
 * grado di interattività in audio dinamico
 * immersione e costruzione del reale
 * approcci compositivi a musica dinamica in VG
 * non-linearità nei VG
 * approcci a variabilità in VG

## Tools
* Tones.js
* howlers.ls

{% endcomment %}

## Music in Video Games

### Personnel
* Karen Collins;
* Brian Eno;
* Leonard J Paul: [website](http://school.videogameaudio.com/apply/), [Youtube channel](https://www.youtube.com/channel/UCRkeuj7LOpX__NGQN1I0ANg), [talk](https://www.youtube.com/watch?v=2y86R4cDA9U), [lesson](https://www.youtube.com/watch?v=tvx_QgS7D8Q)
* Yann Seznec: [website](http://www.yannseznec.com/);
* Winifred Phillips: [website](http://www.winifredphillips.com/);

### CC music
* [incompetech](http://incompetech.com/music/royalty-free/music.html)
* [ccMixter](http://ccmixter.org/)
* [soundimage](http://soundimage.org/)

## Talks, references and other materials
* [GDC Doom Music](http://www.gdcvault.com/play/1024068/-DOOM-Behind-the);
* [GDC Final Fantasy XV - interactive music and tools](http://www.gdcvault.com/play/1023971/Epic-AND-Interactive-Music-in);
* [gamasutra 1](http://www.gamasutra.com/blogs/JasonYu/20170323/292591/Deconstructing_The_Music_of_the_8_Dungeons_of_Links_Awakening.php);
* [Akash Thakkar](https://www.youtube.com/watch?v=K_haRMbKZ1M)
* Akash Thakkar & Disasterpiece [GDC talk](http://www.gdcvault.com/play/1024135/The-Sound-and-Music-of) about the game "_Hiperlight Drfiter_";
* [Audio talk GDC 2017](http://www.gdcvault.com/play/1023224/Outside-the-Studio-Walls-MicroTalk)
* [Karen Collins 2013](http://www.gdcvault.com/play/1017959/Biff-Boom-Pow-Introducing-Students)
* [Karen Collins 2014](http://www.gdcvault.com/play/1020359/Selling-Games-and-the-Code)
* project [Bar-B-Q](https://www.projectbarbq.com/)
* [IAsig](https://www.iasig.org/)

--------------------------------------------------------------------------------------------------------------------------------

## Effects

Sound effects in video games.

Procedural (computational) audio **definition**:

> “Procedural audio is non-linear, often synthetic sound, created in real time according to a set of programmatic rules and live input.” – "[An introduction to procedural audio and its application in computer games](http://cs.au.dk/~dsound/DigitalAudio.dir/Papers/proceduralAudio.pdf).” by Andy Farnell

## Game Audio Engine capabilities
* spatialization, panner 3D, 3D audio, 5.1, 7.1, doppler, psychoacustics, HRTF binaural sound (Virtual Reality), 3d reverb;
* memory managements, dynamic mixing, dynamic [voices allocations](http://electronicmusic.wikia.com/wiki/Voice_allocation) and [voice stealing](http://electronicmusic.wikia.com/wiki/Voice_stealing)
* Synchronization, web, threads

### Personnel

* Andy Farnell: [interview](http://designingsound.org/2012/01/procedural-audio-interview-with-andy-farnell/), [website1](https://web-beta.archive.org/web/20151210193227/http://www.obiwannabe.co.uk/), [website2](http://mitpress2.mit.edu/designingsound/tarball.asp), [lesson](https://www.youtube.com/watch?v=sp83-Pq7TyQ);
* Perry Cook: [website](http://www.cs.princeton.edu/~prc/);
* Graham Gatheral: [website](http://www.gatheral.co.uk/), [talk](https://vimeo.com/75442176);
* Dinesh Pai and Kees van den Doel **Modal Synthesis for Vibrating Objects** [paper](http://www.cs.ubc.ca/~kvdoel/publications/modalpaper.pdf) and [code example](http://www.cs.ubc.ca/~kvdoel/publications/srcmodalpaper.zip) and many more [papers](http://www.cs.ubc.ca/~kvdoel/pubs.html);
* [Kees van den Doel](http://www.cs.ubc.ca/~kvdoel/): water simulation model's [paper](http://www.cs.ubc.ca/~kvdoel/publications/tap05.pdf);
* Nicolas Fournel [blog](http://www.nicolasfournel.com/)
* Dylan Menzies: [papers](http://dmu.academia.edu/DylanMenzies)
* Dr Stefan Bilbao: [website](http://www.eca.ed.ac.uk/reid-school-of-music/stefan-bilbao)
* Mark Grimshaw: [thesis](https://www.amazon.com/Acoustic-Ecology-First-Person-Shooter-Experience/dp/3639024087/ref=sr_1_2?ie=UTF8&s=books&qid=1215249610&sr=8-2)
* Dylan Menzies: [pubblications](https://www.researchgate.net/profile/Dylan_Menzies/publications)
* [Anton Woldhek](http://www.woldhek.eu/anton/)
* [Rod Selfridge](https://rodselfridge.wordpress.com/)
* Christian Heinrichs
* [Stefania Serafin](https://ccrma.stanford.edu/~serafin/publ.html) and her work on contact models;

### Application of Procedural Audio in Games

* [Fract](http://fractgame.com/) which uses PureData with Libpd as sound engine;
* [GTA V audio](http://www.gdcvault.com/play/1020587/The-Sound-of-Grand-Theft) and the RAGE audio Engine. [Vehicles](https://youtu.be/L4GuM15QOFE?t=23m52s) granular engine, [Procedural audio Synthetizer tool](https://youtu.be/L4GuM15QOFE?t=28m34s)
* [Pugs Luv Beats](http://designingsound.org/2012/01/the-sound-of-pugs-luv-beats/) a game by [Lucky Frame](http://luckyframe.co.uk/) (Yann Seznec) with PureData embedded inside w/ help from Peterr Brinkmann **libPD** ([gameplay](https://www.youtube.com/watch?time_continue=39&v=V0i18_--8Yc));
* [Sim Cell](https://www.youtube.com/watch?v=nQ2yq5Vqyj0) by StrangeLoop;
* [Spore](https://www.youtube.com/watch?v=Wk9At6aeLjQ);
* iMuse [X-Wing example](https://www.youtube.com/watch?v=8ya04gZiP-Y&index=3&list=PL0943E4EFB1B77689), [Monkey Island 2 example](https://www.youtube.com/watch?v=-XuClagw6IQ);

{% comment %}
* [Abzu](https://www.youtube.com/watch?v=CWU1pZVw0xM&feature=youtu.be&t=15m24s);
* [Journey]();
{% endcomment %}


### Application of Procedural Audio on other fields

* [Virtual Analog Synthesis](https://en.wikipedia.org/wiki/Analog_modeling_synthesizer), the term was not used until the 1990s when the [Nord Lead](https://en.wikipedia.org/wiki/Nord_Lead) came out.

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Clavia_Nord_Lead_2x.jpg/799px-Clavia_Nord_Lead_2x.jpg" alt="Clavia Nord Lead" width="100%" />

A possible example of this kind os synthesis is the Arturia [True Analog Emulation (TAE)](https://www.arturia.com/products/drums/spark/tae%C2%AE) technology, used in software plug-ins by the company like the [mini V](https://www.arturia.com/products/analog-classics/mini-v/overview) or the [arp-2600](https://www.arturia.com/products/analog-classics/arp2600-v/).

* [Physical modelling synthesis](https://en.wikipedia.org/wiki/Physical_modelling_synthesis) engines are used in softwares like the [Arturia Stage-73 V](https://www.arturia.com/products/analog-classics/stage-73-v/overview), the [PianoTeq](https://www.pianoteq.com/home) products, [Supreme Piano](http://www.supremepiano.com/) which uses an hybrid synthesis modelling, but also the Antares [Auto-tune](http://www.antarestech.com/products/detail.php?product=Auto-Tune_8_66) or [Throath](http://www.antarestech.com/products/detail.php?product=THROAT_Evo_14), Celemony [Melodyne](http://www.celemony.com/en/melodyne/what-is-melodyne) and [Capstan](http://www.celemony.com/en/start), [Izotope RX](https://www.izotope.com/en/products/repair-and-edit/rx.html).
Other examples are the Roland instruments like the [Aerophone AE-10](https://www.roland.com/us/products/aerophone_ae-10/) use the [SuperNATURAL](http://www.rolandus.com/blog/2013/06/04/what-is-supernatural/) modelling synthesis engine in parallel with traditional PCM synthetizer.
[Line6 Pod](https://en.wikipedia.org/wiki/Pod_%28amp_modeler%29) product, for example, implements a sound engine which simulate a lot of preamps, cabinets and room acoustics.

We can find the same concepts in many others software and hardware products like virtual instruments by [Togu Audio Line (Tal)](https://tal-software.com/Products), effects by [The Audio Thing](https://www.audiothing.net/), [Native Instruments B4](http://www.soundonsound.com/reviews/native-instruments-b4-ii).
* Hardware instruments and Expanders: (ex)GEM DRAKE technology;
* RjDj
* Smule

### other interviews
* [Interview with David Thall, Mads Lykke and Andy Farnell](http://designingsound.org/2010/09/audio-implementation-greats-8-procedural-audio-now/)
* Gamasutra [article 1](http://www.gamasutra.com/resource_guide/20030528/whitmore_pfv.htm) and [article 2](http://www.gamasutra.com/resource_guide/20010515/ross_pfv.htm)

### Papers
* [liqui](http://gamma.cs.unc.edu/SoundingLiquids/soundingliquids.pdf)
* [Zheng and James](http://www.cs.cornell.edu/projects/FractureSound/files/fractureSound_comp.pdf) - water simulation model (@ a high cost)

### Examples
* Playstation [VR worlds](http://designingsound.org/2016/12/the-sound-music-of-playstation-vr-worlds/)
* [talk](http://www.gdcvault.com/play/1024067/The-Sound-of-No-Man) by Paul Weir - sound designer for the Hello Game's **No Man Sky** - [in game sounds](https://www.youtube.com/watch?v=BgAslKUaNx4)

### Middleware & Tools

A few of them:

* Audiokinetic **Wwsise**'s plugins: [SoundSeed](https://www.audiokinetic.com/products/wwise-add-ons/soundseed/)
* [adx2](http://www.criware.com/en/products/adx2.html) by Cri middleware
* **Tsugi** [audio products](http://tsugi-studio.com/web/en/products.html) like, for example, [Game Synth](http://tsugi-studio.com/web/en/products-gamesynth.html) or [DSP retro](http://tsugi-studio.com/web/en/products-dspretro.html) among others;
* [bfxr](http://www.bfxr.net/) an online and offline sound effect generator. It was born after the [Tomas Pettersson](http://www.drpetter.se/about.html) [sfxr](http://drpetter.se/project_sfxr.html) previous project. This is [as3sfxr](http://www.superflashbros.net/as3sfxr/), a Flash porting.
* [Le sound AudioGaming](https://lesound.io/)
* [Praat](http://www.fon.hum.uva.nl/praat/), [Sonic Visualizer](http://www.sonicvisualiser.org/);
* [PureData](https://puredata.info/), [Max/MSP](https://cycling74.com/) and Simbolic Sound's [Kyma](http://kyma.symbolicsound.com/);
* [SuperCollider](https://supercollider.github.io/), [CSound](http://csound.github.io/)
* [Chuck](http://chuck.cs.princeton.edu/)
* [Faust](http://faust.grame.fr/) a DSP programming language;
* [Heavy Audio Tools Framework](https://enzienaudio.com/);
* [Tapestrea](http://taps.cs.princeton.edu/): Techniques And Paradigms for Expressive Synthesis, Transformation,
and Rendering of Environmental Audio;

### Courses
* Mooc: [Kadenze Physics-Based Sound Synthesis for Games and Interactive Systems](https://www.kadenze.com/courses/physics-based-sound-synthesis-for-games-and-interactive-systems/info)

### Books
Books about music in video games:

* Winifred Phillips [book](https://www.amazon.com/dp/0262026643/ref=cm_sw_su_dp)
* KarenKollins [book](https://www.amazon.com/Game-Sound-Introduction-History-Practice/dp/026203378X/ref=pd_bxgy_14_img_3?_encoding=UTF8&pd_rd_i=026203378X&pd_rd_r=NCK8TJTEW5CPY2J21BA0&pd_rd_w=Cp62q&pd_rd_wg=rCgp3&psc=1&refRID=NCK8TJTEW5CPY2J21BA0)

Books about sound effects and related topics:

* Andy Farnell's "[Designing Sound](https://mitpress.mit.edu/books/designing-sound)"
* Perry Cook "[Real Sound Synthesis for Interactive Applications](http://www.cs.princeton.edu/~prc/AKPetersBook.htm)"
* Mark Grimshaw's "[Game Sound Technology and Player Interaction: Concepts and Developments](http://www.igi-global.com/book/game-sound-technology-player-interaction/41766)"

Other books of interest:

* Micheal Chion "[L' audiovisione. Suono e immagine nel cinema](http://www.lindau.it/Libri/L-audiovisione.-Suono-e-immagine-nel-cinema)"
* [R. Murray Schafer](https://en.wikipedia.org/wiki/R._Murray_Schafer) "[Il paesaggio sonoro](https://www.amazon.it/paesaggio-sonoro-storia-musica-ecologia/dp/8875920001?SubscriptionId=AKIAILSHYYTFIVPWUY6Q&tag=duckduckgo-ffab-it-21&linkCode=xm2&camp=2025&creative=165953&creativeASIN=8875920001)

### Other resources
* [The Sounding Object project](http://soundobject.org/)
* [Procedural Audio Now](http://proceduralaudionow.com/)
* The [Association of Sound Designers](http://www.associationofsounddesigners.com/)
* Supercollider [code snippets](https://en.wikibooks.org/wiki/Designing_Sound_in_SuperCollider) ported from the Pure Data esamples from the "_Designing Sound_" book;
* [Supercollider code repository](http://sccode.org/);
* [Sound Design Tutorials](http://designingsound.org/2016/07/sound-design-tutorial-list/)
* [AES Lecturers](http://www.aes-uk.org/meetings/) - [YouTube channel](https://www.youtube.com/user/aesuksection)


# 2017-04-29 LINKS

* [Lost Chocolate Blog](http://blog.lostchocolatelab.com/)
* [game audio podcast ep.4 - about procedural audio](http://www.gameaudiopodcast.com/?p=161)
* [part 1](http://designingsound.org/2010/01/audio-implementation-greats-1-audio-toolsets-part-1/) and [part 2](http://designingsound.org/2010/01/audio-implementation-greats-2-audio-toolsets-part-2/)
* [Gaf](http://cedric.cnam.fr/PUBLIS/RC1568.pdf), [IEZA](https://users-cs.au.dk/dsound/DigitalAudio.dir/Unity/IEZA.pdf) and [this](http://captivatingsound.com/ieza-framework-for-game-audio/). [GAL](https://www.researchgate.net/publication/238660174_GAME_AUDIO_LAB_-_AN_ARCHITECTURAL_FRAMEWORK_FOR_NONLINEAR_AUDIO_IN_GAMES) and [this](http://www.aes.org/e-lib/browse.cfm?elib=15169)

---

## Historical background

* late '70 - Atari 2600: 2 voice of synthetized sound: space invaders sound
* [AY-3-8910](https://en.wikipedia.org/wiki/General_Instrument_AY-3-8910) arcade games of that era

* from text based adventure games to graphical adventures [Computer Chronicles](https://www.youtube.com/watch?v=8qxBcOuMYCU)

<img src="./images/ken-roberta.png" alt="ken and Roberta Williams" width="100%" />

<img src="./images/infocom-brain-1.jpg" alt="infocom ads 1" width="100%" />

<img src="./images/infocom-brain-2.jpg" alt="infocom ads 2" width="100%" />


{% comment %}

* Artificial intelligence: [WaveNet](https://deepmind.com/blog/wavenet-generative-model-raw-audio/), an artificial intelligence application ([paper](https://arxiv.org/pdf/1609.03499.pdf)), see Gene Kogan and other project.

### Conferences
* Audio Mostly

## Other stuff
* A system to create synthetic engine sound for electric/hybrid car: [Harman Halosonic](http://www.halosonic.co.uk/)

[VRDC 2016 - Virtual Reality and Real Audio](http://www.gdcvault.com/play/1023646/Virtual-Reality-and-Real)
[GDC Eu 2015 - Oh My! That Sound Made the Game Feel Better!](http://www.gdcvault.com/play/1022808/Oh-My-That-Sound-Made)
[GDC 2015 - Audio Bootcamp : Advanced Composition Techniques for Adaptive Systems by Winifred Phillips](http://www.gdcvault.com/play/1021811/Audio-Bootcamp-Advanced-Composition-Techniques)
http://www.gdcvault.com/play/1021813/Audio-Bootcamp-Audio-Gigs-How
http://www.gdcvault.com/play/1021815/Audio-Bootcamp-Dialogue
[Audio Bootcamp : Introduction (10-10:10am)/Sound Design the Bungie Way: The Weapons of Destiny](http://www.gdcvault.com/play/1021818/Audio-Bootcamp-Introduction-%2810-10)
[Audio Bootcamp : Technical Sound Design](http://www.gdcvault.com/play/1021819/Audio-Bootcamp-Technical-Sound)
http://www.gdcvault.com/play/1022315/The-Neuroscience-of-Game


[video](https://www.youtube.com/watch?v=CfwDLONo7nI)

# Tips & Tricks

* don't use the ```.mp3``` file format if you need your file to loop smoothly. Mp3 format adds data chunks at the end of the file so, when played back, you can heard an interruption. Instadd use the ```.ogg``` file format: it has the same dimensions of the ```.mp3``` version but it is better in terms of looping!

{% endcomment %}
