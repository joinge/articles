# -*- coding: utf-8 -*-
"""
Created on Wed Nov 12 16:27:38 2014

@author: me
"""

import sympy as sp

from sympy.physics.vector import ReferenceFrame
from sympy.physics.vector import curl

R = ReferenceFrame('R')
v1 = R[1]*R[2]*R.x + R[0]*R[2]*R.y + R[0]*R[1]*R.z 

def waveEquation():
    
    c = sp.Symbol('c')
    phi = sp.Symbol('phi')
    
    omega = sp.Symbol('omega')
    t = sp.Symbol('t')
    
    kx,ky,kz = sp.Symbol('kx', 'ky', 'kz')
    x,y,z = sp.Symbol('x', 'y', 'z')
    
    
    A = 