#!/usr/bin/env perl

use strict;
use warnings;

use feature qw(say);

our $VERSION = "0.01";

use Data::Dumper qw(Dumper);
require Encode;

# use autouse qw(CommentOuted Exporter); # will be ignored
my $dummys = 1;    # use autouse 'CommentOuted' => qw(dummy isdummy); # will be ignored
use autouse 'Dummy' => qw(dummy isdummy);    # Dummy does not exist

exit;
