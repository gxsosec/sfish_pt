#
# This script was written by David Maciejak <david dot maciejak at kyxar dot fr>
#
# This script is released under the GNU GPLv2
#
# Changes by Tenable:
# - Revised plugin title (1/02/2009)


include("compat.inc");

if(description)
{
script_id(20252);

script_cve_id("CVE-2005-3980");
script_bugtraq_id(15676);
script_xref(name:"OSVDB", value:"21386");

script_version("$Revision: 1.13 $");
script_name(english:"Trac Ticket Query Module group Parameter SQL Injection");


 script_set_attribute(attribute:"synopsis", value:
"The remote web server contains a CGI script that is affected by a SQL
injection flaw." );
 script_set_attribute(attribute:"description", value:
"The remote host is running Trac, an enhanced wiki and issue tracking
system for software development projects written in Python. 

The remote version of this software is prone to a SQL injection flaw
through the ticket query module due to 'group' parameter is not
properly sanitized." );
 script_set_attribute(attribute:"see_also", value:"http://www.securityfocus.com/archive/1/418294/30/0/threaded" );
 script_set_attribute(attribute:"see_also", value:"http://projects.edgewall.com/trac/wiki/ChangeLog" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to Trac version 0.9.1 or later." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P" );

script_end_attributes();


script_summary(english:"Checks for SQL injection flaw in Trac");
script_category(ACT_GATHER_INFO);
script_copyright(english:"This script is Copyright (C) 2005-2009 David Maciejak");
script_family(english:"CGI abuses");
script_exclude_keys("Settings/disable_cgi_scanning");
script_require_ports("Services/www");
script_dependencies("http_version.nasl");
exit(0);
}

include("global_settings.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("misc_func.inc");

port = get_http_port(default:80);
if (get_kb_item("Services/www/"+port+"/embedded")) exit(0);


# Loop through directories.
if (thorough_tests) dirs = list_uniq(make_list("/trac", cgi_dirs()));
else dirs = make_list(cgi_dirs());

foreach dir (dirs)
{
	buf = http_get(item:string(dir,"/query?group=--"), port:port);
	r = http_keepalive_send_recv(port:port, data:buf, bodyonly:1);
	if( r == NULL )exit(0);
	if("Trac detected an internal error" >< r && egrep(pattern:"<title>Oops - .* - Trac<", string:r))
	{
		security_hole(port);
		set_kb_item(name: 'www/'+port+'/SQLInjection', value: TRUE);
		exit(0);
	}
}
