# Configuration Management
The solution is implemented with a single Ansible playbook that checkouts the repo, build, push and then run the Docker image for the Python application.

## Requirements
- Python version above 3.8 would suffice.
- The `requirements.txt` file in this directory contains the required Ansible version. Run
```sh
pip install -r requirements.txt
```
- Make sure that Docker is running on your local machine.
- Ansible vault pass - ask for it :) 

## Ansible playbook
 The playbook utilises the following variables:

- `app_dir` - the directory where the app code will be checked-out
- `repo_version` - a valid branch, hash or tag of the app code - e.g. `HEAD`, `my-feature-branch` 
- `image_name` -  the name of your image without the tag
- `image_tag` - the tag to be used for your image
- `listen_port` - the listening port you're binding your app to

### Example usage:
Considering the execution dir is the root of the project:
```sh
ansible-playbook -e "repo_version=development" ansible/playbook.yml --ask-vault-pass
```

For debugging purposes consider increasing output verbosity like so:
```sh
ansible-playbook ansible/playbook.yml -vvv --ask-vault-pass
```