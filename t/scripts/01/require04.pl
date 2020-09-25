#!/usr/bin/env perl

use strict;
use warnings;

use feature qw(say);

our $VERSION = "0.01";

use Data::Dumper qw(Dumper);

# eval { require CommentOuted }; # will be ignored
my $dummys = 1;            # eval { require CommentOuted }; # will be ignored
eval { require Dummy };    # does not exist anywhere

exit;
