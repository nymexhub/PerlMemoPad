#!/usr/bin/perl
# Felipe Gonzalez Perl Blog - Comments

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
# By Felipe A. Gonzalez                               
# E-mail : felipe@nic-nac-project.org (info/bugs)       
# Started : Jan 16, 2005              
# Last code-review: Aug 25, 2010
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
########################################################

########################################################
my($database,$host,$data_source,$username,$password,$dbh);
########################################################
# DB Configuration
########################################################

$database = "felipe";
$host = "localhost";
$username = "felipe";
# set the password here
$password = "";
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

#ii tried to find a way to insert a css template
#looking for a solution
print "Content-type: text/html\n\n";
print "<title>Perl Weblog</title>";
print "<link href=\"http://nic-nac-project.org/~felipe/style_epweblog.css\" rel=\"stylesheet\" type=\"text/css\" >";
print "   <link rel=\"icon\" href=\"../favicon.ico\" type=\"image/ico\" > ";
print "      <link rel=\"shortcut icon\" href=\"../favicon.ico\" type=\"image/ico\" > ";

my ($qs);
my $version = "1.1";
#print $cgi->start_html("written at the fly and left behind by the world wide web - in version $version"); #generate html document
print "<pre>"; 
#print"         -- - *.cgi-bin:,:/,,*.pl,,,,.. post it,. at any time\n";
print"         a note: html, is a href=blahblahblah.html target=_blank\n";
print"            do not use quotation marks.i\n";
print "            <b>  <a href=\"blog.pl\">GO TO BLOG MAIN PAGE</a></b><br>\n";

#generrating a input box text for search paarameters
#print "     <br><form method=\"post\" action=\"py.pl?$qs \">";
#print "<input type=text name=\"qs\">";
#print "  <input type=\"submit\" value=\"Buscar Noticias\">";
#print "</center><br>";
#----- printing sys info
#my $sys = "system(\"uptime\");";
#print "<br>$sys<br>";
#system("uptime");
#system(" date");
print "<br>";
#----- end
#print "String de busqueda:<i><b> ", $cgi->param('qs'), "</b></i> .
# Sus resultados de busqueda fueron:<br>";

###
#delcaring the vars
my ($sth, $sth2, $sth3, $a, $b, $c, $d);

#conecion a la base de datos mediante la libreria DBI
#conection to the db using the DBI library application

#my $dbh=DBI->connect('dbi:mysql:py', 'root', 'fafarafa') ||
#my $dbh=DBI->connect('DBI:mysql:database=py;host=sdf.zapto.org','root','') ||
# die "Error opening database: $DBI::errstr\n";
$dbh = DBI->connect($data_source, $username, $password) or die "Imposible conectar con $data_source: " . $dbh->errstr . "\n";

#$dbh->disconnect || die "Failed to disconnect\n";

#en la siguiente seccin intenare arma un sql con la varinal�e de la url
#in the following section the intention is to build an sql with post var 
#$qs = $FORM{'s'};
#my($qs);
#if ($FORM{'qs'} eq "$qs") {

#my $qs = $cgi->param('qs');
#if (my $qs = $cgi->param('qs')) {


#}
#print "$sth\n";
$sth2=$dbh->prepare("select * from blog ORDER BY id DESC;") ||
 die "Prepare failed: $DBI::errstr\n";
#print "$sth\n";
 $sth2->execute() ||
 die "Couldn't execute query: $DBI::errstr\n";


#my ($e);

#i built a boocle to display the reached notices
#se contruye un bucle par adesplegar las noticias de la db

#my("$a, $b, $c, $d");
#�����������������time������������������
my($time);
$time=(localtime(time));
#print "$time";
#����������������������������
	while (($a, $b, $c, $d) = $sth2 ->fetchrow_array) {

	#print "<pre>";
	#print "<a href=\"?id=$a\">";
	#print "<s><b><i>ID: $a </i></b></s>\n";
	#print "</a>";
	#print "        date: $b\n";
	#print "    --<a href=\"?id=$a#show\"> $c </a>";
	#print "    --<a href=\"comment.pl?id=$a#show\"> $c </a>";
	#print "   <b>$b</b>\n ";
	#print "  $time\n";

	#print "       </pre>";
	}



