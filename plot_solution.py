"""Scatter plor of GA solution
    """

import sys

import matplotlib as mpl
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import cm
from matplotlib.offsetbox import (TextArea, DrawingArea, OffsetImage,
                                  AnnotationBbox)


#for pdf output
from matplotlib.backends.backend_pdf import PdfPages

#for filtering
import scipy.ndimage


#---process PMF file into 2D arrays


fig = plt.figure()
a=fig.add_subplot(1,1,1)
colours=['red','blue','green','orange','black','purple','grey','cyan','pink','red','blue','green','orange','black','purple','grey','cyan','pink']
markrs=['*','+','.','x','o','s','P','X','1','2','3','D']
#---read in scatterplot data1
plots =[]
with open(sys.argv[1]) as f:
    x_room,y_room=f.readline().split(',');
    x_room=int(x_room);
    y_room=int(y_room.strip());
    lines = f.readlines()
    for line in lines:
        if line:
            x_vals, y_vals=[],[]
            line=line.split('\t')
            for pair in line:
                x,y=pair.split(',')
                x_vals.append(float(x))
                y_vals.append(float(y))
            a.scatter(x_vals,y_vals,color=colours.pop(0),marker=markrs.pop(0)) #scatterplot

f.close()





#Label for graph and axes
#plt.title(sys.argv[1])
a.set_xlim(0,x_room)
a.set_ylim(0,y_room)

a.set_xlabel('$x$', fontsize=16)
a.set_ylabel('$y$', fontsize=16)

#a.set_zlabel('E ($kcal.mol^{-1}$)')

pp = PdfPages('solution.pdf')
pp.savefig()
pp.close()


#mpl.rc('font',**{'family':'sans-serif','sans-serif':['Helvetica']})


plt.show()
#save to file


