# Transcrypt Example

This is meant to be a simple example of using Transcrypt to encrypt and decrypt files that are committed to Git. 

[Transcrypt](https://github.com/elasticdog/transcrypt) script to configure transparent encryption of sensitive files 
stored in a Git repository. Files that you choose will be automatically encrypted when you commit them, and 
automatically decrypted when you check them out. The process will degrade gracefully, so even people without your 
encryption password can safely commit changes to the repository's non-encrypted files.

This allows you to configure a repository with a single secret key that can be shared with collaborators, while
keeping sensitive information secure from unauthorized access. Since Transcrypt is a Git filter, it is transparent
and integrates with things like git diff, git merge, and git blame, etc.  The diffs on your local system will appear
decrypted, but the files will be encrypted in the repository and in pull requests.

## Configuration
1. Install Transcrypt
```bash
sudo wget -O /usr/local/bin/transcrypt https://raw.githubusercontent.com/elasticdog/transcrypt/v2.2.3/transcrypt && sudo chmod +x /usr/local/bin/transcrypt
```

2. Clone this repository
```bash
git clone https://github.com/chris-dickson/transcrypt-testing.git
```

3. Configure Transcrypt
```bash
transcrypt -c aes-256-cbc -p '+QhP+iJf6huL/BJ3BDXPbjKY/gubnlPHAZuRv0eQ'
```
You should now see the decrypted files in the repository. Test by running
```bash
./super-secret-command.sh
```

## Adding a new file
Run the following command to encrypt a file and add it to the repository
```bash
./add-secret.sh <file>
```
and commit the changes.

## Caveats
- Do not rename secret files after encrypting them. This will cause the decryption to fail and/or the file to be committed in plaintext by mistake. To rename a file, remove the entry from the `.gitattributes` file, rename the file, and re-add it with the above command.
- If using SmartGit, you will need to add Transcrypt to your path. Add the following line to `~/.smartgit/smartgit.vmoptions`
```
path=/usr/local/bin/
```
Similar limitations may exist for external Git clients