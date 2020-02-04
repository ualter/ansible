```
$ ansible-playbook -i hosts test-ansible.yml
```

### Troubleshooting
```
# Error
--> Failed to import the required Python library (botocore or boto3) on
# Solution
$ pip install --user boto3 botocore
```