#!/usr/bin/env perl

use strict;
use warnings;

use feature qw(say);

our $VERSION = "0.01";

use lib 't/lib';
use Data::Dumper qw(Dumper);
require Encode;

# eval { use CommentOuted; return CommentOuted->new(); }; # will be ignored
my $dummys = 1;    # eval { use CommentOuted; return CommentOuted->new(); }; # will be ignored
my $dummy  = eval { use Dummy; return Dummy->new(); };    # does not exist anywhere

exit;
