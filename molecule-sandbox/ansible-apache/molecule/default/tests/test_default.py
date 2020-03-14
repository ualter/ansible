import os
#import pytest

import testinfra.utils.ansible_runner

#
# Current Host Instance
testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')

##
## Ensure httpd and firewalld are installed
#@pytest.mark.parametrize('pkg', [
#  'httpd',
#  'firewalld'
#])
#def test_pkg(host, pkg):
#    package = host.package(pkg)
#
#    assert package.is_installed    
#
##
## Ensure the httpd and firewalld are running and enabled
#@pytest.mark.parametrize('svc', [
#  'httpd',
#  'firewalld'
#])
#def test_svc(host, svc):
#    service = host.service(svc)
#
#    assert service.is_running
#    assert service.is_enabled
#
##
## Ensure file exists and contains the content
#@pytest.mark.parametrize('file, content', [
#  ("/etc/firewalld/zones/public.xml", "<service name=\"http\"/>"),
#  ("/var/www/html/index.html", "Managed by Ansible")
#])
#def test_files(host, file, content):
#    file = host.file(file)
#
#    assert file.exists
#    assert file.contains(content)