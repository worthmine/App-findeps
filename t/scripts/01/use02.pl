#!/usr/bin/env perl

use strict;
use warnings;

use feature qw(say);

our $VERSION = "0.01";

use Data::Dumper qw(Dumper);
require Encode;

# use CommentOuted qw(Dummy); # will be ignored
my $dummys = 1;         # use CommentOuted qw(Dummy); # will be ignored
use Dummy qw(Dummy);    # does not exist

exit;
