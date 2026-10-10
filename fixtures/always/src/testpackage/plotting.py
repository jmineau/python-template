"""A function whose docstring example draws a figure when the docs build."""


def square(x: float) -> float:
    """
    Square a number.

    Parameters
    ----------
    x : float
        The number.

    Returns
    -------
    float
        `x` squared.

    Examples
    --------
    .. plot::

       >>> import matplotlib.pyplot as plt
       >>> from testpackage.plotting import square
       >>> xs = [0, 1, 2, 3]
       >>> _ = plt.plot(xs, [square(x) for x in xs])
    """
    return x * x
