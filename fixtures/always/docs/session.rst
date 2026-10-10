IPython session
===============

Code in an rst page that runs when the docs build.

.. ipython:: python

   from testpackage.plotting import square

   print(f"square(5) = {square(5)}")

.. ipython:: python

   import matplotlib.pyplot as plt

   @savefig session_squares.png width=4in
   plt.plot([0, 1, 2], [square(x) for x in [0, 1, 2]]);
