# Transcrypt Example

This is meant to be a simple example of using Transcrypt to encrypt and decrypt files that are committed to Git. 

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
