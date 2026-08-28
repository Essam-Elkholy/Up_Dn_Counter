onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand /Up_Dn_Counter_tb/IN_tb
add wave -noupdate /Up_Dn_Counter_tb/CLK
add wave -noupdate /Up_Dn_Counter_tb/Load
add wave -noupdate /Up_Dn_Counter_tb/Up
add wave -noupdate /Up_Dn_Counter_tb/Down
add wave -noupdate /Up_Dn_Counter_tb/High
add wave -noupdate /Up_Dn_Counter_tb/Low
add wave -noupdate -expand /Up_Dn_Counter_tb/counter_tb
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 199
configure wave -valuecolwidth 39
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {307555 ps}
