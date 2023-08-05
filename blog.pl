#!/usr/bin/perl
# Felipe Gonzalez Perl Blog Admin

########################################################
# DO NOT REMOVE THIS HEADER
# Many of the commented lines are in english to
# make it more portable to others possible developers.
########################################################
#
# COPYRIGHT NOTICE
# Copyright 2004 Felipe A. Gonzalez
# All Rights Reserved.
#
# This script can be used\modified free of charge
# as long as you don't change this header, or the
# parts of this script that generates the script
# info.  If you really need to remove these, go to
#
#
# By using this script you agree to indemnify me from
# any liability that might arise from its use.
#
# Redistributing\selling the code for this program
# without prior written consent is expressly
# forbidden.
#
########################################################
#
# By Computer Science Engineer: Felipe Alfonso Gonzalez 
# EMail: (f.alfonso@res-ear.ch)
# Started : Jan 16, 2005
#
########################################################
#
# If this script doesn't work for you try
# adjusting the first line above to
#                #!/usr/local/bin/perl
# DO NOT REMOVE THE # OR ! or add any spaces.
#
# IF YOU WANT TO USE IT FOR YOUR OWN DONT FORGET
# TO MAKE IT EXECTUABLE, (CHMOD +X *.pl) AND TO
# GIVE IT THE RIGHT PERMISSIONS, (CHMOD 755 *.pl).
# --
# INSTALLING DBI ON MAC
# -
# sudo cpan Bundle::DBI (USE SUDO)
########################################################

########################################################
my($database,$host,$data_source,$username,$password,$dbh,$usr_log,$usr_pwd);
########################################################
# DB Configuration
########################################################

$database = "felipe";
$host = "localhost";
$username = "root2";
# set the password here
$password = "root2";
#------------------------------------------------------

$data_source = "DBI:mysql:$database:$host";

########################################################
#calling the libraries

use CGI;
use strict;
use warnings;
use DBI;


#to define the $cgi variable as a paremeter
my $cgi=new CGI; #read in parameters

#print $cgi->header(); #print a header

#tried to find a way to insert a css template
print "Content-type: text/html\n\n";
print "<title>PerlMemoPad - Perl Mini Weblog</title>";
print "<link href=\"./style.css\" rel=\"stylesheet\" type=\"text/css\" >";
print "   <link rel=\"icon\" href=\"./favicon.ico\" type=\"image/ico\" > ";
print "      <link rel=\"shortcut icon\" href=\"./favicon.ico\" type=\"image/ico\" > ";

#print "<script type=\"text/javascript\" language=\"javascript\" src=\"js.js\"></script>";

#print "<script language=\"JavaScript\">
#<!--

#var username = prompt(\"Ingrese Nombre de Usuario\",\"\")
#var password = prompt(\"Ingrese Password\",\"\")

#if (username !=\"$usr_log\" || password !=\"$usr_pwd\")

#{ top.location=\"about:Bad Username and/or Password\" }
#else

#//{

#//top.location=\"./blog.pl\"
#//}
#//-->
#</script>";

my ($qs);
my $version = "1.0b";
#print $cgi->start_html("written at the fly and left behind by the world wide web - in version $version"); #generate html document
print "<pre>";
#print"         -- - *.cgi-bin:,:/,,*.pl,,,,.. post it,. at any time\n";
print"         a note: html, is a href=blahblahblah.html target=_blank\n";
print"            do not use quotation marks.i\n";
print "            <b>  [ <a href=\"blog.pl\">refresh</a> ]</b><br>\n";

#generrating a input box text for search paarameters
#print "     <br><form method=\"post\" action=\"py.pl?$qs \">";
#print "<input type=text name=\"qs\">";
#print "  <input type=\"submit\" value=\"Buscar Noticias\">";
#print "</center><br>";
#----- printing sys info
#my $sys = "system(\"uptime\");";
#print "<br>$sys<br>";
#system("uptime");
#print "<h3>";
#system("date");
#print "</h3>";

