#!/bin/bash
# Quick install of OpenLDAP for SupportLab.
# Loads example users and groups (prepared for CM and Hue LDAP auth configuration)
# Enables access and audit logs in /var/log/slapd
# Tested on CentOS 6 only!
# v0.4, 22.02.2016 by Georg Zigldrum

# Create temporary ldif file /tmp/ldap-config.ldif, will use this later to set password and create dc=lab,dc=support suffix
cat > /tmp/ldap-config.ldif << EOF
dn: olcDatabase={2}bdb,cn=config
changetype: modify
add: olcRootPW
olcRootPW: 

dn: olcDatabase={2}bdb,cn=config
changetype: modify
replace: olcSuffix
olcSuffix: dc=lab,dc=support

dn: olcDatabase={2}bdb,cn=config
changetype: modify
replace: olcRootDN
olcRootDN: cn=Manager,dc=lab,dc=support

dn: olcDatabase={2}bdb,cn=config
changetype: modify
replace: olcAccess
olcAccess: {0}to attrs=userPassword,shadowLastChange by dn="cn=Manager,dc=lab,dc=support" write by anonymous auth by self write by * none
olcAccess: {1}to dn.base="" by * read
olcAccess: {2}to * by dn="cn=Manager,dc=lab,dc=support" write by * read

dn: olcDatabase={1}monitor,cn=config
changetype: modify
replace: olcAccess
olcAccess: {0}to * by dn.base="gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth" read by dn.base="cn=Manager,dc=lab,dc=support" read by * none

dn: cn=module{0},cn=config
changetype: add
objectClass: olcModuleList
cn: module{0}
olcModulePath: /usr/lib64/openldap/
olcModuleLoad: auditlog.la

dn: olcOverlay=auditlog,olcDatabase={2}bdb,cn=config
changetype: add
objectClass: olcOverlayConfig
objectClass: olcAuditLogConfig
olcOverlay: auditlog
olcAuditlogFile: /var/log/slapd/auditlog.log

dn: cn=config
changetype: modify
add: olcLogFile
olcLogFile: /var/log/slapd/slapd.log

dn: cn=config
changetype: modify
add: olcLogLevel
olcLogLevel: stats
EOF

# Create temporary LDIF file /tmp/users-and-groups.ldif, will use this later to load the users/groups
cat > /tmp/users-and-groups.ldif << EOF
version: 1

dn: dc=lab,dc=support
changetype: add
objectClass: dcObject
objectClass: organization
dc: lab
o : lab

dn: cn=Manager,dc=lab,dc=support
changetype: add
objectclass: person
cn: Manager
sn: Manager

dn: ou=people,dc=lab,dc=support
changetype: add
objectClass: top
objectClass: organizationalUnit

dn: ou=groups,dc=lab,dc=support
changetype: add
objectClass: top
objectClass: organizationalUnit

dn: cn=user1,ou=people,dc=lab,dc=support
changetype: add
objectClass: top
objectClass: person
objectClass: organizationalPerson
objectClass: inetOrgPerson
cn: user1
uid: user1
sn: One
givenName: User
userPassword: cloudera

dn: cn=user2,ou=people,dc=lab,dc=support
changetype: add
objectClass: top
objectClass: person
objectClass: organizationalPerson
objectClass: inetOrgPerson
cn: user2
uid: user2
givenName: User
sn: Two
userPassword: cloudera

dn: cn=user3,ou=people,dc=lab,dc=support
changetype: add
objectClass: top
objectClass: person
objectClass: organizationalPerson
objectClass: inetOrgPerson
cn: user3
uid: user3
givenName: User
sn: Three
userPassword: cloudera

dn: cn=user4,ou=people,dc=lab,dc=support
changetype: add
objectClass: top
objectClass: person
objectClass: organizationalPerson
objectClass: inetOrgPerson
cn: user4
uid: user4
givenName: User
sn: Four
userPassword: cloudera

dn: cn=user5,ou=people,dc=lab,dc=support
changetype: add
objectClass: top
objectClass: person
objectClass: organizationalPerson
objectClass: inetOrgPerson
cn: user5
uid: user5
givenName: User
sn: Five
userPassword: cloudera

dn: cn=user6,ou=people,dc=lab,dc=support
changetype: add
objectClass: top
objectClass: person
objectClass: organizationalPerson
objectClass: inetOrgPerson
cn: user6
uid: user6
givenName: User
sn: Six
userPassword: cloudera

dn: cn=user7,ou=people,dc=lab,dc=support
changetype: add
objectClass: top
objectClass: person
objectClass: organizationalPerson
objectClass: inetOrgPerson
cn: user7
uid: user7
givenName: User
sn: Seven
userPassword: cloudera

