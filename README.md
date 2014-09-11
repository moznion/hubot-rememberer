hubot-chiebukuro
================

Reply the answer dependent on registered message

![https://dl.dropboxusercontent.com/u/14832699/hubot-chiebukuro/hubot-chiebukuro.gif](https://dl.dropboxusercontent.com/u/14832699/hubot-chiebukuro/hubot-chiebukuro.gif)

Commands
--------

- `!<key>`

    Reply registered message by \<key>

- `!<key> <msg>`

    Register \<msg> as \<key>

Installation
------------

- Install with npm

```
$ npm install git://github.com/moznion/hubot-chiebukuro
```

- Add this script name into external-scripts.json, like so;

```
["hubot-chiebukuro"]
```


Notes
-----

This script uses SQLite3 to store responses for each key.
Now, this script creates the `chiebukuro.db` at the same directory of this.

License
-------

MIT

