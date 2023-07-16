# Iniciando a simulacao
vsim work.top_timer_de2_115

# Adicionando os sinais de clock e reset
add wave -position insertpoint  \
sim:/top_timer_de2_115/clk_500k \
sim:/top_timer_de2_115/KEY 

# Adicionando os sinais com "radix" unsigned
add wave -position insertpoint -radix unsigned \
sim:/top_timer_de2_115/minT \
sim:/top_timer_de2_115/minU \
sim:/top_timer_de2_115/secT \
sim:/top_timer_de2_115/secU \
sim:/top_timer_de2_115/msecT \
sim:/top_timer_de2_115/msecU \
sim:/top_timer_de2_115/msecC \
sim:/top_timer_de2_115/t0/LFSR_reg \
sim:/top_timer_de2_115/t0/ms_regU \
sim:/top_timer_de2_115/t0/ms_regT \
sim:/top_timer_de2_115/t0/ms_regC \
sim:/top_timer_de2_115/t0/s_regU \
sim:/top_timer_de2_115/t0/s_regT \
sim:/top_timer_de2_115/t0/m_regU \
sim:/top_timer_de2_115/t0/m_regT

# Criando clock e forçando reset
force -freeze sim:/top_timer_de2_115/clk_500k 1 0, 0 {10000 ps} -r 20ns
force -freeze sim:/top_timer_de2_115/KEY 0 0 
run 40ns
force -freeze sim:/top_timer_de2_115/KEY 1 0 
run 40ns


# Forcando alguns valores de borda para verificar o funcionamento
force -freeze sim:/top_timer_de2_115/t0/LFSR_reg 10#140 0 -cancel 20ns
run 200ns
force -freeze sim:/top_timer_de2_115/t0/LFSR_reg 10#140 0 -cancel 20ns
run 200ns
force -freeze sim:/top_timer_de2_115/t0/LFSR_reg 10#140 0 -cancel 20ns
run 200ns
force -freeze sim:/top_timer_de2_115/t0/LFSR_reg 10#140 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/ms_regU 10#9 0 -cancel 20ns
run 200ns
force -freeze sim:/top_timer_de2_115/t0/LFSR_reg 10#140 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/ms_regU 10#9 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/ms_regT 10#9 0 -cancel 20ns
run 200ns
force -freeze sim:/top_timer_de2_115/t0/LFSR_reg 10#140 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/ms_regU 10#9 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/ms_regT 10#9 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/ms_regC 10#9 0 -cancel 20ns
run 200ns
force -freeze sim:/top_timer_de2_115/t0/LFSR_reg 10#140 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/ms_regU 10#9 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/ms_regT 10#9 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/ms_regC 10#9 0 -cancel 20ns
run 200ns
force -freeze sim:/top_timer_de2_115/t0/LFSR_reg 10#140 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/ms_regU 10#9 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/ms_regT 10#9 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/ms_regC 10#9 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/s_regU 10#9 0 -cancel 20ns
run 200ns
force -freeze sim:/top_timer_de2_115/t0/LFSR_reg 10#140 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/ms_regU 10#9 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/ms_regT 10#9 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/ms_regC 10#9 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/s_regU 10#9 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/s_regT 10#5 0 -cancel 20ns
run 200ns
force -freeze sim:/top_timer_de2_115/t0/LFSR_reg 10#140 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/ms_regU 10#9 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/ms_regT 10#9 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/ms_regC 10#9 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/s_regU 10#9 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/s_regT 10#5 0 -cancel 20ns
run 200ns
force -freeze sim:/top_timer_de2_115/t0/LFSR_reg 10#140 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/ms_regU 10#9 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/ms_regT 10#9 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/ms_regC 10#9 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/s_regU 10#9 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/s_regT 10#5 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/m_regU 10#9 0 -cancel 20ns
force -freeze sim:/top_timer_de2_115/t0/m_regT 10#5 0 -cancel 20ns
run 200ns


