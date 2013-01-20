'''
Created on Mar 22, 2011

@author: me
'''

#import framework.calc as calc
#from framework.calc import db
#from framework.mynumpy import size, arange, log10, pi, linspace, mean, cos, sin, arcsin, unique, zeros
from numpy import size, arange, log10, pi, linspace, mean, cos, sin, arcsin, unique, zeros
#from framework.mynumpy import mode_
#import framework.mynumpy as np
import numpy as np
from scipy import io
#from framework.
from pylab import legend,grid, plot, imshow, ion, ioff, figure, savefig, cm, xlim, ylim, clim, xticks, subplot, subplots_adjust, get_current_fig_manager, setp, colorbar, xlabel, ylabel,show, gca
#import mypylab as pl
#from mpl_toolkits.axes_grid1 import ImageGrid
#from framework.gfuncs import error

GFX_PATH='/home/me/Work/Phd/Code/gfx'



def plotBenchmarkGPU(filename, M, Nx, Ny, fromL, toL):

   print "Reading ", filename
   
   timings = np.loadtxt(filename)

   print 'Timings ', timings.shape
   
   min_L = fromL
   max_L = toL

   yavg1 = timings[0::3,:]
   yavg2 = timings[1::3,:]
   yavg3 = timings[2::3,:]
   yavg1_sum = yavg1.sum(1)
   yavg2_sum = yavg2.sum(1)
   yavg3_sum = yavg3.sum(1)
   
   print 'Yavg1 ', yavg1.shape
   print 'Yavg2 ', yavg2.shape
   print 'Yavg3 ', yavg3.shape
   
   fig = figure()
   ax = fig.add_subplot(1,1,1)
   cax = ax.plot(range(min_L,max_L+1), yavg1[:,0], 'r')
   cax = ax.plot(range(min_L,max_L+1), yavg1[:,1], 'g')
   cax = ax.plot(range(min_L,max_L+1), yavg1[:,2], 'b')
   cax = ax.plot(range(min_L,max_L+1), yavg1_sum, 'k')
   
   cax = ax.plot([0,0.001],[0,0], 'k')
   cax = ax.plot([0,0.001],[0,0], ':k')
   cax = ax.plot([0,0.001],[0,0], '--k')
   legend(('Calc covariance matrices','Nvidia solver','Calc beamformer output','Total', 'K = 0','K = 1','K = 2'), loc='upper left')
#   gca().add_artist(l1)
   
   cax = ax.plot(range(min_L,max_L+1), yavg2[:,0], ':r')
   cax = ax.plot(range(min_L,max_L+1), yavg2[:,1], ':g')
   cax = ax.plot(range(min_L,max_L+1), yavg2[:,2], ':b')   
   cax = ax.plot(range(min_L,max_L+1), yavg2_sum, ':k')
   
   cax = ax.plot(range(min_L,max_L+1), yavg3[:,0], '--r')
   cax = ax.plot(range(min_L,max_L+1), yavg3[:,1], '--g')
   cax = ax.plot(range(min_L,max_L+1), yavg3[:,2], '--b')
   cax = ax.plot(range(min_L,max_L+1), yavg3_sum, '--k')

   
   ax.set_title('M=%d, %d beams, %d samples in range'%(M,Nx,Ny), fontsize='large')
   xlabel('L')
   ylabel('Execution time [ms]')
   
   savefig('./benchmark_plot_%d_%d_%d'%(M,Nx,Ny))
   

def barBenchmarkGPU(filename, M, Nx, Ny, fromL, toL):
   
   print "Reading ", filename
   
   timings = np.loadtxt(filename)

   print 'Timings ', timings.shape
   
   parameters = []
   
   min_L = fromL
   max_L = toL

   yavg1 = timings[0::3,:]
   yavg2 = timings[1::3,:]
   yavg3 = timings[2::3,:]
   yavg1_sum = yavg1.sum(1)
   yavg2_sum = yavg2.sum(1)
   yavg3_sum = yavg3.sum(1)
   
   width = 1
   x_range = arange(min_L,max_L+1)
   
   fig = figure()
   ax = fig.add_subplot(1,1,1)
   cax5 = ax.bar(x_range, yavg1[:,2], width, color='0.25')
   cax4 = ax.bar(x_range, yavg1[:,1], width, bottom=yavg1[:,2], color='0.5')
   cax1 = ax.bar(x_range, yavg1[:,0], width, bottom=(yavg1[:,1] + yavg1[:,2]), color='0.75')
   
   cax2 = ax.bar(x_range + 1/3.0, yavg2[:,0], width/3.0, bottom=(yavg1[:,1] + yavg1[:,2]), color='0.75', hatch='/')
   cax3 = ax.bar(x_range + 2/3.0, yavg3[:,0], width/3.0, bottom=(yavg1[:,1] + yavg1[:,2]), color='0.75', hatch='o')
   
   # calc acquisition rate for the given number of beams if depth equals 15.4cm.
   acq_speed = 0.2*Nx
   cax6 = ax.plot([0, max_L+1], [acq_speed, acq_speed], '-', color='0.2')

   #cax = ax.plot([0,0.001],[0,0], 'k')
   #cax = ax.plot([0,0.001],[0,0], ':k')
   #cax = ax.plot([0,0.001],[0,0], '--k')
   legend((cax1[0], cax2[0], cax3[0], cax4[0], cax5[0], cax6[0]),
          ('Calculate covariance matrices (K=0)', 
           'Calculate covariance matrices (K=1)', 
           'Calculate covariance matrices (K=2)', 
           'Nvidia solver',
           'Calculate beamformer output',
           'Real time requirement'), 
          loc='upper left')
   #legend(('Calc covariance matrices','Nvidia solver','Calc beamformer output','Total', 'K = 0','K = 1','K = 2'), loc='upper left')
