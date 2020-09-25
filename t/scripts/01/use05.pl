#!/usr/bin/env perl

use strict;
use warnings;

use feature qw(say);

our $VERSION = "0.01";

use Data::Dumper qw(Dumper);
require Encode;

# use parent qw(CommentOuted Exporter);
my $dummys = 1;                   # use parent qw(CommentOuted Exporter); # will be ignored
use parent qw(Dummy Exporter);    # only Dummy does not exist

exit;
