use strict;
use warnings;

use Test::More 0.98 tests => 1;
use FastGlob qw(glob);

use lib 'lib';
use App::findeps;

my @files = &glob('./t/scripts/02/*.pl');
my $map   = App::findeps::scan( files => \@files );
my @list  = ();
foreach my $key ( sort keys %$map ) {
    my $version = $map->{$key};
    my $name    = App::findeps::_name($key);
    my $dist    = $name;
    $dist .= "~$version" if length $version;
    push @list, $dist;
}

for (@list) {
    is $_, 'Dummy', "succeed to exclude ./lib/";
}

done_testing;