#declr. vars..
my ($id, $sth5, $date, $subject, $FORM, $submit, $message, $post);
#my ($sth5, $date );
my $id_com = $cgi->param('id');


if (my $id = $cgi->param('id')) {
my($sthy);
$sthy=$dbh->prepare("select * from blog where id like '%$id%' ;") ||
 die "Prepare failed: $DBI::errstr\n";

#print "$sth\n";
#
#
$sthy->execute() ||
  die "Couldn't execute query: $DBI::errstr\n";
 
my($ky,$ly, $zy, $xy, $vy, $cy);

	  while (($ky, $ly , $zy, $xy, $cy) = $sthy ->fetchrow_array) {
	  print "</pre><pre><a name=\"show\"><table class=\"dottedlines\"><tr>";
	  print "";
	  print ("<td>$ky - \n");
	  print ("$ly</td></tr><tr>\n");
	  print ("<td><b>$zy -</tr><tr> ");
	  print ("<td>$xy</td>");
	  print ("<td>$vy</b></td>");
	  print "</tr></table></font>";
	  }
}
  
print "<p><form action=\"comment.pl?\" method=post>";
print "<table><tr><td>";
print "$id_com<br> ";
print "<input type=\"hidden\" name=\"id_master\" class=white  readonly=\"readonly\" value=\"$id_com\"><br> ";
print "Your name: <br><input type=\"text\" name=\"subject\" class=white><br> ";
#print "<imput text name=\"subject\" size=24 class=white  rows=8 cols=28 wrap=virtual> ";
#print "<textarea name=subject class=white rows=8 cols=28 wrap=virtual></textarea> ";
#print "\n";
print "<s> ";
print "Comment: <br><textarea name=message class=white rows=8 cols=28 wrap=virtual></textarea> ";
print "<s><input type=submit class=white value=\"post\"> <input type=reset class=white value=\"reset\"></td></tr></s>";
print "</table></form></p>";

#inserting the data into the database
if (my $id_master = $cgi->param('id_master')) {


my $message = $cgi->param('message');
#my $id_com = $cgi->param('id_master');
#recogo el id del campo id_master que esta escondida ... >
my $subject = $cgi->param('subjet');
$sth5=$dbh->prepare("INSERT INTO `blog_com` ( `id` , `id_iddata` ,`nombre` , `comenta` , `activo` )
VALUES (
'', '$id_master', '$subject', '$message', '0'
);") ||
 die "Prepare failed: $DBI::errstr\n";

$sth5->execute() ||
 die "Couldn't execute query: $DBI::errstr\n";
print " Submitted! ";
print "<script LANGUAGE=\"JavaScript\">
var pagina=\"comment.pl?id=$id_master\"
function redireccionar()
{
location.href=pagina
}
setTimeout (\"redireccionar()\", 0);
</script>";

}


#......................................................................
# display for id for any comments
#my($id, $sth3);
if (my $id = $cgi->param('id')) {
$sth3=$dbh->prepare("select * from blog_com where id_iddata like '%$id_com%' ;") ||
 die "Prepare failed: $DBI::errstr\n";
#print "$sth\n";
$sth3->execute() ||
 die "Couldn't execute query: $DBI::errstr\n";
 
my($k,$l, $z, $x, $v);
print "<p><br><h3>Comments:</h3><br>";
#print "<table class=\"dottedlines\">";
	while (($k, $l , $z, $x, $c) = $sth3 ->fetchrow_array) {
	#print "<a name=\"show\">";
	print "<table class=\"dottedlines\"><pre><tr>";
	#print ("$k\n");
	print ("<td>$l</td>\n");
	print ("<td><h3><u>$z</u>, wrote:</h3></td>\n");
	print ("<td>$x</td></tr>\n");
	print "</table>";
	#print ("$v\n");
	print "--------------------------------------------------------------------------<br></font></p>";
	}
#print "</table>";
}

print "--------------------------------------------------------------------------\n";
print"<left>Programmed in Perl / MySQL by Felipe Gonzalez (felipe\@nic-nac-project.de)</left>";
print "</pre>\n";

print $cgi->end_html();


#end of the script code