dn: cn=user8,ou=people,dc=lab,dc=support
changetype: add
objectClass: top
objectClass: person
objectClass: organizationalPerson
objectClass: inetOrgPerson
cn: user8
uid: user8
givenName: User
sn: Eight
userPassword: cloudera

dn: cn=user9,ou=people,dc=lab,dc=support
changetype: add
objectClass: top
objectClass: person
objectClass: organizationalPerson
objectClass: inetOrgPerson
cn: user9
uid: user9
givenName: User
sn: Nine
userPassword: cloudera

dn: cn=user10,ou=people,dc=lab,dc=support
changetype: add
objectClass: top
objectClass: person
objectClass: organizationalPerson
objectClass: inetOrgPerson
cn: user10
uid: user10
givenName: User
sn: Ten
userPassword: cloudera

dn: cn=user11,ou=people,dc=lab,dc=support
changetype: add
objectClass: top
objectClass: person
objectClass: organizationalPerson
objectClass: inetOrgPerson
cn: user11
uid: user11
givenName: User
sn: Eleven
userPassword: cloudera

dn: cn=user12,ou=people,dc=lab,dc=support
changetype: add
objectClass: top
objectClass: person
objectClass: organizationalPerson
objectClass: inetOrgPerson
cn: user12
uid: user12
givenName: User
sn: Twelve
userPassword: cloudera

dn: cn=CM Bind User,ou=people,dc=lab,dc=support
changetype: add
objectClass: top
objectClass: person
objectClass: organizationalPerson
objectClass: inetOrgPerson
cn: CM Bind User
uid: CM Bind User
givenName: CM
sn: Bind User
userPassword: cloudera

dn: cn=Hue Bind User,ou=people,dc=lab,dc=support
changetype: add
objectClass: top
objectClass: person
objectClass: organizationalPerson
objectClass: inetOrgPerson
cn: Hue Bind User
uid: Hue Bind User
givenName: Bind User
sn: Hue
userPassword: cloudera

dn: cn=allusers,ou=groups,dc=lab,dc=support
changetype: add
cn: allusers
objectClass: groupOfNames
member: cn=user1,ou=people,dc=lab,dc=support
member: cn=user2,ou=people,dc=lab,dc=support
member: cn=user3,ou=people,dc=lab,dc=support
member: cn=user4,ou=people,dc=lab,dc=support
member: cn=user5,ou=people,dc=lab,dc=support
member: cn=user6,ou=people,dc=lab,dc=support
member: cn=user7,ou=people,dc=lab,dc=support
member: cn=user8,ou=people,dc=lab,dc=support
member: cn=user9,ou=people,dc=lab,dc=support
member: cn=user10,ou=people,dc=lab,dc=support
member: cn=user11,ou=people,dc=lab,dc=support
member: cn=user12,ou=people,dc=lab,dc=support
member: cn=CM Bind User,ou=people,dc=lab,dc=support
member: cn=Hue Bind User,ou=people,dc=lab,dc=support

dn: cn=CM LDAP Full Administrator Group,ou=groups,dc=lab,dc=support
changetype: add
cn: CM LDAP Full Administrator Group
objectClass: groupOfNames
member: cn=user1,ou=people,dc=lab,dc=support

dn: cn=CM LDAP User Administrator Group,ou=groups,dc=lab,dc=support
changetype: add
cn: CM LDAP User Administrator Group
objectClass: groupOfNames
member: cn=user2,ou=people,dc=lab,dc=support

dn: cn=CM LDAP Cluster Administrator Group,ou=groups,dc=lab,dc=support
changetype: add
cn: CM LDAP Cluster Administrator Group
objectClass: groupOfNames
member: cn=user3,ou=people,dc=lab,dc=support

dn: cn=CM LDAP BDR Administrator Group,ou=groups,dc=lab,dc=support
changetype: add
cn: CM LDAP BDR Administrator Group
objectClass: groupOfNames
member: cn=user4,ou=people,dc=lab,dc=support

dn: cn=CM LDAP Configurator Group,ou=groups,dc=lab,dc=support
changetype: add
cn: CM LDAP Configurator Group
objectClass: groupOfNames
member: cn=user5,ou=people,dc=lab,dc=support

dn: cn=CM LDAP Navigator Administrator Group,ou=groups,dc=lab,dc=support
changetype: add
cn: CM LDAP Navigator Administrator Group
objectClass: groupOfNames
member: cn=user6,ou=people,dc=lab,dc=support

dn: cn=CM LDAP Operator Group,ou=groups,dc=lab,dc=support
changetype: add
cn: CM LDAP Operator Group
objectClass: groupOfNames
member: cn=user7,ou=people,dc=lab,dc=support

