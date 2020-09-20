#!/usr/bin/env perl

use strict;
use warnings;

use feature qw(say);

our $VERSION = "0.01";

use lib 't/lib';
use Data::Dumper qw(Dumper);
require Encode;
use parent qw(Dummy);    # is not exist

exit;
