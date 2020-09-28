package Common;

use 5.012005;

use strict;
use warnings;

our $VERSION = "0.08";

use Exporter 'import';
our @EXPORT = qw(_name);

sub _name {
    my $str = shift;
    $str =~ s!/!::!g;
    $str =~ s!^lib::!!;
    $str =~ s!.pm$!!i;
    $str =~ s!^auto::(.+)::.*!$1!;
    return $str;
}

1;
