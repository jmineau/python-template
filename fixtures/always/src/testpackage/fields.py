"""A dataclass whose fields default to functions, for the API pages."""

from collections.abc import Callable
from dataclasses import dataclass


def shout(text: str) -> None:
    """Print *text* in capitals."""
    print(text.upper())


@dataclass
class Logger:
    """
    Writes messages.

    Parameters
    ----------
    write : callable, optional
        Where the messages go: a function of one string.
    echo : callable, optional
        Where a copy goes. Default is `print`.
    """

    #: Where the messages go, a function of one string.
    write: Callable[[str], None] = shout

    echo: Callable[[str], None] | None = print

    def send(self, message: str) -> None:
        """Write *message* to `write` and `echo`."""
        self.write(message)
        if self.echo is not None:
            self.echo(message)