#   gca().add_artist(l1)
   
   #cax = ax.plot(range(min_L,max_L+1), yavg2[:,0], ':r')
   #cax = ax.plot(range(min_L,max_L+1), yavg2[:,1], ':g')
   #cax = ax.plot(range(min_L,max_L+1), yavg2[:,2], ':b')   
   #cax = ax.plot(range(min_L,max_L+1), yavg2_sum, ':k')
   
   #cax = ax.plot(range(min_L,max_L+1), yavg3[:,0], '--r')
   #cax = ax.plot(range(min_L,max_L+1), yavg3[:,1], '--g')
   #cax = ax.plot(range(min_L,max_L+1), yavg3[:,2], '--b')
   #cax = ax.plot(range(min_L,max_L+1), yavg3_sum, '--k')

   if M > 32:
      x_range = arange(min_L, max_L+1, 2)
   
   ax.set_title('M=%d, %d angles, %d samples in range'%(M,Nx,Ny), fontsize='large')
   xlabel('L')
   ylabel('Execution time [ms]')
   xlim((min_L, max_L+1))
   xticks(x_range+width/2.0, x_range )
   
   savefig('./benchmark_bar_%d_%d_%d'%(M,Nx,Ny))

def barBeamspaceBenchmarkGPU(filename, M, Nb, Nx, Ny, fromL, toL):
   
   print "Reading ", filename
   
   timings = np.loadtxt(filename)

   print 'Timings ', timings.shape
   
   min_L = fromL
   max_L = toL

   yavg1 = timings[0::3,[1, 2, 6, 8]]
   yavg2 = timings[1::3,[1, 2, 6, 8]]
   yavg3 = timings[2::3,[1, 2, 6, 8]]
   yavg1_sum = yavg1.sum(1)
   yavg2_sum = yavg2.sum(1)
   yavg3_sum = yavg3.sum(1)

   print 'Yavg1 ', yavg1.shape
   print 'Yavg2 ', yavg2.shape
   print 'Yavg3 ', yavg3.shape

   width = 1
   x_range = arange(min_L,max_L+1)
   
   K = 2
   yavg = yavg3
   
   fig = figure()
   ax = fig.add_subplot(1,1,1)
   cax4 = ax.bar(x_range, yavg[:,3], width, color='0.25')
   cax3 = ax.bar(x_range, yavg[:,2], width, bottom=yavg[:,3], color='0.5')
   cax2 = ax.bar(x_range, yavg[:,1], width, bottom=(yavg[:,3] + yavg[:,2]), color='0.75')
   cax1 = ax.bar(x_range, yavg[:,0], width, bottom=(yavg[:,3] + yavg[:,2] + yavg[:,1]), color='0.75',  hatch='o')
   
   # calc acquisition rate for the given number of beams if depth equals 15.4cm.
   acq_speed = 0.2*Nx
   cax5 = ax.plot([0, max_L+1], [acq_speed, acq_speed], '-', color='0.2')
   
   #cax2 = ax.bar(x_range + 1/3.0, yavg2[:,0], width/3.0, bottom=(yavg1[:,1] + yavg1[:,2]), color='0.75', hatch='/')
   #cax3 = ax.bar(x_range + 2/3.0, yavg3[:,0], width/3.0, bottom=(yavg1[:,1] + yavg1[:,2]), color='0.75', hatch='o')

   #cax = ax.plot([0,0.001],[0,0], 'k')
   #cax = ax.plot([0,0.001],[0,0], ':k')
   #cax = ax.plot([0,0.001],[0,0], '--k')
   legend((cax1[0], cax2[0], cax3[0], cax4[0], cax5[0]),('Beamspace transform', 'Calculate covariance matrices', 'Nvidia solver','Calculate beamformer output', 'Real time requirement'), loc='lower left')
   #legend(('Calc covariance matrices','Nvidia solver','Calc beamformer output','Total', 'K = 0','K = 1','K = 2'), loc='upper left')
#   gca().add_artist(l1)
   
   #cax = ax.plot(range(min_L,max_L+1), yavg2[:,0], ':r')
   #cax = ax.plot(range(min_L,max_L+1), yavg2[:,1], ':g')
   #cax = ax.plot(range(min_L,max_L+1), yavg2[:,2], ':b')   
   #cax = ax.plot(range(min_L,max_L+1), yavg2_sum, ':k')
   
   #cax = ax.plot(range(min_L,max_L+1), yavg3[:,0], '--r')
   #cax = ax.plot(range(min_L,max_L+1), yavg3[:,1], '--g')
   #cax = ax.plot(range(min_L,max_L+1), yavg3[:,2], '--b')
   #cax = ax.plot(range(min_L,max_L+1), yavg3_sum, '--k')

   if M > 32:
      x_range = arange(min_L, max_L+1, 2)
   if M > 64:
      x_range = arange(min_L, max_L+1, 3)
   
   ax.set_title('M=%d, K=%d, Nb=%d, %d angles, %d samples in range'%(M,K,Nb,Nx,Ny), fontsize='large')
   xlabel('L')
   ylabel('Execution time [ms]')
   xlim((min_L, max_L+1))
   xticks(x_range+width/2.0, x_range )
   if acq_speed > yavg.max():
      ylim((0, acq_speed+1))
   else:
      ylim((0, yavg.max()+1))
   
   savefig('./benchmark_bar_bs_M=%d_Nx=%d_Ny=%d_Nb=%d'%(M,Nx,Ny,Nb))
