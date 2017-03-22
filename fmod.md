# FMOD

**FMOD** is a software tool by _Firelight Technologies_ (Melbourne, Australia). It helps sound designers to better organize audio assets in order to be used inside games (or interactive applications generically).

If you take a tour of the [FMOD website](http://www.fmod.org/), you will see that FMOD comes in three flavours:
* **Studio**: similar to a DAW, FMOD Studio is a software with a graphic user interface that makes all the features of FMOD easy to use;
* **API**: is the way a programmer would use FMOD; 
* **IO**: it's a sound effect store that FMOD users can directly access from FMOD Studio; 

FMOD can be integrated with the principal game engines [Unity](http://www.fmod.org/documentation/#content/generated/engine_new_unity/overview.html) and [Unreal Engine](http://www.fmod.org/documentation/#content/generated/engine_ue4/overview.html).

## Video tutorials
* http://www.fmod.org/training


## Topics

### 3D Audio
5.1, 7.1, doppler, psychoacustics

* panner 3D
* HRTF (Virtual Reality)
* 3d reverb

### Memory Menagement

### Threads

---

# Getting Started

A single game corresponds to a single FMOD Studio project (it will contain all the events, music and mixer data for the game)

## Project creation
When you create your first program it's better you to save it in order to make all datafiles you will load be also **copied**  inside the project asset folder (not linked from their original location on the file system).

File Structure of a project

## Interface Overview

1. Manu Bar
2. Event Browser (with Tabs and Search Bar)
3. Editor (Transport Bar

## Preferences
TODO

## Events
They can be **triggered** and their **parameters manipulated**.
in-game events and (FMOD)events

Multiple instances: Game event instances each with its own timeline and paramters

### Event browser
multiple events can be collected inside a folder in order to organize your project.

### Audio Bin 
to import audio go to **Window > Audio Bin**. The Audio bin window opens. Now select the audio file from the file system and drag and drop it inside ti _Audio Bin_.

### Module
A **module** is a component of a signal chain characterised by its ability to be be displayed in the deck when active.
A **Sound module** are modules from which the audio in an event originates. They are represente by coloured boxes on the event tracks called _trigger regions_.

The module will emit sound as long as the cursor will stay above the _trigger region_.

### The Deck
On the _deck_ we see the module corresponding to the trigger region we have selected on the Editor

### a Timelock Sound Module
You see the waveform graphic on the corresponding trigger region. Timelock means the the audio we aregoing to heard is exactly what it is represented by the waveform graphic shown on the trigger region.

The **Loop Toggle button** is used when you want to extend the trigger region more than the audio file original extension and you want the audio file to continue the playback.

### Multi Sound Modules
It is not timelocked. Unlike the non­timelocked single sound module, this module doesn’t stop outputting a signal when the cursor leaves its trigger region. Whether a module falls silent when untriggered usually depends on whether that module is set to loop.

In the other hand, if you set the **loop** toogle, the sound module stops producing output as soon as the cursor leaves the trigger region.

## Adaptive Events
In FMOD Studio, the primary way to make an event adaptive is to give it **parameters**.

Th _Timeline_ is actually a special kind of parameter that automatically advances, and that all events have by default.

All instances of a given event have the same parameters, but the current values of those parameters can vary from one instance to the next. This allows each instance of an event to have a unique state.

* An _Event_ can contain one or more _Parameters_.
* a _Parameter_ can contain one or more _trigger regions_.
* a _Sound Module_ has only one _trigger region_, for that a _Sound Module_ cannot have triggers regions on more than one _parameter_ of an _event_.

1. Parameters can trigger sound modules;
2. Parameters can automate sound module properties.

Note that, when automating the properties of a sound module, it is entirely possible to place the trigger region of that sound module on one parameter, and to automate a property of that sound module on a different parameter.

## Custom Parameters and Built-in Parameters
When you create an event with one or more parameter, the game code needs to include function calls to update these parameters.
However FMOD includes a number of _built-in parameters_ that are automatically updated based on information routinely fed to FMOD Studio's geometry system
* distance
* direction
* elevation
* event Cone angle
* event orientation

## Modulators

---

# Tutorial: Making Interactive Music
We have interesting elements here:
* Tempo Marker
* Destination Marker
* Loop Region
* Sustain Point
* Transition marker
* Transition Region

(_Snap to ruler_ option)

1. background music + event triggered in quantization

2. Sending the cursor back in the time line: Loop regions

3. Sending the cursor forward in the time Line: Transition Markers. Conditions can be added to markers (create parameters and click on + on the corresponding module)

4. a Transition region is needed when the transition has to occur within a region of the timeline and not necessarily at a specific predictable point (quantization and parametrization possible).

5. Sustain point if it is necessary for to timeline cursor to stop! A sustain point for the timeline parameter doesn't mean other trigger regions on other parameters will pause too!


4: Transition timeline: can be defined as short timelines that the timeline cursor travels along between disappearing at a transition marker and reappearing at the associated destination marker.

transition region!= Transition marker != transition timeline

---

# Tutorial: Routing & Mixing
The mixer window

Most mixing in FMOD Studio requires that all events in the project are routed into group buses (for example, sound effects, music, voices).

When you assign an event A to a group in the Mixer window, it means that whenever the game will instantiate a new A event, its audio output will be routed to the group.

Mixing is normally done while the project's events are playing through the sandbox or in-game.

## Effect chain
on how to add effect on the channel (bypass, flip to faders, rearranging effect when you have more than one)

## Effect send 

## Snapshot
* overriding snapshot: only buses and properties that are scoped in the snapshot can be affected by that snapshot (right click -> _scope-in_). When a snapshot is active, it acts lika a mask, replacing the normal values of its scoped-in properties with the values specified in the snapshot.

Snapshots can be audited (snapshot have the _play_/_stop_ button in the transport bar!)

### How to make smoother snapshot transitions?
with the snapshot mixer in focus, push the _track button_ in the transport to view track in an horizontal fashion. Now we can act on transitions over time.

**snapshot intensity** property - AHDSR modulator

Snapshot can be triggered by:
* game code (see the FMOD API for more);
* an event via a **snapshot trigger region**

It is also possible for multiple snapshot or for multiple instances of the same snapshot. When more than one snapshot acts on the same parameter, what happens when more of them are active at the same time? Well, their name is _overriding snapshot_ so the answer is that on "overrides" the other.

The order in witch snapshots appear in the snapshot browser is important: the snapshots at the top are applied last, overriding all the snapshots from lower down.

There are also _blending snapshots_: the work a little bit differently concerning the _volume_.


# Tutorial: Building the project
Content created in Studio has to be built in a convenient format in order the game engine to use it.

## Assigning events to Banks

**Banks**
* prior to trigger an event, at least one _bank_ that contains that event must be loaded;
* if we want our event to appear in the game, we need to assign it to _one_ or _more_ banks;
* for each bank we can select one or more target platform!

File > Build...

# Tutorial: Live Update

Wan mixing and editing a project, it often helps to be able to hear the result in the game. **Live Update** allows you to connect FMOD Studio to your game as it runs, make changes to your project and hear the result in real time.

To use it, the game needs to set the **FMOD_STUDIO_INIT_LIVEUPDATE** flag.
1. Open the project
2. Open the game
3. in Studio: File > Connect to Game...
4. insert the IP address of the machine where the game is running on (use _localhost_ if the game is running locally).
5. click Connect

# Understanding the Profiler

The profiler allows you to record _sessions_ live update. Profiler sessions are useful when investigating all sorts of issue that can arise in the audio of a game!

You can for example record action from a connected game and play them in a loop to find out where is the problem!

Profiler wold record:
* CPU usage
* memory used (in KB)
* File I/O
* Levels
* Voices (self/total) indicates the number of voices playing through a track.
* Lifespan 
* Instances (self / Total)

---

# TODO
* sub event
* File > Export GUIDs
* File > validate project
* File > Connect to Games
* How a Bank file is made
* Voices (what they are?)
* Profiler: What is API Capture Mode?
* sidechain