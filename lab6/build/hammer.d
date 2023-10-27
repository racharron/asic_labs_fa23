HAMMER_EXEC ?= /home/cc/eecs151/fa23/class/eecs151-aeq/venv_151/bin/hammer-vlsi
HAMMER_DEPENDENCIES ?= /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/sky130.yml /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sram_generator-output.json /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/design.yml /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/src/dot_product.v


####################################################################################
## Global steps
####################################################################################
.PHONY: pcb
pcb: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/pcb-rundir/pcb-output-full.json

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/pcb-rundir/pcb-output-full.json: $(HAMMER_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/sky130.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sram_generator-output.json -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/design.yml --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build pcb


####################################################################################
## Steps for dot_product
####################################################################################
.PHONY: sim-rtl syn syn-to-sim sim-syn syn-to-par par par-to-sim sim-par sim-par-to-power par-to-power power-par power-rtl sim-rtl-to-power sim-syn-to-power syn-to-power power-syn par-to-drc drc par-to-lvs lvs syn-to-formal formal-syn par-to-formal formal-par syn-to-timing timing-syn par-to-timing timing-par

sim-rtl          : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-rtl-rundir/sim-output-full.json
syn              : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/syn-rundir/syn-output-full.json

syn-to-sim       : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-syn-input.json
sim-syn          : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-syn-rundir/sim-output-full.json

syn-to-par       : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-input.json
par              : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-rundir/par-output-full.json

par-to-sim       : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-par-input.json
sim-par          : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-par-rundir/sim-output-full.json

sim-par-to-power : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-sim-par-input.json
par-to-power     : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-par-input.json
power-par        : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-par-rundir/power-output-full.json

sim-rtl-to-power : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-sim-rtl-input.json
power-rtl        : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-rtl-rundir/power-output-full.json

sim-syn-to-power : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-sim-syn-input.json
syn-to-power     : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-syn-input.json
power-syn        : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-syn-rundir/power-output-full.json

par-to-drc       : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/drc-input.json
drc              : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/drc-rundir/drc-output-full.json

par-to-lvs       : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/lvs-input.json
lvs              : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/lvs-rundir/lvs-output-full.json

syn-to-formal    : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/formal-syn-input.json
formal-syn       : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/formal-syn-rundir/formal-output-full.json

par-to-formal    : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/formal-par-input.json
formal-par       : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/formal-par-rundir/formal-output-full.json

syn-to-timing    : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/timing-syn-input.json
timing-syn       : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/timing-syn-rundir/timing-output-full.json

par-to-timing    : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/timing-par-input.json
timing-par       : /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/timing-par-rundir/timing-output-full.json



/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-rtl-rundir/sim-output-full.json: $(HAMMER_DEPENDENCIES) $(HAMMER_SIM_RTL_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/sky130.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sram_generator-output.json -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/design.yml $(HAMMER_EXTRA_ARGS) --sim_rundir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-rtl-rundir --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build sim

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-sim-rtl-input.json: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-rtl-rundir/sim-output-full.json
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-rtl-rundir/sim-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-sim-rtl-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build sim-to-power

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-rtl-rundir/power-output-full.json: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-sim-rtl-input.json $(HAMMER_POWER_RTL_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-sim-rtl-input.json $(HAMMER_EXTRA_ARGS) --power_rundir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-rtl-rundir --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build power

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/syn-rundir/syn-output-full.json: $(HAMMER_DEPENDENCIES) $(HAMMER_SYN_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/sky130.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sram_generator-output.json -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/design.yml $(HAMMER_EXTRA_ARGS) --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build syn

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-syn-input.json: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/syn-rundir/syn-output-full.json
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-syn-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build syn-to-sim

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-syn-rundir/sim-output-full.json: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-syn-input.json $(HAMMER_SIM_SYN_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-syn-input.json $(HAMMER_EXTRA_ARGS) --sim_rundir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-syn-rundir --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build sim

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-sim-syn-input.json: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-syn-rundir/sim-output-full.json
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-syn-rundir/sim-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-sim-syn-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build sim-to-power

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-syn-input.json: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/syn-rundir/syn-output-full.json
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-syn-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build syn-to-power

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-syn-rundir/power-output-full.json: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-sim-syn-input.json /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-syn-input.json $(HAMMER_POWER_SYN_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-sim-syn-input.json -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-syn-input.json $(HAMMER_EXTRA_ARGS) --power_rundir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-syn-rundir --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build power

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-input.json: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/syn-rundir/syn-output-full.json
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build syn-to-par

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-rundir/par-output-full.json: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-input.json $(HAMMER_PAR_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-input.json $(HAMMER_EXTRA_ARGS) --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build par

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-par-input.json: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-rundir/par-output-full.json
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-par-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build par-to-sim

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-par-rundir/sim-output-full.json: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-par-input.json $(HAMMER_SIM_PAR_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-par-input.json $(HAMMER_EXTRA_ARGS) --sim_rundir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-par-rundir --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build sim

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-sim-par-input.json: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-par-rundir/sim-output-full.json
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-par-rundir/sim-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-sim-par-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build sim-to-power

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-par-input.json: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-rundir/par-output-full.json
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-par-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build par-to-power

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-par-rundir/power-output-full.json: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-sim-par-input.json /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-par-input.json $(HAMMER_POWER_PAR_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-sim-par-input.json -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-par-input.json $(HAMMER_EXTRA_ARGS) --power_rundir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-par-rundir --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build power

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/drc-input.json: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-rundir/par-output-full.json
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/drc-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build par-to-drc

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/drc-rundir/drc-output-full.json: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/drc-input.json $(HAMMER_DRC_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/drc-input.json $(HAMMER_EXTRA_ARGS) --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build drc

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/lvs-input.json: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-rundir/par-output-full.json
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/lvs-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build par-to-lvs

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/lvs-rundir/lvs-output-full.json: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/lvs-input.json $(HAMMER_LVS_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/lvs-input.json $(HAMMER_EXTRA_ARGS) --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build lvs

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/formal-syn-input.json: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/syn-rundir/syn-output-full.json
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/formal-syn-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build syn-to-formal

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/formal-syn-rundir/formal-output-full.json: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/formal-syn-input.json $(HAMMER_FORMAL_SYN_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/formal-syn-input.json $(HAMMER_EXTRA_ARGS) --formal_rundir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/formal-syn-rundir --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build formal

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/formal-par-input.json: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-rundir/par-output-full.json
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/formal-par-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build par-to-formal

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/formal-par-rundir/formal-output-full.json: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/formal-syn-input.json $(HAMMER_FORMAL_PAR_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/formal-par-input.json $(HAMMER_EXTRA_ARGS) --formal_rundir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/formal-par-rundir --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build formal

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/timing-syn-input.json: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/syn-rundir/syn-output-full.json
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/timing-syn-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build syn-to-timing

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/timing-syn-rundir/timing-output-full.json: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/timing-syn-input.json $(HAMMER_TIMING_SYN_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/timing-syn-input.json $(HAMMER_EXTRA_ARGS) --timing_rundir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/timing-syn-rundir --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build timing

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/timing-par-input.json: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-rundir/par-output-full.json
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/timing-par-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build par-to-timing

/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/timing-par-rundir/timing-output-full.json: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/timing-syn-input.json $(HAMMER_TIMING_PAR_DEPENDENCIES)
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/timing-par-input.json $(HAMMER_EXTRA_ARGS) --timing_rundir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/timing-par-rundir --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build timing

# Redo steps
# These intentionally break the dependency graph, but allow the flexibility to rerun a step after changing a config.
# Hammer doesn't know what settings impact synthesis only, e.g., so these are for power-users who "know better."
# The HAMMER_EXTRA_ARGS variable allows patching in of new configurations with -p or using --to_step or --from_step, for example.
.PHONY: redo-sim-rtl redo-sim-rtl-to-power redo-syn redo-syn-to-sim redo-syn-to-power redo-sim-syn redo-sim-syn-to-power redo-syn-to-par redo-par redo-par-to-sim redo-sim-par redo-sim-par-to-power redo-par-to-power redo-power-par redo-par-to-drc redo-drc redo-par-to-lvs redo-lvs redo-syn-to-formal redo-formal-syn redo-par-to-formal redo-formal-par redo-syn-to-timing redo-timing-syn redo-par-to-timing redo-timing-par

redo-sim-rtl:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/sky130.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sram_generator-output.json -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/design.yml $(HAMMER_EXTRA_ARGS) --sim_rundir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-rtl-rundir --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build sim

redo-sim-rtl-to-power:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-rtl-rundir/sim-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-sim-rtl-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build sim-to-power

redo-power-rtl:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-sim-rtl-input.json $(HAMMER_EXTRA_ARGS) --power_rundir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-rtl-rundir --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build power

redo-syn:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/sky130.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sram_generator-output.json -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/design.yml $(HAMMER_EXTRA_ARGS) --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build syn

redo-syn-to-sim:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-syn-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build syn-to-sim

redo-syn-to-power:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-syn-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build syn-to-power

redo-sim-syn:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-syn-input.json $(HAMMER_EXTRA_ARGS) --sim_rundir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-syn-rundir --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build sim

redo-sim-syn-to-power:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-syn-rundir/sim-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-sim-syn-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build sim-to-power

redo-syn-to-par:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build syn-to-par

redo-power-syn:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-sim-syn-input.json -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-syn-input.json $(HAMMER_EXTRA_ARGS) --power_rundir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-syn-rundir --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build power

redo-par:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-input.json $(HAMMER_EXTRA_ARGS) --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build par

redo-par-to-sim:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-par-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build par-to-sim

redo-sim-par:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-par-input.json $(HAMMER_EXTRA_ARGS) --sim_rundir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-par-rundir --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build sim

redo-sim-par-to-power:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-par-rundir/sim-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-sim-par-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build sim-to-power

redo-par-to-power:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-par-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build par-to-power

redo-power-par:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-sim-par-input.json -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-par-input.json $(HAMMER_EXTRA_ARGS) --power_rundir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/power-par-rundir --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build power

redo-par-to-drc:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/drc-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build par-to-drc

redo-drc:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/drc-input.json $(HAMMER_EXTRA_ARGS) --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build drc

redo-par-to-lvs:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/lvs-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build par-to-lvs

redo-lvs:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/lvs-input.json $(HAMMER_EXTRA_ARGS) --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build lvs

redo-syn-to-formal:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/formal-syn-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build syn-to-formal

redo-formal-syn:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/formal-syn-input.json $(HAMMER_EXTRA_ARGS) --formal_rundir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/formal-syn-rundir --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build formal

redo-par-to-formal:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/formal-par-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build par-to-formal

redo-formal-par:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/formal-par-input.json $(HAMMER_EXTRA_ARGS) --formal_rundir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/formal-par-rundir --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build formal

redo-syn-to-timing:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/timing-syn-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build syn-to-timing

redo-timing-syn:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/timing-syn-input.json $(HAMMER_EXTRA_ARGS) --timing_rundir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/timing-syn-rundir --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build timing

redo-par-to-timing:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/timing-par-input.json --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build par-to-timing

redo-timing-par:
	$(HAMMER_EXEC) -e /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/inst-env.yml -p /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/timing-par-input.json $(HAMMER_EXTRA_ARGS) --timing_rundir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/timing-par-rundir --obj_dir /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build timing

