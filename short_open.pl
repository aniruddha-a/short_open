#!/usr/bin/perl -w
#  Aniruddha.A (aniruddha.a@gmail.com)
#  Given abbreviated name  - expand and edit the file
#     underscore/hyphen as seperator
#
#     Usage: <script> <extension> <first-letters>
#               Example: short_open.pl  c  mlp  --> will open  my_lisp_parser.c
#
#            <script> <extension> <first-few-letters> [ <first-few-letters> ...]
#               Example: short_open.pl  h  m list p  --> will open  my_list_parser.h

$editor = shift;
$ext = shift;

if ( scalar(@ARGV) == 1 ) {
    # A few special cases - which I commonly edit
    $in = shift; 
    if ((length($in) == 1) and ($in eq 'm')) {
        system("$editor [Mm]akefile");
        exit 0;
    }
    if ((length($in) == 1) and ($in eq 'R')) {
        system("$editor README");
        exit 0;
    }
    if ((length($in) == 1) and ($in eq 'w')) {
        system("$editor wscript");
        exit 0;
    }
    @p = split( //, $in ); # 1 arg - pick and split each char
}
else {
    @p = (@ARGV); # multi arg - use them as is
}
$res = '^';
$res .= join( '[^_-]*[-_]', @p );
$res .= '[^_-]*[.]';
$res .= $ext . '$';  
$re = qr/$res/;
foreach $a ( glob("*.$ext") ) {
    if ( $a =~ m/$re/ ) {
        print " [$a] \n";
        system ("$editor $a");
        exit 0;
    }
}

# If it were not really a long name with underscore, then try
# a plain short name (assume 1 arg)
if ( scalar(@ARGV) > 1 ) {
    exit 1;
}
$res = $in;   
if ($res !~ /[.]$/ ) { # If user ended with a '.' lets use it
    $res .= '.*[.]';   #  match any part of the file name
}
$res .= $ext;     
$re = qr/$res/;
foreach $a ( glob("*.$ext") ) {
    if ( $a =~ m/$re/ ) {
        print " [$a] \n";
        system ("$editor $a");
        exit 0;
    }
}

