from numpy import *
from numpy import pi
import numpy as np
import pylab as pl

M = 6.0
N = 1.0
alpha = linspace(0,1,1000)
m = arange(M)

lmda = 1.0
d = lmda/2.0
theta = 5.0*pi/180
w = cos(2*pi*m/(M-1))
aa = exp(1j*2*pi*d*m/lmda*sin(theta))
bb = aa * w

aa = aa / aa.sum()
bb = bb / bb.sum()
print aa.sum(), bb.sum()

x = np.random.uniform(size=(M,N)) + 1j*np.random.uniform(size=(M,N))

a = dot(aa,x)
b = dot(bb,x)

f = outer(alpha,a) - outer((1-alpha),b)

z1 = np.abs(f)**2 + 0.05

z2 = outer(alpha**2, a*a.conj() + a*b.conj() + a.conj()*b + b*b.conj()) \
   - outer(alpha,    a*b.conj() + a.conj()*b + 2*b*b.conj()) \
   + b*b.conj()

sol = (a*b.conj() + a.conj()*b + 2*b*b.conj())/(2*(a*a.conj() + a*b.conj() + a.conj()*b + b*b.conj()))

#z1 = outer(alpha,a) - outer((1-alpha),b)

fn = pl.figure()
ax = fn.add_subplot(111)
#ax.plot(z2.T)
ax.plot(alpha,z1)
ax.plot(alpha,z2)
ax.plot([sol]*2,[alpha.min(),alpha.max()],'k')

#print sol
#z1 = dot(outer(array(meshgrid(ones(M),alpha)[0]) - outer((1-alpha),w)),x)


pl.show()

#print a
#print b


#A,B,a0,b0 = symbols('A B a0 b0')

##a = A*exp(a0)
##b = B*exp(b0)

#a,b = symbols('a b', complex=True)
##b = B*exp(b0)

#alpha = symbols('alpha', real=True)

#hmm = expand((alpha*a - (1-alpha)*b)*conjugate((alpha*a - (1-alpha)*b)))

#pprint(hmm)