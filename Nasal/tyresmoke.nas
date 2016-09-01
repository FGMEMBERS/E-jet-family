# ==================================== timer stuff ===============================
# set the update period
UPDATE_PERIOD = 0.3;

# set the timer for the selected function
var registerTimer = func {
	settimer(arg[0], UPDATE_PERIOD);
} # end function

var run_tyresmoke = [0, 0, 0];
# =============================== listeners ===============================
#
#setlistener( "controls/lighting/nav-lights", func {
#	var nav_lights_node = props.globals.getNode("controls/lighting/nav-lights", 1);
#	var generic_node = props.globals.getNode("sim/multiplay/generic/int[0]", 1);
#	generic_node.setIntValue(nav_lights_node.getValue());
#	print("nav_lights ", nav_lights_node.getValue(), "generic_node ", generic_node.getValue());
#	},
#	1,
#	0);

#setlistener("gear/gear[0]/position-norm", func {
#	var gear = getprop("gear/gear[0]/position-norm");
#	if (gear == 1 ){
#		run_tyresmoke0 = 1;
#	}else{
#		run_tyresmoke0 = 0;
#	}
#}, 1, 0);
#setlistener("gear/gear[1]/position-norm", func {
#	var gear = getprop("gear/gear[1]/position-norm");
#	if (gear == 1 ) {
#		run_tyresmoke1 = 1;
#	} else {
#		run_tyresmoke1 = 0;
#	}
#}, 1, 0);
#setlistener("gear/gear[2]/position-norm", func {
#	var gear = getprop("gear/gear[2]/position-norm");
#	if (gear == 1 ) {
#		run_tyresmoke2 = 1;
#	} else {
#		run_tyresmoke2 = 0;
#	}
#}, 1, 0);

#for (var i = 0; i <= 2; i += 1) {
#	var gear = "gear/gear[" ~ i ~ "]/position-norm";
#	setlistener(gear, func {
#		if (getprop(gear) == 1){
#			run_tyresmoke[i] = 1;
#		} else {
##			run_tyresmoke[i] = 0;
#		}
#	}, 1, 0);
#}
run_tyresmoke[i] = 1;
#============================ Tyre Smoke ===================================
var tyreSmokes = [aircraft.tyresmoke.new(0), aircraft.tyresmoke.new(1), aircraft.tyresmoke.new(2)];

var tyresmoke = func {
	for (var i = 0; i <= 2; i += 1) {
		if (run_tyresmoke[i])
			tyreSmokes[i].update();
	}
	settimer(tyresmoke, 0);
}# end tyresmoke

# == fire it up ===
tyresmoke();

#============================ Rain ===================================
aircraft.rain.init();
var rain = func {
	aircraft.rain.update();
	settimer(rain, 0);
}

# == fire it up ===
rain();
# end 
