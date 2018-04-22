// 1. define the "Droplet" synth.
// Each synth will be responsible of constantly generating
// new droplets, according to the 'dynamics' parameter.
(
SynthDef(\test,{
	| dyn=0.9 |

	var trigger = LocalIn.kr(1);
	var k = TRand.kr(0.0, 1.0, trigger);

	var env = EnvGen.kr(Env.perc(0.0, 0.001, ((1-k)**((dyn*12)+1)), curve:-4), trigger);
	var amp = ((1-dyn)**2);

	var freq = ((k**5)*15700)+300;
	var q = ((1-k)*20)+25;
	var glide = TRand.kr(0.100,0.160, trigger);

	var sig = WhiteNoise.ar() * amp * env;
	sig = BPF.ar(sig, VarLag.kr(freq, glide), q.reciprocal);

	trigger = Impulse.kr( 1000.0/(10 + TRand.kr(0.0, (68*(1-(dyn**2))), trigger)) );
	LocalOut.kr(trigger);
	Out.ar(0, sig.dup);
}).add;
)


// 2. define an array of water "droplets" synths
(
~waterDroplets = Array.new();
100.do({
	~waterDroplets = ~waterDroplets.add(Synth(\test));
});
)


// 3. create a slider to change the dynamics parameter (debug)
(
w = Window.new("change the sound dynamics",
Rect(300,Window.screenBounds.height-300,400,100)).front;
a = Slider(w, Rect(50, 20, 300, 40))
.value_(0.9)
.step_(0.01)
.focus
.action_({
	~dynamics = a.value.clip(0.01, 0.9);
	//~dynamics.postln;
	~waterDroplets.do({
		|item|
		item.set(\dyn, ~dynamics);
	});
});
)

// 4. free the synths when you have finished
(
~waterDroplets.do({
	|item|
	item.free;
});
)