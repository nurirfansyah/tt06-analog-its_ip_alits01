v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -390 50 -390 60 {
lab=GND}
N -520 50 -390 50 {
lab=GND}
N -520 30 -520 50 {
lab=GND}
N -420 30 -420 50 {
lab=GND}
N -250 20 -210 20 {
lab=GND}
N -250 20 -250 50 {
lab=GND}
N -390 50 -250 50 {
lab=GND}
N -420 -40 -420 -30 {
lab=vc}
N -520 -100 -520 -30 {
lab=#net1}
N -520 -100 -260 -100 {
lab=#net1}
N -260 -100 -260 -40 {
lab=#net1}
N -260 -40 -210 -40 {
lab=#net1}
N -340 0 -210 0 {
lab=vc}
N -340 -40 -340 0 {
lab=vc}
N -420 -40 -340 -40 {
lab=vc}
N -260 -20 -210 -20 {
lab=vcp}
N -310 -30 -310 -20 {
lab=vcp}
N -310 -20 -260 -20 {
lab=vcp}
N -310 -100 -310 -90 {
lab=#net1}
N 180 -40 230 -40 {
lab=out}
N 90 -40 120 -40 {
lab=#net2}
N 210 40 210 50 {
lab=GND}
N -250 50 210 50 {
lab=GND}
N 210 -40 210 -20 {
lab=out}
C {devices/vsource.sym} -520 0 0 0 {name=V1 value=1.8 savecurrent=false}
C {devices/vsource.sym} -420 0 0 0 {name=V2 value="pwl(0s 0.4V 1ms 0.3V 2ms 1.4V)" savecurrent=false}
C {devices/gnd.sym} -390 60 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 230 -40 0 1 {name=p1 sig_type=std_logic lab=out}
C {devices/lab_wire.sym} -420 -40 0 0 {name=p2 sig_type=std_logic lab=vc}
C {devices/code.sym} -260 -230 0 0 {name=TT_MODELS1
only_toplevel=true
format="tcleval( @value )"
value=".lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice tt

.param mc_mm_switch=0
.param mc_pr_switch=1
"
}
C {devices/code.sym} -110 -230 0 0 {name=spice1 only_toplevel=false value="
.option wnflag=0
.option savecurrents
.control
save all
tran 10n 2m 1m
plot vc vcp out
plot i(V1)
write vcro5.raw
op
.endc
"}
C {devices/res.sym} 150 -40 1 0 {name=R1
value=500
footprint=1206
device=resistor
m=1}
C {devices/bsource.sym} -310 -60 0 0 {name=B1 VAR=V FUNC=V(vc)}
C {devices/lab_wire.sym} -310 -20 0 0 {name=p3 sig_type=std_logic lab=vcp}
C {vcro_5elements.sym} -60 -10 0 0 {name=x1}
C {devices/capa.sym} 210 10 0 0 {name=C1
m=1
value=5p
footprint=1206
device="ceramic capacitor"}
