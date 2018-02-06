from sympy import *
from sympy import pprint

A,B,a0,b0 = symbols('A B a0 b0')

#a = A*exp(a0)
#b = B*exp(b0)

a,b = symbols('a b', complex=True)
#b = B*exp(b0)

alpha = symbols('alpha', real=True)

z = (alpha*a - (1-alpha)*b)*conjugate((alpha*a - (1-alpha)*b))

dz = diff(z,alpha)

sol = solve(dz,alpha)



pprint(expand(dz))
pprint(sol)