from all_plots import plotBenchmarkGPU as plot
from all_plots import barBenchmarkGPU as bar
from all_plots import barBeamspaceBenchmarkGPU as barBS

#plot('timer_values_64_80_400.txt', 64, 80, 400, 2, 32)
#plot('timer_values_32_40_400.txt', 32, 40, 400, 2, 32)

bar('timer_values_64_80_400.txt', 64, 80, 400, 2, 32)
bar('timer_values_32_40_400.txt', 32, 40, 400, 2, 16)

barBS('timer_values_M=64_Nx=80_Ny=400_L=2-32_Nb=3_slidingBS.txt', 64, 3, 80, 400, 3, 32)
