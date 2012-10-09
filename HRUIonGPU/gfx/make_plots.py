from all_plots import plotBenchmarkGPU as plot
from all_plots import barBenchmarkGPU as bar

plot('timer_values_64_80_400.txt', 64, 80, 400)
plot('timer_values_32_40_400.txt', 32, 40, 400)

bar('timer_values_64_80_400.txt', 64, 80, 400)
bar('timer_values_32_40_400.txt', 32, 40, 400)