[![Build Status](https://travis-ci.com/worthmine/App-findeps.svg?branch=master)](https://travis-ci.com/worthmine/App-findeps)
# NAME

findeps - A command-line tool that resolves dependencies from Perl modules

# SYNOPSIS

just run like below:

```
$ findeps your_product.pl | cpanm
$ findeps Plack.psgi | cpanm
$ findeps index.cgi | cpanm
$ findeps t/00_compile.t | cpanm

And on your modules directory
$ findeps Your::Module | cpanm
```

Now you're ready to run the product you've made with many modules
without installing them every time

# DESCRIPTION

`findeps` is a simple command line program for ready to run.

```
$ findeps -u index.cgi | cpanm
```

tries to upgrade modules you've already installed  to the newest

```
$ findeps -L=modules Plack.psgi | cpanm
```

If you have a local directory named 'modules' not to be 'lib',
you can choose it and the modules in there are ignored
because you've already holden them.

[scandeps.pl](https://metacpan.org/pod/scandeps.pl) requires you to have [CPANPLUS](https://metacpan.org/pod/CPANPLUS), but this requires just only [cpanm](https://metacpan.org/pod/cpanm).

# DANGEROUS OPTION

```
$ findeps --makeCpanfile Some::Module >| cpanfile
```

It may be useful when you build a new module with [Minilla](https://metacpan.org/pod/Minilla)
but **NOT recommend**

# LICENSE

Copyright (C) worthmine.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

Yuki Yoshida([worthmine](https://github.com/worthmine))