print "<hr size=1><br>";
#----- end
#print "String de busqueda:<i><b> ", $cgi->param('qs'), "</b></i> .
# Sus resultados de busqueda fueron:<br>";

###
#delcaring the vars
my ($sth, $sth2, $sth3, $a, $b, $c, $d);
my ($c1, $c2 , $c3, $c4, $c5, $k, $sth55);

#conecion a la base de datos mediante la libreria DBI
#conection to the db using the DBI library application

#my $dbh=DBI->connect('dbi:mysql:py', 'root', '') ||
#my $dbh=DBI->connect('DBI:mysql:database=py;host=sdf.zapto.org','root','') ||
# die "Error opening database: $DBI::errstr\n";
$dbh = DBI->connect($data_source, $username, $password) or die "Imposible conectar con $data_source: " . $dbh->errstr . "\n";

#$dbh->disconnect || die "Failed to disconnect\n";

#en la siguiente seccin intenare arma un sql con la varinal�e de la url
#in the following section the intention is to build an sql with post var
#$qs = $FORM{'s'};
#����������������������������������������������������
#my($qs);
#if ($FORM{'qs'} eq "$qs") {

#my $qs = $cgi->param('qs');
#if (my $qs = $cgi->param('qs')) {


#}
#print "$sth\n";



#��������������������
$sth2=$dbh->prepare("select * from pmpad ORDER BY id DESC;") ||
 die "Prepare failed: $DBI::errstr\n";

#print "$sth\n";


$sth2->execute() ||
 die "Couldn't execute query: $DBI::errstr\n";
 my($sth_com);


#my ($e);

#i built a boocle to display the reached notices

#my("$a, $b, $c, $d");
#time
my($time);
$time=(localtime(time));
#print "$time";
#
while (($a, $b, $c, $d) = $sth2 ->fetchrow_array) {


#print "<pre>";
#print "<a href=\"?id=$a\">";
#print "<s><b><i>ID: $a </i></b></s>\n";
#print "</a>";
#print "        date: $b\n";
#print "    --<a href=\"?id=$a#show\"> $c </a>";
#print "    --<a href=\"blog.pl?id=$a\"> $c </a>";
#print "    --<a href=\"comment.pl?id=$a\"> $c </a>";
#print $c;
print $c;
$sth55=$dbh->prepare("SELECT COUNT(0) FROM pmpad_com where id_iddata ='$a'") ||
 die "Prepare failed: $DBI::errstr\n";

$sth55->execute() ||
 die "Couldn't execute query: $DBI::errstr\n";


        while (($c1, $c2 , $c3, $c4, $c5) = $sth55 ->fetchrow_array) {
        print " - <a href=\"./comment.pl?id=$a#show\">leer mas</a>";
        print " - There're : ". $c1 ." comments "  ;


        }

#fecha
print "   $b\n ";
#print "  $time\n";
#print "       </pre>";


}

# comentarios


# fin comentarios

#-------declr. vars..
my ($sth5, $date, $subject, $FORM, $submit, $message, $post);
#my ($sth5, $date );
#������������������������������������

#��������������������������������������
print "<hr size=1><br>";
print "<left>By Computer Science Engineer: Felipe Alfonso Gonzalez (f.alfonso\@res-ear.ch) - Powered by Perl / MySQL</left>";
print "</pre>\n";

#���������������������������������������������������������������

#������������� display for id
#my($id, $sth3);
if (my $id = $cgi->param('id')) {

$sth3=$dbh->prepare("select * from pmpad where id like '%$id%' ;") ||
 die "Prepare failed: $DBI::errstr\n";


#print "$sth\n";


    $sth3->execute() ||
     die "Couldn't execute query: $DBI::errstr\n";

    my($k,$l, $z, $x, $v);
    while (($k, $l , $z, $x, $c) = $sth3 ->fetchrow_array) {
    print "<a name=\"show\">";
    print "<pre>";
    print ("$k\n");
    print ("$l\n");
    print ("$z\n");
    print ("$x\n");
    print ("$v\n");
    print "</font></pre>";
    }
}
#

print $cgi->end_html();



