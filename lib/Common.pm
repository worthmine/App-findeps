package Common;

use 5.012005;

use strict;
use warnings;

our $VERSION = "0.09";

use Exporter 'import';
our @EXPORT = qw(_name);

sub _name {
    my $str = shift;
    $str =~ s!/!::!g if $str =~ /\.pm$/;
    $str =~ s!^lib::!!;
    $str =~ s!.pm$!!i;
    $str =~ s!^auto::(.+)::.*!$1!;
    return $str;
}

1;
