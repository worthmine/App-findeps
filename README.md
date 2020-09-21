[![Build Status](https://travis-ci.com/worthmine/App-findeps.svg?branch=master)](https://travis-ci.com/worthmine/App-findeps) [![MetaCPAN Release](https://badge.fury.io/pl/App-findeps.svg)](https://metacpan.org/release/App-findeps)
# NAME

App::findeps - the Module to find dependencies for files you've selected

# SYNOPSIS

Via the command-line program [findeps](https://metacpan.org/pod/findeps);

    $ findeps Plack.psgi | cpanm
    $ findeps index.cgi | cpanm
    $ findeps t/00_compile.t | cpanm

# DESCRIPTION

App::findeps is a base module for executing [findeps](https://metacpan.org/pod/findeps)

# TODO

[Plack::Builder](https://metacpan.org/pod/Plack%3A%3ABuilder) import modules `Plack::Middleware::*` with `enable`
but it's not supported yet.

# SEE ALSO

[findeps](https://metacpan.org/pod/findeps)

# LICENSE

Copyright (C) worthmine.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

Yuki Yoshida([worthmine](https://github.com/worthmine))
