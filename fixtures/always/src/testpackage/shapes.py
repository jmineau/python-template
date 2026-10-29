"""Classes whose constants a subclass sets again, for the API pages."""


class Shape:
    """
    A shape.

    Attributes
    ----------
    corners : int
        How many corners it has.
    """

    #: What the shape is called.
    name: str

    corners: int


class Triangle(Shape):
    """A triangle."""

    name = "triangle"
    corners = 3


class RightTriangle(Triangle):
    """A triangle with a right angle, which sets nothing again."""
