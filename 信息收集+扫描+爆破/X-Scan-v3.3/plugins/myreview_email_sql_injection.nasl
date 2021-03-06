#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if (description)
{
  script_id(22413);
  script_version("$Revision: 1.9 $");

  script_cve_id("CVE-2006-4957");
  script_bugtraq_id(20105);
  script_xref(name:"OSVDB", value:"29028");

  script_name(english:"MyReview Admin.php email Parameter SQL Injection");
  script_summary(english:"Checks for SQL injection flaw in MyReview");

 script_set_attribute(attribute:"synopsis", value:
"The remote web server contains a PHP script that is prone to a SQL
injection attack." );
 script_set_attribute(attribute:"description", value:
"The remote host is running MyReview, an open-source paper submission
and review web application. 

The version of MyReview installed on the remote host fails to properly
sanitize input to the 'email' parameter before using it in the
'GetMember' function in a database query.  Regardless of PHP's
'magic_quotes_gpc' and 'register_globals' settings, an unauthenticated
attacker may be able to exploit this issue to uncover sensitive
information such as password hashes, modify data, launch attacks
against the underlying database, etc." );
 script_set_attribute(attribute:"see_also", value:"http://milw0rm.com/exploits/2397" );
 script_set_attribute(attribute:"solution", value:
"Unknown at this time." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P" );
script_end_attributes();


  script_category(ACT_ATTACK);
  script_family(english:"CGI abuses");

  script_copyright(english:"This script is Copyright (C) 2006-2009 Tenable Network Security, Inc.");

  script_dependencies("http_version.nasl");
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_require_ports("Services/www", 80);

  exit(0);
}


include("global_settings.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("misc_func.inc");


port = get_http_port(default:80);
if (get_kb_item("Services/www/"+port+"/embedded")) exit(0);
if (!can_host_php(port:port)) exit(0);
if (get_kb_item("www/no404/" + port)) exit(0);


# Loop through various directories.
if (thorough_tests) dirs = list_uniq(make_list("/myreview", cgi_dirs()));
else dirs = make_list(cgi_dirs());

foreach dir (dirs)
{
  # Make sure the affected script exists.
  url = string(dir, "/Admin.php");
  req = http_get(item:url, port:port);
  res = http_keepalive_send_recv(port:port, data:req, bodyonly:TRUE);
  if (isnull(res)) exit(0);

  # If it does...
  if (
    'Copyright: Philippe Rigaux' &&
    ' NAME="email" VALUE=""' >< res &&
    ' NAME="motDePasse" VALUE=""' >< res
  )
  {
    # Try to exploit the flaw to generate a syntax error.
    email = string("'", SCRIPT_NAME);
    postdata = string(
      "email=", email, "&",
      "motDePasse=a&",
      "ident=Log+in"
    );
    req = string(
      "POST ", url, " HTTP/1.1\r\n",
      "Host: ", get_host_name(), "\r\n",
      "User-Agent: ", get_kb_item("global_settings/http_user_agent"), "\r\n",
      "Content-Type: application/x-www-form-urlencoded\r\n",
      "Content-Length: ", strlen(postdata), "\r\n",
      "\r\n",
      postdata
    );
    res = http_keepalive_send_recv(port:port, data:req, bodyonly:TRUE);
    if (isnull(res)) exit(0);

    # There's a problem if we see an error message with our script name.
    if (string("query: SELECT * FROM PCMember WHERE email = '", email, "'") >< res)
    {
      security_hole(port);
      set_kb_item(name: 'www/'+port+'/SQLInjection', value: TRUE);
      exit(0);
    }
  }
}
