#!/usr/bin/env perl

use strict;
use warnings;

use feature qw(say);

our $VERSION = "0.01";

eval {    # brace
    require Require::With::Brace;    # not parsed
}    # brace

    eval '    # single quote
    use Use::With::Single::Quote;    # not parsed
' or die $@;    # single quote

my $eval = eval "    # double quote
            require Require::With::Double::Quote;    # not parsed
" || {};        # double quote

exit;