dn: cn=CM LDAP Limited Operator Group,ou=groups,dc=lab,dc=support
changetype: add
cn: CM LDAP Limited Operator Group
objectClass: groupOfNames
member: cn=user8,ou=people,dc=lab,dc=support

dn: cn=CM LDAP Auditor Group,ou=groups,dc=lab,dc=support
changetype: add
cn: CM LDAP Auditor Group
objectClass: groupOfNames
member: cn=user9,ou=people,dc=lab,dc=support

dn: cn=CM LDAP Key Administrator Group,ou=groups,dc=lab,dc=support
changetype: add
cn: CM LDAP Key Administrator Group
objectClass: groupOfNames
member: cn=user10,ou=people,dc=lab,dc=support

dn: cn=Hue all users,ou=groups,dc=lab,dc=support
changetype: add
cn: Hue all users
objectClass: groupOfNames
member: cn=user1,ou=people,dc=lab,dc=support
member: cn=user2,ou=people,dc=lab,dc=support
member: cn=user3,ou=people,dc=lab,dc=support
member: cn=user4,ou=people,dc=lab,dc=support
member: cn=user5,ou=people,dc=lab,dc=support
member: cn=user6,ou=people,dc=lab,dc=support
member: cn=user7,ou=people,dc=lab,dc=support
member: cn=user8,ou=people,dc=lab,dc=support
member: cn=user9,ou=people,dc=lab,dc=support
member: cn=user10,ou=people,dc=lab,dc=support
member: cn=user11,ou=people,dc=lab,dc=support
member: cn=user12,ou=people,dc=lab,dc=support

dn: cn=Hue Super Users,ou=groups,dc=lab,dc=support
changetype: add
cn: Hue Super Users
objectClass: groupOfNames
member:
EOF


# Install OpenLDAP
yum -y install openldap-servers openldap-clients
cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG
chown ldap. /var/lib/ldap/DB_CONFIG 
service slapd start

# Create logging directory and adjust permissions
mkdir /var/log/slapd
chmod 755 /var/log/slapd/
chown ldap:ldap /var/log/slapd/

# Create a new password for the admin user cn=Manager, dc=lab,dc=support
NEW_PASSWORD=`slappasswd -s cloudera`

# Write the new password (plus config) into /tmp/prepare-ldap-server.ldif
sed "s|.*olcRootPW:.*|olcRootPW: $NEW_PASSWORD|g" /tmp/ldap-config.ldif > /tmp/prepare-ldap-server.ldif

# Set the new configuration over ldap
ldapmodify -Y EXTERNAL -H ldapi:/// -f /tmp/prepare-ldap-server.ldif

# Load users/groups over ldap
ldapadd -x -D "cn=Manager,dc=lab,dc=support" -w cloudera -f /tmp/users-and-groups.ldif

### Add LDAP logging 
echo "### Add LDAP logging" > /etc/rsyslog.d/slapd.conf
echo "local4.*                                                /var/log/slapd/slapd.log" >> /etc/rsyslog.d/slapd.conf

