# Ruby Service Object Creator Plugin for VIM

The idea behind this little script is to perform quick class/spec creation
from current line with just one command.

Creating new file from inside VIM or from terminal session doesn't seem like a
hard thing to do. Yet many people postpone this to the refactor step or some
unspecified "later time".

When you are in the flow, scaffolding new simple method object seems like a
side task. You have to create new spec, add basic RSpec definition, fill the
class name, then do the same with the actual Ruby file.

Many times I knew the code I am just writing belong to some new Class,
yet I didn't wanted to take this 5-10 second break to scaffold this new
infrastructure. Ridiculous as it may sound there was always unknown friction
or me at this step.

Thats why I want to minimize effort for creating new spec/code so I don't have
to switch context from solving the problem to maintaing the infrastructure.
