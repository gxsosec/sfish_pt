#
# (C) Tenable Network Security, Inc.
#



include("compat.inc");

if (description)
{
  script_id(25759);
  script_version("$Revision: 1.9 $");

  script_cve_id("CVE-2007-3780", "CVE-2007-3781", "CVE-2007-3782");
  script_bugtraq_id(25017);
  script_xref(name:"OSVDB", value:"36732");
  script_xref(name:"OSVDB", value:"37782");
  script_xref(name:"OSVDB", value:"37783");

  script_name(english:"MySQL Community Server 5.0 < 5.0.45 Multiple Vulnerabilities");
  script_summary(english:"Checks version of MySQL Community Server");

 script_set_attribute(attribute:"synopsis", value:
"The remote database server is susceptible to multiple attacks." );
 script_set_attribute(attribute:"description", value:
"The version of MySQL Community Server installed on the remote host
reportedly is affected by a denial of service vulnerability that can
lead to a server crash with a specially-crafted password packet. 

It is also affected by a privilege escalation vulnerability because
'CREATE TABLE LIKE' does not require any privileges on the source
table, which allows an attacker to create arbitrary tables using the
affected application." );
 script_set_attribute(attribute:"see_also", value:"http://dev.mysql.com/doc/refman/5.0/en/releasenotes-cs-5-0-45.html" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to MySQL Community Server version 5.0.45 or later." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P" );
script_end_attributes();

 
  script_category(ACT_GATHER_INFO);
  script_family(english:"Databases");

  script_copyright(english:"This script is Copyright (C) 2007-2009 Tenable Network Security, Inc.");

  script_dependencies("find_service1.nasl");
  script_require_ports("Services/mysql", 3306);

  exit(0);
}


include("global_settings.inc");
include("mysql_func.inc");


# nb: banner checks of open-source software are prone to false-
#     positives so only run the check if reporting is paranoid.
#if (report_paranoia < 2) exit(0);


port = get_kb_item("Services/mysql");
if (!port) port = 3306;
if (!get_tcp_port_state(port)) exit(0);

soc = open_sock_tcp(port);
if (!soc) exit(0);


if (mysql_open(soc:soc) == 1)
{
  variant = mysql_get_variant();
  ver = mysql_get_version();

  if ("Community" >< variant && ver =~ "^5\.0\.([0-9]|[1-3][0-9]|4[0-4])($|[^0-9])")
  {
    report = string(
      "The remote MySQL Community Server's version is :\n",
      "\n",
      "  ", ver, "\n"
    );
    security_warning(port:port, extra:report);
  }
}
mysql_close();
