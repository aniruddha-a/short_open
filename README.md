Short Open
==========

Most of the source files that I work on, follow this `long_underscore_separated_names` convention, 
and I hate to press _TAB TAB TAB_ ...

When I know a file name, or am seeing it on console (with a previous `ls`), 
I want to be able to open a file (in the current directory) with as few keystrokes as possible.

I came up with this mini Perl script, which, when combined with shell aliases
can be a real time saver. 
The same can be achieved with sed/awk or any other regex-well-supported
languages, but Perl is my choice.

Aliases
=======

Here are a few `bash` aliases that I use (which specify the editor I want to use,
and the file extension):

        alias vc='~/short_open.pl vim c' 
        alias vh='~/short_open.pl vim h'
        alias vp='~/short_open.pl vim p[ly]'
        alias vy='~/short_open.pl vim yml'
        alias vd='~/short_open.pl vim diff'
        alias vs='~/short_open.pl vim sh'
        alias vl='~/short_open.pl vim l[ou][ga]'

Given a file like: `my_lisp_parser.c`, I can edit it, in `vim` with 
        
        $ vc mlp
        or
        $ vc m l p

i.e, the first letters of the word. 
In case of ambiguity, say I had another file `my_lex_parser.c` (hypothetical),
can run:

        $ vc m le p

With a small change in the regex, it can be made to 
work on _CamelCase_ file names as well.

