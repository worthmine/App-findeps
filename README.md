# NAME

App::findeps - the Module to find dependencies for files you've selected

# SYNOPSIS

Via the command-line program [findeps](https://metacpan.org/pod/findeps);

    $ findeps Plack.psgi | cpanm
    $ findeps index.cgi | cpanm
    $ findeps t/00_compile.t | cpanm

# DESCRIPTION

App::findeps is base module for executing [findeps](https://metacpan.org/pod/findeps)

# TODO

    $ findeps Some::Module -makeCpanfile > cpanfile

it will be useful to make some safe modules

# LICENSE

Copyright (C) worthmine.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

Yuki Yoshida([worthmine](https://github.com/worthmine))