# Configure CM for LDAP authentication
curl -s -X PUT -u admin:admin -H "Content-Type:application/json" -d '{"items":[{"name":"AUTH_BACKEND_ORDER","value":"DB_THEN_LDAP"}]}' 'http://localhost:7180/api/v11/cm/config' > /dev/null
curl -s -X PUT -u admin:admin -H "Content-Type:application/json" -d '{"items":[{"name":"LDAP_TYPE","value":"LDAP"}]}' 'http://localhost:7180/api/v11/cm/config' > /dev/null
curl -s -X PUT -u admin:admin -H "Content-Type:application/json" -d '{"items":[{"name":"LDAP_BIND_DN","value":"cn=CM Bind User,ou=people,dc=lab,dc=support"}]}' 'http://localhost:7180/api/v11/cm/config' > /dev/null
curl -s -X PUT -u admin:admin -H "Content-Type:application/json" -d '{"items":[{"name":"LDAP_BIND_PW","value":"cloudera"}]}' 'http://localhost:7180/api/v11/cm/config' > /dev/null
curl -s -X PUT -u admin:admin -H "Content-Type:application/json" -d '{"items":[{"name":"LDAP_URL","value":"ldap://localhost:389/"}]}' 'http://localhost:7180/api/v11/cm/config' > /dev/null
curl -s -X PUT -u admin:admin -H "Content-Type:application/json" -d '{"items":[{"name":"LDAP_USER_SEARCH_BASE","value":"ou=people,dc=lab,dc=support"}]}' 'http://localhost:7180/api/v11/cm/config' > /dev/null
curl -s -X PUT -u admin:admin -H "Content-Type:application/json" -d '{"items":[{"name":"LDAP_USER_SEARCH_FILTER","value":"cn={0}"}]}' 'http://localhost:7180/api/v11/cm/config' > /dev/null
curl -s -X PUT -u admin:admin -H "Content-Type:application/json" -d '{"items":[{"name":"LDAP_GROUP_SEARCH_BASE","value":"ou=groups,dc=lab,dc=support"}]}' 'http://localhost:7180/api/v11/cm/config' > /dev/null
curl -s -X PUT -u admin:admin -H "Content-Type:application/json" -d '{"items":[{"name":"LDAP_GROUP_SEARCH_FILTER","value":"member={0}"}]}' 'http://localhost:7180/api/v11/cm/config' > /dev/null
curl -s -X PUT -u admin:admin -H "Content-Type:application/json" -d '{"items":[{"name":"LDAP_ADMIN_GROUPS","value":"CM LDAP Full Administrator Group"}]}' 'http://localhost:7180/api/v11/cm/config' > /dev/null
curl -s -X PUT -u admin:admin -H "Content-Type:application/json" -d '{"items":[{"name":"LDAP_USER_ADMIN_GROUPS","value":"CM LDAP User Administrator Group"}]}' 'http://localhost:7180/api/v11/cm/config' > /dev/null
curl -s -X PUT -u admin:admin -H "Content-Type:application/json" -d '{"items":[{"name":"LDAP_OPERATOR_GROUPS","value":"CM LDAP Operator Group"}]}' 'http://localhost:7180/api/v11/cm/config' > /dev/null
curl -s -X PUT -u admin:admin -H "Content-Type:application/json" -d '{"items":[{"name":"LDAP_NAVIGATOR_ADMIN_GROUPS","value":"CM LDAP Navigator Administrator Group"}]}' 'http://localhost:7180/api/v11/cm/config' > /dev/null
curl -s -X PUT -u admin:admin -H "Content-Type:application/json" -d '{"items":[{"name":"LDAP_LIMITED_GROUPS","value":"CM LDAP Limited Operator Group"}]}' 'http://localhost:7180/api/v11/cm/config' > /dev/null
curl -s -X PUT -u admin:admin -H "Content-Type:application/json" -d '{"items":[{"name":"LDAP_CONFIGURATOR_GROUPS","value":"CM LDAP Configurator Group"}]}' 'http://localhost:7180/api/v11/cm/config' > /dev/null
curl -s -X PUT -u admin:admin -H "Content-Type:application/json" -d '{"items":[{"name":"LDAP_CLUSTER_ADMIN_GROUPS","value":"CM LDAP Cluster Administrator Group"}]}' 'http://localhost:7180/api/v11/cm/config' > /dev/null
curl -s -X PUT -u admin:admin -H "Content-Type:application/json" -d '{"items":[{"name":"LDAP_BDR_ADMIN_GROUPS","value":"CM LDAP BDR Administrator Group"}]}' 'http://localhost:7180/api/v11/cm/config' > /dev/null
curl -s -X PUT -u admin:admin -H "Content-Type:application/json" -d '{"items":[{"name":"LDAP_AUDITOR_GROUPS","value":"CM LDAP Auditor Group"}]}' 'http://localhost:7180/api/v11/cm/config' > /dev/null

# Restart services
service slapd restart
service rsyslog restart

# Summarize LDAP connection information
echo "===================================================================="
echo -e "Hostname:\t\t" `hostname -f`
echo -e "Port:\t\t\t 389"
echo -e "Suffix:\t\t\t dc=lab,dc=support"
echo -e "Admin user:\t\t cn=Manager,dc=lab,dc=support"
echo -e "Admin user password:\t cloudera"
echo -e "Users:\t\t\t user1 ... user9"
echo -e "Users password:\t\t cloudera"
echo "===================================================================="
echo ""
echo "Start looking up LDAP data using e.g."
echo "ldapsearch -x -LLL -D \"cn=Manager,dc=lab,dc=support\" -w cloudera -b \"dc=lab,dc=support\" objectclass=*" 
echo "ldapsearch -x -LLL -D \"cn=Manager,dc=lab,dc=support\" -w cloudera -b \"dc=lab,dc=support\" uid=user9" 
echo "ldapsearch -x -LLL -D \"cn=Manager,dc=lab,dc=support\" -w cloudera -b \"dc=lab,dc=support\" member=cn=user1,ou=people,dc=lab,dc=support"

# To uninstall OpenLDAP, run these commands:
# service slapd stop && yum -y erase openldap-servers openldap-clients && rm -rf /var/lib/ldap/ /etc/openldap /var/log/slapd/ /etc/rsyslog.d/slapd.conf && service rsyslog restart
