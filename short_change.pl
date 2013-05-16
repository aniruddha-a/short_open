#!/usr/bin/perl -w

if ( scalar(@ARGV) == 1 ) {
    @p = split( //, shift ); # 1 arg - pick and split each char
} else {
    @p = (@ARGV); # multi arg - use them as is
}

$path = "";
foreach $d (@p) {
    @n = glob("$d*");
    if (scalar(@n) > 1) {
        print "Invalid: too many matches: @n";
        exit 1;
    } else {
        if (defined $n[0]) {
            chdir ($n[0]);
            $path .= $n[0] . "/";
        } else {
            print "Invalid: No such path: $path...!";
            exit 1;
        }
    }
}
print $path, "\n";
