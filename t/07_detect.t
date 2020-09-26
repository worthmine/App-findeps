use strict;
use warnings;

use Test::More 0.98 tests => 4;
use FastGlob qw(glob);

my @files = &glob('./t/scripts/05/*.pl');
for my $file (@files) {
    my $done = qx"$^X ./script/findeps $file";
    chomp $done;
    is $done, 'Dummy', "succeed to ignore 'HERE' in here document";
}

#=pod
#my @modules = qw(App::findeps);
my @modules = qw(Caller::easy Utils Module::ScanDeps);
my $map     = {};
for (@modules) {
    eval "require $_";
    if ( !$@ ) {
        while ( my ( $key, $value ) = each %INC ) {
            my $name = _name($key);
            next if $map->{$name}++;
            my $res = qx"corelist $name" unless $name =~ /\.pl$/;
            next                        if !$res or $res !~ /$name was not in CORE/;
            warn "$name$value" and next if $value        =~ /^\(/;
            $res = qx"$^X ./script/findeps $value 2>&1";
            next unless $res;
            next       if $map->{$res}++;
            print $res if $res !~ /^Ready to run/;
        }
    } else {
        note $@;
    }
}

#=cut

done_testing;

sub _name {
    my $str = shift;
    $str =~ s!/!::!g;
    $str =~ s!^lib::!!;
    $str =~ s!.pm$!!i;
    $str =~ s!^auto::(.+)::.*!$1!;
    return $str;
}