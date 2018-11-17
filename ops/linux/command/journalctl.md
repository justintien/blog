```
Just use the journalctl command, as in:

journalctl -u service-name.service
Or, to see only log messages for the current boot:

journalctl -u service-name.service -b
For things named <something>.service, you can actually just use <something>, as in:

journalctl -u service-name
But for other sorts of units (sockets, targets, timers, etc), you need to be explicit.

In the above commands, the -u flag is short for --unit, and specifies the name of the unit in which you're interested.  -b is short for --boot, and restricts the output to only the current boot so that you don't see lots of older messages. See the journalctl man page for more information.
```