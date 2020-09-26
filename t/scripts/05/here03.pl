#!/usr/bin/env perl

use strict;
use warnings;

use feature qw(say);

our $VERSION = "0.01";
my $here = <<"EOL";
require HERE;
use HERE::Somthing;
EOL

require Dummy;    # does not exist anywhere

exit;
