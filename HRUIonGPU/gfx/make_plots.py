from all_plots import plotBenchmarkGPU as plot
from all_plots import barBenchmarkGPU as bar
from all_plots import barBeamspaceBenchmarkGPU as barBS
from all_plots import barBeamspaceBenchmarkGPU2 as barBS2

#plot('timer_values_64_80_400.txt', 64, 80, 400, 2, 32)
#plot('timer_values_32_40_400.txt', 32, 40, 400, 2, 32)

#bar('timer_values_64_80_400.txt', 64, 80, 400, 2, 32)
#bar('timer_values_32_40_400.txt', 32, 40, 400, 2, 16)

#barBS('timer_values_M=64_Nx=80_Ny=400_L=2-32_Nb=3_slidingBS.txt', 64, 3, 80, 400, 3, 32)
#barBS('timer_values_M=96_Nx=120_Ny=400_L=3-48_Nb=3_slidingBS.txt', 96, 3, 120, 400, 3, 48)

bar('timer_values_M=64_Nx=80_Ny=540_L=2-32.txt', 64, 80, 540, 2, 32)

barBS('timer_values_M=64_Nx=80_Ny=540_L=16-48_Nb=3.txt', 64, 3, 80, 540, 16, 47)
barBS('timer_values_M=96_Nx=120_Ny=540_L=24-72_Nb=3.txt', 96, 3, 120, 540, 24, 71, False)

#barBS2('timer_values_M=64_Nx=80_Ny=606_L=32_Nb=1-5.txt', 64, 32, 80, 606, 1, 5, False)
#barBS2('timer_values_M=96_Nx=120_Ny=606_L=48_Nb=1-5.txt', 96, 48, 120, 606, 1, 5)