#!/usr/bin/env perl

use strict;
use warnings;

use feature qw(say);

our $VERSION = "0.01";
my @here = ( <<"FIRST", <<'SECOND', <<END);
require HERE;
use HERE::Somthing;
FIRST
    require SECOND;
    use HERE::Second;
SECOND
    require End;
    use HERE::End;
END

require Dummy;    # does not exist anywhere

exit;
